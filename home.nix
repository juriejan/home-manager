{ pkgs, ... }:

{

  imports = [
    ./chat.nix
    ./editors.nix
    ./scm.nix
    ./shell.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  home.username = "jjb";
  home.homeDirectory = "/Users/jjb";
  home.stateVersion = "25.11";

  home.packages = [
    pkgs.certbot
    pkgs.colima
    pkgs.docker
    pkgs.fvm
    pkgs.gdrive3
    pkgs.qpdf
    pkgs.speedtest-go
    pkgs.thunderbird
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;

}
