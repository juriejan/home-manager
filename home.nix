{ pkgs, ... }:

{

  imports = [
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
    pkgs.qpdf
    pkgs.speedtest-go
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;

  programs.aichat = {
    enable = true;
    settings = {
      model = "openrouter:z-ai/glm-5";
      clients = [
        {
          type = "openai-compatible";
          name = "openrouter";
          api_base = "https://openrouter.ai/api/v1";
        }
      ];
    };
  };
}
