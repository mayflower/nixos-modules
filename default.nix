/* A small release file, with few packages to be built.  The aim is to reduce
   the load on Hydra when testing the `stdenv-updates' branch. */

{ nixpkgs
, supportedSystems ? [ "x86_64-linux" ]
}:

with import <nixpkgs/pkgs/top-level/release-lib.nix> { inherit supportedSystems; };

let

  recursiveUpdate = (import <nixpkgs> {}).lib.recursiveUpdate;

  kernelPackages = {
    bcc = all;
    jool = all;
    kernel = all;
    perf = all;
    spl = all;
    wireguard = all;
    zfs = all;
  };

  kernelPackages_virtualbox = {
    virtualboxHardened = all;
    virtualboxGuestAdditions = all;
  };

in

(mapTestOn {

  ack = all;
  acpi = all;
  acpid = all;
  acpitool = all;
  aircrack-ng = all;
  alsaPlugins = all;
  alsaUtils = all;
  androidenv = {
    platformTools = all;
  };
  androidsdk = all;
  arandr = all;
  arduino = all;
  arp-scan = all;
  aspell = all;
  at = all;
  atom = all;
  atop = all;
  audacity = all;
  autoconf = all;
  automake = all;
  autossh = all;
  avahi = allBut cygwin;  # Cygwin builds fail
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
  brackets = all;
  bridge-utils = all;
  bruteforce-luks = all;
  bsdiff = all;
  bsdgames = all;
  bundix = all;
  bundler_HEAD = all;
  busybox = all;
  byobu = all;
  bzip2 = all;
  cabal2nix = all;
  calibre = all;
  cargo = all;
  casperjs = all;
  cgmanager = all;
  checkstyle = all;
  chromium = all;
  chrony = all;
  cipherscan = all;
  clamav = all;
  clawsMail = all;
  cmake = all;
  collectd = all;
  compass = all;
  compton-git = all;
  coreutils = all;
  cowsay = all;
  cpio = all;
  cpulimit = all;
  crackxls = all;
  cron = all;
  cryptsetup = all;
  cups = all;
  darkice = all;
  dbus = all;
  ddrescue = all;
  debootstrap = all;
  dhcp = all;
  dhcpcd = all;
  di = all;
  diffutils = all;
  disnix = all;
  dnsmasq = all;
  docker = all;
  dosbox = all;
  dovecot = all;
  dpkg = all;
  eduke32 = all;
  eiskaltdcpp = all;
  elasticsearch2 = all;
  etcd = all;
  ethtool = all;
  evince = all;
  e2fsprogs = all;
  emacs24 = gtkSupported;
  emby = all;
  enscript = all;
  errbot = all;
  fail2ban = all;
  feh = all;
  file = all;
  filezilla = all;
  findutils = all;
  firefox = all;
  flac = all;
  flex = all;
  fortune = all;
  foomatic-filters = all;
  freeciv = all;
  gajim = all;
  gcc = all;
  gettext = all;
  gimp = all;
  gist = all;
  git = all;
  gitAndTools.diff-so-fancy = all;
  gitAndTools.gitFull = all;
  gitAndTools.tig = all;
  gitAndTools.hub = all;
  gitlab = all;
  gitMinimal = all;
  glibc = all;
  glibcLocales = all;
  global = all;
  gmp = all;
  gmpc = all;
  gnome.gconfmm = all;
  gnome.libglademm = all;
  gnome3.gedit = all;
  gnufdisk = all;
  gnugrep = all;
  gnum4 = all;
  gnumake = all;
  gnupatch = all;
  gnupg = all;
  gnupg21 = all;
  gnuplot = allBut cygwin;
  gnuradio-with-packages = all;
  gnused = all;
  gnutar = all;
  gnutls = all;
  go = all;
  go_1_4 = all;
  go_1_5 = all;
  go_1_6 = all;
  gogoclient = all;
  go2nix = all;
  gox = all;
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
  guile = all;
  gutenprint = all;
  gzip = all;
  haveged = all;
  hddtemp = all;
  hdparm = all;
  hedgewars = all;
  hello = all;
  hexedit = all;
  horst = all;
  host = all;
  hostapd = all;
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
  idea.android-studio = all;
  idutils = all;
  iftop = all;
  imagemagick = all;
  inetutils = all;
  inkscape = all;
  inotify-tools = all;
  intel-gpu-tools = all;
  iotop = all;
  iperf2 = all;
  iperf3 = all;
  ipfs = all;
  iproute = all;
  iputils = all;
  jnettop = all;
  jool-cli = all;
  jq = all;
  jre = all;
  irqbalance = all;
  jwhois = all;
  kbd = all;
  kea = all;
  keen4 = ["i686-linux"];
  kismet = all;
  kvm = all;
  lame = all;
  latencytop = all;
  less = all;
  letsencrypt = all;
  lftp = all;
  libcap = linux;
  libcgroup = all;
  libinput = all;
  libnotify = all;
  libotr = all;
  libressl = all;
  libreoffice = all;
  libseccomp = all;
  libtool = all;
  libtool_2 = all;
  libvirt = all;
  libxml2 = all;
  libxslt = all;
  libyaml = all;
  libyamlcpp = all;
  lm_sensors = all;
  lolcat = all;
  lout = all;
  lsof = all;
  ltrace = all;
  lvm2 = all;
  lxappearance = all;
  lxc = all;
  lxd = all;
  lynx = all;
  lzma = all;
  mailutils = all;
  man = all;
  manpages = all;
  mc = all;
  mcabber = all;
  mcron = all;
  mdadm = all;
  memtest86plus= all;
  mercurial = all;
  mesa = mesaPlatforms;
  minetest = all;
  mingetty = all;
  mk = all;
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
  mopidy-spotify = all;
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
  netcat = all;
  networkmanager = all;
  nfs-utils = all;
  nix = all;
  nixUnstable = all;
  nixops = all;
  nixopsUnstable = all;
  nixbot = all;
  nix-generate-from-cpan = all;
  nix-repl = all;
  nginx = all;
  nginxUnstable = all;
  nmap = all;
  nodejs = all;
  nox = all;
  nss_ldap = all;
  nssmdns = all;
  ntfs3g = all;
  ntp = all;
  obexftp = all;
  openal = all;
  openarena = all;
  opendungeons = all;
  openjdk = all;
  openobex = all;
  openra = all;
  openrct2 = all;
  openscad = all;
  openssh = all;
  openssl = all;
  openttd = all;
  openvpn = all;
  openxcom = all;
  packer = all;
  pam = all;
  pan = gtkSupported;
  pandoc = all;
  par2cmdline = all;
  parallel = all;
  parted = all;
  paprefs = all;
  pavucontrol = all;
  pass = all;
  pciutils = all;
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
  physlock = all;
  pkgconfig = all;
  platinum-searcher = all;
  pidgin = all;
  pidginotr = all;
  pidginsipe = all;
  pidgin-skypeweb = all;
  pinta = all;
  pipework = all;
  poezio = all;
  ponysay = all;
  portmap = all;
  postfix = all;
  postgresql94 = all;
  postgresql95 = all;
  postgresql = all;
  powertop = all;
  procps = all;
  prosody = all;
  prometheus = all;
  prometheus-cli = all;
  prometheus-alertmanager = all;
  prometheus-nginx-exporter = all;
  prometheus-node-exporter = all;
  pulseaudioFull = all;
  pulseaudioLight = all;
  pwgen = all;
  pwnat = all;
  python = allBut cygwin;
  pythonFull = all;
  pythonPackages = {
    searx = all;
    binwalk = all;
    django = all;
  };
  python3Packages = {
    nltkMin = all;
    numpy = all;
    scipy = all;
    binwalk = all;
    django = all;
    mathics = all;
  };
  pv = all;
  qemu = all;
  qemu_kvm = all;
  qiv = all;
  quicktun = all;
  qutebrowser = all;
  radvd = all;
  rdesktop = all;
  readline = all;
  redir = all;
  redshift = all;
  retroshare06 = all;
  retroshare = all;
  rkt = all;
  rlwrap = all;
  rmilter = all;
  rpm = all;
  rrdtool = all;
  rspamd = all;
  rsync = all;
  rsyslog = all;
  ruby = all;
  ruby_2_2_3 = all;
  rxvt_unicode-with-plugins = all;
  screen = all;
  screen-message = all;
  scrot = all;
  sdparm = all;
  selenium-server-standalone = all;
  sharutils = all;
  shishi = all;
  silver-searcher = all;
  simp_le = all;
  sipcalc = all;
  sl = all;
  slimerjs = all;
  sloccount = allBut cygwin;
  smartmontools = all;
  socat = all;
  speedtest-cli = all;
  sqlite = allBut cygwin;
  squid = all;
  sshfsFuse = all;
  sslscan = all;
  ssmtp = all;
  stdenv = all;
  strace = all;
  strongswan = all;
  stunnel = all;
  su = all;
  sudo = all;
  supercollider = all;
  syncthing = all;
  synergy = all;
  sysklogd = all;
  syslinux = ["i686-linux"];
  sysstat = all;
  systemd = all;
  systemd-journal2gelf = all;
  sysvinit = all;
  sysvtools = all;
  taskwarrior = all;
  teeworlds = all;
  tcl = all;
  tcpdump = all;
  terminator = all;
  texlive.combined.scheme-small = all;
  thermald = all;
  thunderbird = all;
  tightvnc = all;
  time = all;
  tinc_pre = all;
  tinycc = all;
  tlp = all;
  tmux = all;
  toilet = all;
  tor = all;
  torbrowser = all;
  traceroute = all;
  transmission_gtk = all;
  transmission_remote_gtk = all;
  tuxguitar = all;
  tzdata = all;
  ufoai = all;
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
  vlc = all;
  w3m = all;
  wavemon = all;
  weechat = all;
  wget = all;
  which = all;
  whois = all;
  widelands = all;
  wine = all;
  winetricks = all;
  wireguard = linux;
  wirelesstools = linux;
  wireshark = all;
  wpa_supplicant = linux;
  wpa_supplicant_gui = linux;
  xautolock = all;
  xcalib = all;
  xfsprogs = linux;
  xkeyboard_config = linux;
  xmonad-with-packages = all;
  haskellPackages.xmonad-contrib = all;
  haskellPackages.xmonad-extras = all;
  haskellPackages.xmobar = all;
  xcompmgr = all;
  xscreensaver = all;
  xss-lock = all;
  xtrlock-pam = all;
  xz = all;
  youtubeDL = all;
  zathura = all;
  zile = all;
  zip = all;
  zlib = all;
  zsh = all;

  linuxPackages = recursiveUpdate kernelPackages kernelPackages_virtualbox;
  linuxPackages_4_4 = recursiveUpdate kernelPackages kernelPackages_virtualbox;
  linuxPackages_latest = recursiveUpdate kernelPackages kernelPackages_virtualbox;
  linuxPackages_grsec_nixos = kernelPackages;

  nodePackages = {
    bower = all;
    grunt-cli = all;
  };

  xorg = {
    sessreg = all;
    xkill = all;
    xmessage = all;
    xbacklight = all;
    xrandr = all;
    xev = all;
    xf86inputlibinput = all;
    xmodmap = all;
  };

  # Fonts
  clearlyU = all;
  cm_unicode = all;
  dejavu_fonts = all;
  eb-garamond = all;
  font-awesome-ttf = all;
  freefont_ttf = all;
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

})
