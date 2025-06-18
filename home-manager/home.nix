{ config, pkgs, ... }:

{
  home.username = "shorya";
  home.homeDirectory = "/home/shorya";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  #Home Packages
  home.packages = with pkgs;[
   vim 
   wget
   git 
   neovim
   kitty
   tmux
   btop
   gcc 
   python3
   nodejs
   fzf
   unzip
   brave
   yazi
   xwallpaper
   clang-tools
   fastfetch
   rofi
   lazygit
   nil
   rustc
   cargo
  ];

  #configure tmux
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ../configs/tmux/tmux.conf;
  };

  home.file = {
  	".config/nvim".source = ../configs/nvim;
    # ".config/tmux".source = ../configs/tmux;
  	".config/rofi".source = ../configs/rofi;
  	".config/kitty".source = ../configs/kitty;
  	".config/qtile".source = ../configs/qtile;
  	".config/yazi".source = ../configs/yazi;
  	".zshrc".source = ../configs/.zshrc;
  };


  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
