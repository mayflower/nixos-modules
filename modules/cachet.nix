{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.services.cachet;

  pgSuperUser = config.services.postgresql.superUser;

  envfile = pkgs.writeText "cachet-env" ''
    APP_ENV="production"
    APP_DEBUG="${boolToString cfg.debug}"
    APP_URL="${cfg.hostName}"
    APP_TIMEZONE="UTC"
    APP_KEY="${cfg.appKey}"
    DEBUGBAR_ENABLED="${boolToString cfg.debug}"
    DB_DRIVER="${cfg.database.driver}"
    DB_HOST="${cfg.database.host}"
    DB_UNIX_SOCKET="null"
    DB_DATABASE="${cfg.database.dbname}"
    DB_USERNAME="${cfg.database.user}"
    DB_PASSWORD="${cfg.database.password}"
    DB_PORT="null"
    DB_PREFIX="null"
    CACHE_DRIVER="file"
    SESSION_DRIVER="file"
    QUEUE_DRIVER="sync"
    CACHET_BEACON="true"
    CACHET_EMOJI="false"
    CACHET_AUTO_TWITTER="true"
    MAIL_DRIVER="log"
    MAIL_HOST="null"
    MAIL_PORT="null"
    MAIL_USERNAME="null"
    MAIL_PASSWORD="null"
    MAIL_ADDRESS="null"
    MAIL_NAME="null"
    MAIL_ENCRYPTION="tls"
    REDIS_HOST="null"
    REDIS_DATABASE="null"
    REDIS_PORT="null"
    GITHUB_TOKEN="null"
    NEXMO_KEY="null"
    NEXMO_SECRET="null"
    NEXMO_SMS_FROM="Cachet"
    TRUSTED_PROXIES=""
  '';

in
{
  options.services.cachet = {
    enable = mkEnableOption "Cachet, the open source status page system";

    debug = mkEnableOption "debug mode";

    hostName = mkOption {
      type = types.string;
      description = "";
    };

    dataDir = mkOption {
      type = types.path;
      default = "/var/lib/cachet";
      description = "";
    };

    appKey = mkOption {
      type = types.string;
      description = "Laravel appKey: must be a random, 32-character string";
    };

    database = {
      driver = mkOption {
        type = types.string;
        default = "pgsql";
        description = "";
      };

      host = mkOption {
        type = types.string;
        default = "localhost";
        description = "";
      };

      user = mkOption {
        type = types.string;
        default = "cachet";
        description = "";
      };

      password = mkOption {
        type = types.string;
        description = "";
      };

      dbname = mkOption {
        type = types.string;
        default = "cachet";
        description = "";
      };
    };
  };

  config = mkIf cfg.enable {

    system.activationScripts.cachet = ''
      mkdir -p ${cfg.dataDir}/cachet-home

      if ! test -e "${cfg.dataDir}/db_created"; then
        if [ "${cfg.database.host}" = "localhost" ]; then
          #${pkgs.sudo}/bin/sudo -u ${pgSuperUser} psql postgres -c "CREATE ROLE ${cfg.database.user} WITH LOGIN NOCREATEDB NOCREATEROLE ENCRYPTED PASSWORD '${cfg.database.password}'"
          ${config.services.postgresql.package}/bin/psql postgres -c "CREATE ROLE ${cfg.database.user} WITH LOGIN NOCREATEDB NOCREATEROLE ENCRYPTED PASSWORD '${cfg.database.password}'"
          #${pkgs.sudo}/bin/sudo -u ${pgSuperUser} ${config.services.postgresql.package}/bin/createdb --owner ${cfg.database.user} ${cfg.database.dbname}
          ${config.services.postgresql.package}/bin/createdb --owner ${cfg.database.user} ${cfg.database.dbname}

          touch ${cfg.dataDir}/db_created
        fi
      fi

      ${pkgs.rsync}/bin/rsync -a ${pkgs.cachet}/ ${cfg.dataDir}/cachet-home
      ${pkgs.rsync}/bin/rsync -a ${envfile} ${cfg.dataDir}/cachet-home/.env
      chown -R nginx:nginx ${cfg.dataDir}/cachet-home
      chmod -R u+w ${cfg.dataDir}/cachet-home

      # upgrade steps
      cd ${cfg.dataDir}/cachet-home/
      ${pkgs.php}/bin/php artisan down
      ${pkgs.php}/bin/php artisan app:update
      ${pkgs.php}/bin/php artisan up
      ${pkgs.php}/bin/php artisan config:cache
    '';

    networking.firewall.allowedTCPPorts = [ 80 443 ];

    services.postgresql = {
      enable = true;
    };

    services.nginx.enable = true;
    services.nginx.virtualHosts."${cfg.hostName}" = {
      root = "${cfg.dataDir}/cachet-home/public";
      forceSSL = true;
      enableACME = true;
      basicAuth = { "mayflower" = "best4all"; };
      locations = {
        "/".extraConfig = ''
          add_header Strict-Transport-Security max-age=15768000;
          try_files $uri /index.php$is_args$args;
        '';
        "~ \.php$".extraConfig = ''
          include ${config.services.nginx.package}/conf/fastcgi_params;
          fastcgi_pass unix:/run/phpfpm/cachet;
          fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
          fastcgi_index index.php;
          fastcgi_keep_conn on;
          add_header Strict-Transport-Security max-age=15768000;
        '';
      };
    };

    services.phpfpm.poolConfigs.cachet = ''
      listen = /run/phpfpm/cachet
      listen.owner = nginx
      listen.group = nginx
      listen.mode = 0600
      user = nginx
      group = nginx
      pm = dynamic
      pm.max_children = 4
      pm.start_servers = 1
      pm.min_spare_servers = 1
      pm.max_spare_servers = 2
      pm.max_requests = 0
    '';
  };
}