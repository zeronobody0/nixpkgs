{ config, pkgs, lib }:

# NOTE: New packages should generally go to top-level instead of here!
lib.makeScope pkgs.newScope (self:
let
  inherit (self) callPackage;
in
{
  updateScript = callPackage ./update.nix { };

  # Temporary helper until gdk-pixbuf supports multiple cache files.
  # This will go away, do not use outside Nixpkgs.
  _gdkPixbufCacheBuilder_DO_NOT_USE = callPackage ./gdk-pixbuf-cache-builder.nix { };

  libsoup = pkgs.libsoup.override { gnomeSupport = true; };
  libchamplain = pkgs.libchamplain.override { inherit (self) libsoup; };

# ISO installer
# installerIso = callPackage ./installer.nix {};

#### Core (http://ftp.acc.umu.se/pub/GNOME/core/)

  caribou = callPackage ./core/caribou { };

  dconf-editor = callPackage ./core/dconf-editor { };

  gdm = callPackage ./core/gdm { };

  gnome-backgrounds = callPackage ./core/gnome-backgrounds { };

  gnome-bluetooth = callPackage ./core/gnome-bluetooth { };

  gnome-bluetooth_1_0 = callPackage ./core/gnome-bluetooth/1.0 { };

  gnome-color-manager = callPackage ./core/gnome-color-manager { };

  gnome-contacts = callPackage ./core/gnome-contacts { };

  gnome-control-center = callPackage ./core/gnome-control-center { };

  gnome-dictionary = callPackage ./core/gnome-dictionary { };

  gnome-disk-utility = callPackage ./core/gnome-disk-utility { };

  gnome-font-viewer = callPackage ./core/gnome-font-viewer { };

  gnome-keyring = callPackage ./core/gnome-keyring { };

  gnome-initial-setup = callPackage ./core/gnome-initial-setup { };

  gnome-online-miners = callPackage ./core/gnome-online-miners { };

  gnome-remote-desktop = callPackage ./core/gnome-remote-desktop { };

  gnome-session = callPackage ./core/gnome-session { };

  gnome-session-ctl = callPackage ./core/gnome-session/ctl.nix { };

  gnome-shell = callPackage ./core/gnome-shell { };

  gnome-shell-extensions = callPackage ./core/gnome-shell-extensions { };

  gnome-settings-daemon = callPackage ./core/gnome-settings-daemon { };

  # Using 43 to match Mutter used in Pantheon
  gnome-settings-daemon43 = callPackage ./core/gnome-settings-daemon/43 { };

  gnome-software = callPackage ./core/gnome-software { };

  gnome-system-monitor = callPackage ./core/gnome-system-monitor { };

  gnome-themes-extra = callPackage ./core/gnome-themes-extra { };

  gvfs = pkgs.gvfs.override { gnomeSupport = true; };

  mutter = callPackage ./core/mutter { };

  # Needed for elementary's gala, wingpanel and greeter until support for higher versions is provided
  mutter43 = callPackage ./core/mutter/43 { };

  networkmanager-openvpn = pkgs.networkmanager-openvpn.override {
    withGnome = true;
  };

  networkmanager-vpnc = pkgs.networkmanager-vpnc.override {
    withGnome = true;
  };

  networkmanager-openconnect = pkgs.networkmanager-openconnect.override {
    withGnome = true;
  };

  networkmanager-fortisslvpn = pkgs.networkmanager-fortisslvpn.override {
    withGnome = true;
  };

  networkmanager-l2tp = pkgs.networkmanager-l2tp.override {
    withGnome = true;
  };

  networkmanager-iodine = pkgs.networkmanager-iodine.override {
    withGnome = true;
  };

  nixos-gsettings-overrides = callPackage ./nixos/gsettings-overrides { };

  sushi = callPackage ./core/sushi { };

  totem = callPackage ./core/totem { };

  yelp = callPackage ./core/yelp { };

  yelp-xsl = callPackage ./core/yelp-xsl { };

#### Apps (http://ftp.acc.umu.se/pub/GNOME/apps/)

  accerciser = callPackage ./apps/accerciser { };

  cheese = callPackage ./apps/cheese { };

  gnome-boxes = callPackage ./apps/gnome-boxes { };

  gnome-characters = callPackage ./apps/gnome-characters { };

  gnome-clocks = callPackage ./apps/gnome-clocks { };

  gnome-logs = callPackage ./apps/gnome-logs { };

  gnome-maps = callPackage ./apps/gnome-maps { };

  gnome-music = callPackage ./apps/gnome-music { };

  gnome-nettool = callPackage ./apps/gnome-nettool { };

  gnome-notes = callPackage ./apps/gnome-notes { };

  gnome-power-manager = callPackage ./apps/gnome-power-manager { };

  gnome-sound-recorder = callPackage ./apps/gnome-sound-recorder { };

  gnome-weather = callPackage ./apps/gnome-weather { };

  polari = callPackage ./apps/polari { };

  vinagre = callPackage ./apps/vinagre { };

#### Dev http://ftp.gnome.org/pub/GNOME/devtools/

  devhelp = callPackage ./devtools/devhelp { };

#### Games

  aisleriot = callPackage ./games/aisleriot { };

  atomix = callPackage ./games/atomix { };

  five-or-more = callPackage ./games/five-or-more { };

  four-in-a-row = callPackage ./games/four-in-a-row { };

  gnome-chess = callPackage ./games/gnome-chess { };

  gnome-klotski = callPackage ./games/gnome-klotski { };

  gnome-mahjongg = callPackage ./games/gnome-mahjongg { };

  gnome-mines = callPackage ./games/gnome-mines { };

  gnome-nibbles = callPackage ./games/gnome-nibbles { };

  gnome-robots = callPackage ./games/gnome-robots { };

  gnome-sudoku = callPackage ./games/gnome-sudoku { };

  gnome-taquin = callPackage ./games/gnome-taquin { };

  gnome-tetravex = callPackage ./games/gnome-tetravex { };

  hitori = callPackage ./games/hitori { };

  iagno = callPackage ./games/iagno { };

  lightsoff = callPackage ./games/lightsoff { };

  swell-foop = callPackage ./games/swell-foop { };

  tali = callPackage ./games/tali { };

  quadrapassel = callPackage ./games/quadrapassel { };

#### Misc -- other packages on http://ftp.gnome.org/pub/GNOME/sources/

  gnome-applets = callPackage ./misc/gnome-applets { };

  gnome-flashback = callPackage ./misc/gnome-flashback { };

  gnome-panel = callPackage ./misc/gnome-panel { };

  gnome-panel-with-modules = callPackage ./misc/gnome-panel/wrapper.nix { };

  gnome-tweaks = callPackage ./misc/gnome-tweaks { };

  gpaste = callPackage ./misc/gpaste { };

  metacity = callPackage ./misc/metacity { };

  gtkhtml = callPackage ./misc/gtkhtml { enchant = pkgs.enchant2; };

  pomodoro = callPackage ./misc/pomodoro { };

  gnome-packagekit = callPackage ./misc/gnome-packagekit { };
}) // lib.optionalAttrs config.allowAliases {
#### Legacy aliases. They need to be outside the scope or they will shadow the attributes from parent scope.
  libgnome-keyring = lib.warn "The ‘gnome.libgnome-keyring’ was moved to top-level. Please use ‘pkgs.libgnome-keyring’ directly." pkgs.libgnome-keyring; # Added on 2024-06-22.

  gedit = throw "The ‘gnome.gedit’ alias was removed. Please use ‘pkgs.gedit’ directly."; # converted to throw on 2023-12-27
  gnome-todo = throw "The ‘gnome.gnome-todo’ alias was removed. Please use ‘pkgs.endeavour’ directly."; # converted to throw on 2023-12-27

  adwaita-icon-theme = lib.warn "The ‘gnome.adwaita-icon-theme’ was moved to top-level. Please use ‘pkgs.adwaita-icon-theme’ directly." pkgs.adwaita-icon-theme; # Added on 2024-06-22.
  baobab = lib.warn "The ‘gnome.baobab’ was moved to top-level. Please use ‘pkgs.baobab’ directly." pkgs.baobab; # Added on 2024-06-22.
  eog = lib.warn "The ‘gnome.eog’ was moved to top-level. Please use ‘pkgs.eog’ directly." pkgs.eog; # Added on 2024-06-22.
  epiphany = lib.warn "The ‘gnome.epiphany’ was moved to top-level. Please use ‘pkgs.epiphany’ directly." pkgs.epiphany; # Added on 2024-06-22.
  evince = lib.warn "The ‘gnome.evince’ was moved to top-level. Please use ‘pkgs.evince’ directly." pkgs.evince; # Added on 2024-06-13.
  evolution-data-server = lib.warn "The ‘gnome.evolution-data-server’ was moved to top-level. Please use ‘pkgs.evolution-data-server’ directly." pkgs.evolution-data-server; # Added on 2024-06-13.
  file-roller = lib.warn "The ‘gnome.file-roller’ was moved to top-level. Please use ‘pkgs.file-roller’ directly." pkgs.file-roller; # Added on 2024-06-13.
  geary = lib.warn "The ‘gnome.geary’ was moved to top-level. Please use ‘pkgs.geary’ directly." pkgs.geary; # Added on 2024-06-22.
  ghex = lib.warn "The ‘gnome.ghex’ was moved to top-level. Please use ‘pkgs.ghex’ directly." pkgs.ghex; # Added on 2024-06-22.
  gitg = lib.warn "The ‘gnome.gitg’ was moved to top-level. Please use ‘pkgs.gitg’ directly." pkgs.gitg; # Added on 2024-06-22.
  gnome-autoar = lib.warn "The ‘gnome.gnome-autoar’ was moved to top-level. Please use ‘pkgs.gnome-autoar’ directly." pkgs.gnome-autoar; # Added on 2024-06-13.
  gnome-common = lib.warn "The ‘gnome.gnome-common’ was moved to top-level. Please use ‘pkgs.gnome-common’ directly." pkgs.gnome-common; # Added on 2024-06-22.
  gnome-calculator = lib.warn "The ‘gnome.gnome-calculator’ was moved to top-level. Please use ‘pkgs.gnome-calculator’ directly." pkgs.gnome-calculator; # Added on 2024-06-22.
  gnome-calendar = lib.warn "The ‘gnome.gnome-calendar’ was moved to top-level. Please use ‘pkgs.gnome-calendar’ directly." pkgs.gnome-calendar; # Added on 2024-06-22.
  gnome-screenshot = lib.warn "The ‘gnome.gnome-screenshot’ was moved to top-level. Please use ‘pkgs.gnome-screenshot’ directly." pkgs.gnome-screenshot; # Added on 2024-06-22.
  gnome-terminal = lib.warn "The ‘gnome.gnome-terminal’ was moved to top-level. Please use ‘pkgs.gnome-terminal’ directly." pkgs.gnome-terminal; # Added on 2024-06-13.
  gnome-user-share = lib.warn "The ‘gnome.gnome-user-share’ was moved to top-level. Please use ‘pkgs.gnome-user-share’ directly." pkgs.gnome-user-share; # Added on 2024-06-13.
  gucharmap = lib.warn "The ‘gnome.gucharmap’ was moved to top-level. Please use ‘pkgs.gucharmap’ directly." pkgs.gucharmap; # Added on 2024-06-22.
  nautilus = lib.warn "The ‘gnome.nautilus’ was moved to top-level. Please use ‘pkgs.nautilus’ directly." pkgs.nautilus; # Added on 2024-06-13.
  nautilus-python = lib.warn "The ‘gnome.nautilus-python’ was moved to top-level. Please use ‘pkgs.nautilus-python’ directly." pkgs.nautilus-python; # Added on 2024-06-13.
  rygel = lib.warn "The ‘gnome.rygel’ was moved to top-level. Please use ‘pkgs.rygel’ directly." pkgs.rygel; # Added on 2024-06-22.
  seahorse = lib.warn "The ‘gnome.seahorse’ was moved to top-level. Please use ‘pkgs.seahorse’ directly." pkgs.seahorse; # Added on 2024-06-22.
  simple-scan = lib.warn "The ‘gnome.simple-scan’ was moved to top-level. Please use ‘pkgs.simple-scan’ directly." pkgs.simple-scan; # Added on 2024-06-22.
  zenity = lib.warn "The ‘gnome.zenity’ was moved to top-level. Please use ‘pkgs.zenity’ directly." pkgs.zenity; # Added on 2024-06-22.

#### Removals
  anjuta = throw "`anjuta` was removed after not being maintained upstream and losing control of its official domain."; # 2024-01-16
}
