# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s3.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "nl_NL.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
   };

  # Enable the Plasma 5 Desktop Environment.
  #services.xserver.enable = true;
  #services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.desktopManager.xfce.enable = true;

  # Enable OpenBox.
   services.xserver.enable = true;
   services.xserver.displayManager.lightdm.enable = true;
   services.xserver.windowManager.openbox.enable = true;
   services.xserver.displayManager.defaultSession = "none+openbox";


  # Configure keymap in X11
   services.xserver.layout = "us";
   services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
   sound.enable = true;
   hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.kevin = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
     #wget #vim
#****************************************
#Audio
alsa-firmware
alsaPlugins
alsaTools
alsaUtils
pulseaudio
pulseaudio-ctl
volumeicon
pavucontrol
#****************************************
#Browser e.d
firefox
thunderbird
chromium
#****************************************
#Editors
nano
geany
leafpad
#****************************************
#Grafisch
menumaker
conky
tint2
screenfetch
lxqt.compton-conf
picom
xfce.tumbler
lxappearance
nitrogen
lightdm
lightdm_gtk_greeter
#****************************************
#Hardware Tools
mtools
ntfs3g
gparted
#****************************************
#Linux
sudo
utillinux
libgksu
gksu
libmicrodns
#****************************************
#Media
ffmpegthumbnailer
gimp
pinta
shotgun
vlc
#****************************************
#Netwerk
networkmanager
networkmanagerapplet
#****************************************
#Openbox
openbox
obconf
openbox-menu
#****************************************
#Themes
numix-gtk-theme
numix-cursor-theme
numix-icon-theme
#****************************************
#Tools
gmrun
xarchiver
p7zip
unzip
pcmanfm
keepass
libreoffice-fresh
ntp
woeusb
gsimplecal
scrot
qscreenshot
#****************************************
#Terminal Tools
termite
speedtest-cli
xdg-user-dirs
xdg_utils
bash-completion
git
ncdu
mlocate
rsync
#****************************************
#Video
libGL
#****************************************
#Xorg
xterm
xorg.xcalc
xorg.xclock
xorg.xdm
xorg.xev
xorg.xinit
xorg.xkill
xorg.xorgserver
xorg.xbacklight
xscreensaver
libisoburn
#****************************************
#Extra
hardinfo
transmission-qt
zathura
#****************************************

   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

security.rngd.enable = false; 

#fileSystems."/virtualboxshare" = {
 #   fsType = "vboxsf";
 #   device = "1._Sync_mappen";
 #   options = [ "rw" "nofail" ];
 # };

}

