/* A small release file, with few packages to be built.  The aim is to reduce
   the load on Hydra when testing the `stdenv-updates' branch. */

{ nixpkgs
, supportedSystems ? [ "x86_64-linux" ]
}:

with import "${nixpkgs}/pkgs/top-level/release-lib.nix" { inherit supportedSystems; };

let
  pkgs = import nixpkgs {};
  recursiveUpdate = pkgs.lib.recursiveUpdate;

  kernelPackages = {
    acpi_call = all;
    bcc = all;
    jool = all;
    kernel = all;
    perf = all;
    wireguard = all;
    zfs = all;
    cpupower = all;
  };

  kernelPackages_virtualbox = {
    virtualboxGuestAdditions = all;
    virtualbox = all;
  };

in

(mapTestOn {
  ack = all;
  acpi = all;
  acpid = all;
  acpitool = all;
  aircrack-ng = all;
  alsa-firmware = all;
  alsaLib = all;
  alsaPluginWrapper = all;
  alsaPlugins = all;
  alsaTools = all;
  alsaUtils = all;
  androidenv = {
    platformTools = all;
  };
  android-studio = all;
  androidsdk = all;
  apparmor-utils = all;
  arandr = all;
  arduino = all;
  arp-scan = all;
  arx-libertatis = all;
  aspell = all;
  at = all;
  atom = all;
  atop = all;
  audacity = all;
  autoconf = all;
  autocutsel = all;
  automake = all;
  autossh = all;
  avahi = all;
  avrdude = all;
  awesome = all;
  babeld = all;
  bash = all;
  bashInteractive = all;
  bc = all;
  beets = all;
  bind = all;
  binutils = all;
  bird = all;
  bird6 = all;
  blender = all;
  blobby = all;
  blueman = all;
  bluez = all;
  bogofilter = all;
  borgbackup = all;
  bridge-utils = all;
  bruteforce-luks = all;
  bsdgames = all;
  bsdiff = all;
  bundix = all;
  bundler_HEAD = all;
  busybox = all;
  byobu = all;
  bzip2 = all;
  cabal2nix = all;
  caddy = all;
  calibre = all;
  cargo = all;
  casperjs = all;
  ccid = all;
  cgmanager = all;
  checksec = all;
  checkstyle = all;
  chromium = all;
  chrony = all;
  cifs_utils = all;
  cipherscan = all;
  clamav = all;
  claws-mail = all;
  cmake = all;
  collectd = all;
  collectdMinimal = all;
  colordiff = all;
  compass = all;
  compton = all;
  compton-git = all;
  coreutils = all;
  coturn = all;
  couchpotato = all;
  cowsay = all;
  cpio = all;
  cpufrequtils = all;
  cpulimit = all;
  crackxls = all;
  cron = all;
  cryptsetup = all;
  cups = all;
  cups_filters = all;
  cups-pk-helper = all;
  curl = all;
  darkice = all;
  dash = all;
  dbus = all;
  ddrescue = all;
  debootstrap = all;
  dhcp = all;
  dhcpcd = all;
  di = all;
  diffutils = all;
  disnix = all;
  dmenu = all;
  dmidecode = all;
  dnsmasq = all;
  dnsutils = all;
  docker = all;
  docker-distribution = all;
  docker-machine = all;
  dosbox = all;
  dovecot = all;
  dovecotWithPgSQL = all;
  dovecot_antispam = all;
  dovecot_pigeonhole = all;
  dpkg = all;
  e2fsprogs = all;
  eduke32 = all;
  efibootmgr = all;
  efivar = all;
  elasticsearch = all;
  elasticsearch2 = all;
  electricsheep = all;
  emacs25 = gtkSupported;
  emby = all;
  enscript = all;
  errbot = all;
  etcd = all;
  ethtool = all;
  evince = all;
  exfat = all;
  f2fs-tools = all;
  fail2ban = all;
  fastd = all;
  fd = all;
  feh = all;
  file = all;
  filebeat = all;
  filezilla = all;
  findutils = all;
  firefox = all;
  flac = all;
  flex = all;
  flvstreamer = all;
  foomatic-filters = all;
  fortune = all;
  fping = all;
  freeciv = all;
  gajim = all;
  gawk = all;
  gcc = all;
  gettext = all;
  gimp = all;
  gist = all;
  git = all;
  gitAndTools.diff-so-fancy = all;
  gitAndTools.git-extras = all;
  gitAndTools.gitFull = all;
  gitAndTools.gitflow = all;
  gitAndTools.hub = all;
  gitAndTools.tig = all;
  gitMinimal = all;
  gitlab = all;
  gitlab-runner = all;
  gitlab-runner_1_11 = all;
  gitlab-shell = all;
  gitlab-workhorse = all;
  glibc = all;
  glibcLocales = all;
  global = all;
  gmp = all;
  gmpc = all;
  gnome2.gconfmm = all;
  gnome2.libglademm = all;
  gnome3.dconf = all;
  gnome3.gedit = all;
  gnome3.gnome-calendar = all;
  gnome3.gnome-online-miners = all;
  gnome3.gnome-photos = all;
  gnome3.gnome-software = all;
  gnome3.gnome-weather = all;
  gnome3.gnome_settings_daemon = all;
  gnufdisk = all;
  gnugrep = all;
  gnum4 = all;
  gnumake = all;
  gnupatch = all;
  gnupg = all;
  gnuplot = allBut cygwin;
  gnuradio-with-packages = all;
  gnused = all;
  gnutar = all;
  gnutls = all;
  go = all;
  go2nix = all;
  go_1_6 = all;
  go_1_7 = all;
  gocode = all;
  gogoclient = all;
  gox = all;
  go-mtpfs = all;
  gparted = all;
  gperftools = all;
  gqrx = all;
  grafana = all;
  graphicsmagick = all;
  graphviz = all;
  graylog = all;
  grub2 = all;
  gsasl = all;
  gsl = all;
  gti = all;
  gtk-engine-murrine = all;
  gtk_engines = all;
  guile = all;
  gutenprint = all;
  gzip = all;
  harfbuzz = all;
  haveged = all;
  hddtemp = all;
  hdparm = all;
  heartbeat = all;
  hedgewars = all;
  hello = all;
  hexedit = all;
  horst = all;
  host = all;
  hostapd = all;
  hping = all;
  hplip = all;
  htop = all;
  hydra = all;
  i3 = all;
  i3-gaps = all;
  i3lock = all;
  i3status = all;
  iana_etc = all;
  icecast = all;
  icedtea_web = all;
  icewm = all;
  idea.idea-community = all;
  idea.pycharm-community = all;
  idle3tools = all;
  idutils = all;
  iftop = all;
  imagemagick = all;
  inetutils = all;
  inkscape = all;
  inotify-tools = all;
  intel-gpu-tools = all;
  iotop = all;
  iperf = all;
  iperf2 = all;
  iperf3 = all;
  ipfs = all;
  ipmitool = all;
  iproute = all;
  iputils = all;
  irqbalance = all;
  jack2Full = all;
  jackett = all;
  jnettop = all;
  jool-cli = all;
  jq = all;
  jre = all;
  jwhois = all;
  kbd = all;
  kea = all;
  kismet = all;
  kubernetes = all;
  kvm = all;
  lame = all;
  latencytop = all;
  less = all;
  letsencrypt = all;
  lftp = all;
  libcap = linux;
  libcgroup = all;
  libdbiDrivers = all;
  libinput = all;
  libmediainfo = all;
  libnotify = all;
  libotr = all;
  libreoffice = all;
  libressl = all;
  libseccomp = all;
  libtool = all;
  libtool_2 = all;
  libtxc_dxtn = all;
  libtxc_dxtn_s2tc = all;
  libvirt = all;
  libxml2 = all;
  libxslt = all;
  libyaml = all;
  libyamlcpp = all;
  libzip = all;
  links2 = all;
  lldpd = all;
  lm_sensors = all;
  lolcat = all;
  lout = all;
  lsof = all;
  ltrace = all;
  lua52Packages.lua = all;
  lua52Packages.luarocks = all;
  lua52Packages.vicious = all;
  lvm2 = all;
  lxappearance = all;
  lxc = all;
  lxd = all;
  lynx = all;
  lzma = all;
  mailutils = all;
  man = all;
  manpages = all;
  matrix-synapse = all;
  mc = all;
  mcabber = all;
  mcron = all;
  mdadm = all;
  memtest86plus = all;
  menu-cache = all;
  mercurial = all;
  mesa = mesaPlatforms;
  mesa_drivers = all;
  metricbeat = all;
  minetest = all;
  mingetty = all;
  minikube = all;
  mirage = all;
  mk = all;
  mkpasswd = all;
  mktemp = all;
  moc = all;
  module_init_tools = all;
  mongodb = all;
  monodevelop = all;
  monotone = all;
  moonlight-embedded = all;
  mopidy = all;
  mopidy-moped = all;
  mopidy-musicbox-webclient = all;
  mopidy-soundcloud = all;
  mosh = all;
  mpd = all;
  mpg321 = all;
  mplayer = all;
  mpv = all;
  msf = all;
  mtr = all;
  mupdf = all;
  mutt = all;
  mysql.server = all;
  nano = all;
  ncdu = all;
  ncftp = all;
  ncmpcpp = all;
  neo4j = all;
  netcat = all;
  nethack = all;
  netpbm = all;
  networkmanager = all;
  nfs-utils = all;
  nginx = all;
  nginxUnstable = all;
  ngrep = all;
  nix = all;
  nix-generate-from-cpan = all;
  nix-repl = all;
  nixUnstable = all;
  nixbot = all;
  nixops = all;
  nixopsUnstable = all;
  nmap = all;
  nodejs = all;
  nox = all;
  nss_ldap = all;
  nssmdns = all;
  ntfs3g = all;
  ntp = all;
  numix-gtk-theme = all;
  nzbget = all;
  obexftp = all;
  openal = all;
  openarena = all;
  openconnect = all;
  opendungeons = all;
  openjdk = all;
  openmw = all;
  openobex = all;
  openra = all;
  openscad = all;
  openssh = all;
  openssl = all;
  openttd = all;
  openvpn = all;
  OVMF = all;
  packer = all;
  packetbeat = all;
  pam = all;
  pan = gtkSupported;
  pandoc = all;
  pango = linux;
  paper-gtk-theme = all;
  paprefs = all;
  par2cmdline = all;
  parallel = all;
  parted = all;
  pass = all;
  pavucontrol = all;
  pbzip2 = all;
  pciutils = all;
  pcmciaUtils = all;
  perf-tools = all;
  perl = all;
  perlPackages = {
    CGI = all;
    CGIFast = all;
    FCGI = all;
    IOTty = all;
    LWP = all;
    NetDNS = all;
    NetLDAP = all;
    NetSNMP = all;
  };
  phantomjs2 = all;
  php70 = all;
  php70Packages.composer = all;
  php70Packages.xdebug = all;
  physlock = all;
  picocom = all;
  pidgin = all;
  pidgin-skypeweb = all;
  pidginotr = all;
  pidginsipe = all;
  pinentry = all;
  pinta = all;
  pipework = all;
  pkgconfig = all;
  platinum-searcher = all;
  pmutils = all;
  poezio = all;
  ponysay = all;
  postfix = all;
  postfixWithPgSQL = all;
  postgresql = all;
  postgresql94 = all;
  postgresql95 = all;
  postgresql96 = all;
  powertop = all;
  privacyidea = all;
  privoxy = all;
  procps = all;
  prometheus = all;
  prometheus-alertmanager = all;
  prometheus-blackbox-exporter = all;
  prometheus-fritzbox-exporter = all;
  prometheus-mysqld-exporter = all;
  prometheus-nginx-exporter = all;
  prometheus-node-exporter = all;
  prometheus-openvpn-exporter = all;
  prometheus-snmp-exporter = all;
  prosody = all;
  pulseaudioFull = all;
  pulseaudioLight = all;
  pwgen = all;
  pwnat = all;
  python = allBut cygwin;
  python3 = allBut cygwin;
  python36 = allBut cygwin;
  pythonFull = all;
  pythonPackages = {
    binwalk = all;
    django = all;
    urllib3 = all;
    zerobin = all;
  };
  python3Packages = {
    binwalk = all;
    django = all;
    irc = linux;
    numpy = all;
    pyramid = linux;
    scipy = all;
    slackclient = linux;
    tempora = linux;
    zope_schema = linux;
  };
  SDL2 = all;
  haskellPackages.xmobar = all;
  haskellPackages.xmonad-contrib = all;
  haskellPackages.xmonad-extras = all;
  pv = all;
  python35Packages.youtube-dl = all;
  qemu = all;
  qemu_kvm = all;
  qemu_test = all;
  qiv = all;
  qjackctl = all;
  qlcplus = all;
  qpdf = all;
  quicktun = all;
  qutebrowser = all;
  radvd = all;
  ranger = all;
  rdesktop = all;
  readline = all;
  redir = all;
  redis = all;
  redshift = all;
  retroshare = all;
  retroshare06 = all;
  rfkill = all;
  ripgrep = all;
  rkt = all;
  rlwrap = all;
  rmilter = all;
  roxterm = all;
  rpm = all;
  rrdtool = all;
  rspamd = all;
  rstudio = all;
  rsync = all;
  rsyslog = all;
  rtkit = all;
  rtorrent = all;
  ruby = all;
  rxvt_unicode-with-plugins = all;
  sakura = all;
  searx = all;
  screen = all;
  screenfetch = all;
  screen-message = all;
  scrot = all;
  scummvm = all;
  sdparm = all;
  seafile-client = all;
  selenium-server-standalone = all;
  sharutils = all;
  shishi = all;
  shutter = all;
  simp_le = all;
  sipcalc = all;
  sks = all;
  sl = all;
  slimerjs = all;
  sloccount = allBut cygwin;
  smartmontools = all;
  smokeping = all;
  socat = all;
  sonarr = all;
  speedtest-cli = all;
  sqlite = allBut cygwin;
  sqliteInteractive = allBut cygwin;
  squid = all;
  sshfsFuse = all;
  sslscan = all;
  ssmtp = all;
  stdenv = all;
  strace = all;
  strongswan = all;
  stunnel = all;
  su = all;
  subversion = all;
  sudo = all;
  supercollider = all;
  syncthing = all;
  synergy = all;
  sysdig = all;
  sysklogd = all;
  syslinux = ["i686-linux"];
  sysstat = all;
  systemd = all;
  systemd-journal2gelf = all;
  sysvinit = all;
  sysvtools = all;
  taskwarrior = all;
  tcl = all;
  tcpdump = all;
  teeworlds = all;
  terminator = all;
  texlive.combined = {
    scheme-small = all;
    scheme-full = all;
  };
  texmaker = all;
  texstudio = all;
  thermald = all;
  thunderbird = all;
  tightvnc = all;
  time = all;
  tinc = all;
  tinc_pre = all;
  tinycc = all;
  tlp = all;
  tmux = all;
  toilet = all;
  tor = all;
  torbrowser = all;
  tpacpi-bat = all;
  traceroute = all;
  transmission = all;
  transmission_gtk = all;
  transmission_remote_gtk = all;
  tree = all;
  tzdata = all;
  unbound = all;
  unetbootin = all;
  units = all;
  unzip = all;
  urlview = all;
  urlwatch = all;
  usbutils = all;
  utillinux = all;
  vaapiIntel = all;
  vagrant = all;
  vim = all;
  vimHugeX = all;
  virtmanager = all;
  virtualbox = all;
  vlc = all;
  w3m = all;
  wavemon = all;
  wcalc = all;
  weechat = all;
  wesnoth = all;
  wget = all;
  which = all;
  whois = all;
  widelands = all;
  wine = [ "x86_64-linux" ];
  winetricks = [ "x86_64-linux" ];
  wireguard = linux;
  wirelesstools = linux;
  wireshark = all;
  wireshark-cli = all;
  wpa_supplicant = linux;
  wpa_supplicant_gui = linux;
  xautolock = all;
  xcalib = all;
  xclip = all;
  xcompmgr = all;
  xdg-user-dirs = all;
  xdg_utils = all;
  xfce = {
    thunar = all;
    thunar-archive-plugin = all;
    thunar_volman = all;
  };
  xfontsel = all;
  xfsprogs = linux;
  xkeyboard_config = linux;
  xmlsec = all;
  xmonad-with-packages = all;
  xorg_sys_opengl = all;
  xscreensaver = all;
  xss-lock = all;
  xtrlock-pam = all;
  xz = all;
  yate = all;
  ympd = all;
  youtubeDL = all;
  zathura = all;
  zeroad = all;
  zfstools = all;
  zile = all;
  zip = all;
  zlib = all;
  znapzend = all;
  zsh = all;

  linuxPackages = recursiveUpdate kernelPackages kernelPackages_virtualbox;
  linuxPackages_latest = recursiveUpdate kernelPackages kernelPackages_virtualbox;

  nodePackages = {
    bower = all;
    grunt-cli = all;
  };

  pkgsi686Linux = {
    mesa = mesaPlatforms;
    mesa_drivers = all;
    steam = all;
    steam-run = all;
  };

  xorg = {
    sessreg = all;
    xbacklight = all;
    xcursorthemes = all;
    xev = all;
    xf86inputlibinput = all;
    xf86videofbdev = all;
    xkill = all;
    xlsclients = all;
    xmessage = all;
    xmodmap = all;
    xprop = all;
    xrandr = all;
    xset = all;
    xsetroot = all;
  };

  # Fonts
  clearlyU = all;
  cm_unicode = all;
  dejavu_fonts = all;
  eb-garamond = all;
  font-awesome-ttf = all;
  freefont_ttf = all;
  freeorion = all;
  gentium = all;
  hack-font = all;
  inconsolata = all;
  proggyfonts = all;
  smbclient = all;
  source-code-pro = all;
  source-sans-pro = all;
  source-serif-pro = all;
  terminus_font = all;
  tewi-font = all;
  ttf_bitstream_vera = all;
  ubuntu_font_family = all;
  unifont = all;
  vistafonts = all;
  wqy_microhei = all;
}) // {
  manual = import "${nixpkgs}/doc";
  lib-tests = import "${nixpkgs}/lib/tests/release.nix" { inherit pkgs; };
}
