{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  services.xserver.enable = true;
  services.xserver = {
	windowManager.qtile.enable = true;
	displayManager.sessionCommands = ''
	xwallpaper --zoom $HOME/wallpapers/miyabi.jpg
	xset r rate 200 35 &
	'';
   };
  
  #Terminal Shells
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.shorya = {
   isNormalUser = true;
   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
   shell = pkgs.zsh;
   packages = with pkgs; [
     tree
   ];
 };

  programs.firefox.enable = true;

  # List packages installed in system profile.
 environment.systemPackages = with pkgs; [
   vim 
   wget
   git 
   gcc 
   python3
   rustc
   cargo
   nodejs
   unzip
   gnumake
   cmake
 ];

 fonts.packages = with pkgs; [
   jetbrains-mono
 ];

  system.stateVersion = "25.05"; # Did you read the comment?

  #Enable Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"] ;

}
