/* A small release file, with few packages to be built.  The aim is to reduce
   the load on Hydra when testing the `stdenv-updates' branch. */

{ nixpkgs
, supportedSystems ? [ "x86_64-linux" ]
}:

with import <nixpkgs/pkgs/top-level/release-lib.nix> { inherit supportedSystems; };
(mapTestOn (rec {

  ack = all;
  acpi = all;
  acpid = all;
  acpitool = all;
  alsaPlugins = all;
  alsaUtils = all;
  androidenv = {
    platformTools = all;
  };
  aspell = all;
  at = all;
  atom = all;
  atop = all;
  audacity = all;
  autoconf = all;
  automake = all;
  autossh = all;
  avahi = allBut cygwin;  # Cygwin builds fail
  bash = all;
  bashInteractive = all;
  bc = all;
  bind = all;
  binutils = all;
  binwalk = all;
  bsdiff = all;
  bundix = all;
  bundler_HEAD = all;
  busybox = all;
  byobu = all;
  bzip2 = all;
  chromium = all;
  chrony = all;
  clawsMail = all;
  cmake = all;
  collectd = all;
  compass = all;
  coreutils = all;
  cpio = all;
  cron = all;
  cryptsetup = all;
  cups = all;
  ddrescue = all;
  dhcp = all;
  di = all;
  diffutils = all;
  disnix = all;
  dnsmasq = all;
  docker = all;
  dovecot = all;
  dpkg = all;
  debootstrap = all;
  ethtool = all;
  evince = all;
  e2fsprogs = all;
  emacs24 = gtkSupported;
  emby = all;
  enscript = all;
  fail2ban = all;
  feh = all;
  file = all;
  findutils = all;
  firefox = all;
  flex = all;
  gajim = all;
  gcc = all;
  gettext = all;
  gimp = all;
  gist = all;
  git = all;
  gitAndTools.gitFull = all;
  gitAndTools.tig = all;
  gitAndTools.hub = all;
  gitlab = all;
  glibc = all;
  glibcLocales = all;
  global = all;
  gmp = all;
  gmpc = all;
  gnome.gconfmm = all;
  gnome.libglademm = all;
  gnome3.gedit = all;
  gnugrep = all;
  gnum4 = all;
  gnumake = all;
  gnupatch = all;
  gnupg = all;
  gnupg21 = all;
  gnuplot = allBut cygwin;
  gnused = all;
  gnutar = all;
  gnutls = all;
  gogoclient = all;
  gperftools = all;
  gqrx = all;
  graphviz = all;
  graylog = all;
  grub2 = all;
  gsl = all;
  guile = all;
  gzip = all;
  haskellPackages.epanet-haskell = all;
  hddtemp = all;
  hdparm = all;
  hello = all;
  horst = all;
  host = all;
  hostapd = all;
  htop = all;
  i3 = all;
  i3lock = all;
  i3status = all;
  iana_etc = all;
  icecast = all;
  icedtea_web = all;
  icewm = all;
  idutils = all;
  iftop = all;
  inetutils = all;
  inkscape = all;
  intel-gpu-tools = all;
  iotop = all;
  iperf2 = all;
  iperf3 = all;
  iproute = all;
  iputils = all;
  jnettop = all;
  jq = all;
  jwhois = all;
  kbd = all;
  keen4 = ["i686-linux"];
  kvm = all;
  less = all;
  letsencrypt = all;
  lftp = all;
  libcap = linux;
  libressl = all;
  libreoffice = all;
  libtool = all;
  libtool_2 = all;
  libvirt = all;
  libxml2 = all;
  libxslt = all;
  libyaml = all;
  libyamlcpp = all;
  lolcat = all;
  lout = all;
  lsof = all;
  ltrace = all;
  lvm2 = all;
  lxc = all;
  lxd = all;
  lynx = all;
  lzma = all;
  man = all;
  manpages = all;
  mc = all;
  mcron = all;
  mdadm = all;
  mercurial = all;
  mesa = mesaPlatforms;
  minetest = all;
  mingetty = all;
  mk = all;
  mktemp = all;
  module_init_tools = all;
  mongodb = all;
  monotone = all;
  mosh = all;
  mpg321 = all;
  mplayer = all;
  mpv = all;
  mtr = all;
  mupdf = all;
  mutt = all;
  mysql = all;
  ncdu = all;
  ncmpcpp = all;
  netcat = all;
  nfs-utils = all;
  nix = all;
  nixUnstable = all;
  nixops = all;
  nixopsUnstable = all;
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
  openjdk = all;
  openra = all;
  openssh = all;
  openssl = all;
  openttd = all;
  openvpn = all;
  packer = all;
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
  physlock = all;
  pkgconfig = all;
  pinta = all;
  poezio = all;
  ponysay = all;
  portmap = all;
  postfix = all;
  postgresql = all;
  powertop = all;
  procps = all;
  prosody = all;
  pulseaudioFull = all;
  pulseaudioLight = all;
  pwgen = all;
  python = allBut cygwin;
  pythonFull = all;
  python3Packages = {
    nltk = all;
    nltkMin = all;
    numpy = all;
    scipy = all;
  };
  pv = all;
  qemu = all;
  qemu_kvm = all;
  qutebrowser = all;
  radvd = all;
  readline = all;
  redshift = all;
  rkt = all;
  rlwrap = all;
  rpm = all;
  rrdtool = all;
  rsync = all;
  ruby_2_2_3 = all;
  rxvt_unicode-with-plugins = all;
  screen = all;
  scrot = all;
  sdparm = all;
  sharutils = all;
  silver-searcher = all;
  simp_le = all;
  sipcalc = all;
  sl = all;
  sloccount = allBut cygwin;
  smartmontools = all;
  socat = all;
  sqlite = allBut cygwin;
  squid = all;
  sshfsFuse = all;
  sslscan = all;
  ssmtp = all;
  stdenv = all;
  strace = all;
  su = all;
  sudo = all;
  synergy = all;
  sysklogd = all;
  syslinux = ["i686-linux"];
  sysstat = all;
  systemd = all;
  sysvinit = all;
  sysvtools = all;
  taskwarrior = all;
  tcl = all;
  tcpdump = all;
  terminator = all;
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
  unbound = all;
  units = all;
  unzip = all;
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
  webkit = all;
  webkitgtk2 = all;
  weechat = all;
  wget = all;
  which = all;
  whois = all;
  wirelesstools = linux;
  wireshark = all;
  wpa_supplicant = linux;
  wpa_supplicant_gui = linux;
  xcalib = all;
  xfsprogs = linux;
  xkeyboard_config = linux;
  xmonad-with-packages = all;
  haskellPackages.xmonad-contrib = all;
  haskellPackages.xmonad-extras = all;
  haskellPackages.xmobar = all;
  xz = all;
  youtubeDL = all;
  zathura = all;
  zile = all;
  zip = all;
  zlib = all;
  zsh = all;

  linuxPackages_4_4 = {
    kernel = all;
    perf = all;
    virtualboxHardened = all;
  };

  linuxPackages_4_5 = {
    kernel = all;
    perf = all;
    virtualboxHardened = all;
  };

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

} ))
