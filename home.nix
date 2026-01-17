{ pkgs, ... }:

{

  imports = [
    ./editors.nix
    ./git.nix
    ./shell.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  home.username = "jjb";
  home.homeDirectory = "/Users/jjb";
  home.stateVersion = "25.11";

  home.packages = [
    pkgs.fvm
    pkgs.qpdf
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  home.shellAliases = {
    zed = "zeditor";
  };

  programs.home-manager.enable = true;
}
