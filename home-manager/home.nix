{ config, pkgs, ... }:

{
  home.username = "shorya";
  home.homeDirectory = "/home/shorya";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  #Home Packages
  home.packages = with pkgs;[
   neovim
   kitty
   tmux
   btop
   fzf
   unzip
   brave
   yazi
   xwallpaper
   clang-tools
   fastfetch
   rofi
   lazygit
   picom
   nil
   networkmanager_dmenu
   networkmanagerapplet
  ];

  #configure tmux
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ../configs/tmux/tmux.conf;
  };

  # configure picom
  services.picom = {
    enable = true;
    backend = "glx";
    fade = true;
    settings = {
      fade-delta = 5;
      corner-radius = 12;
      shadow = true;
    };
  };

  home.file = {
  	".config/nvim".source = ../configs/nvim;
  	".config/rofi".source = ../configs/rofi;
  	".config/kitty".source = ../configs/kitty;
  	".config/qtile".source = ../configs/qtile;
  	".config/yazi".source = ../configs/yazi;
    "config/fastfetch".source = ../configs/fastfetch;
  	".zshrc".source = ../configs/.zshrc;
  };


  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
