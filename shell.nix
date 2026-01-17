{ ... }:

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableNushellIntegration = true;
  };

  programs.nushell = {
    enable = true;
    extraEnv = ''
      $env.PATH = (
        $env.PATH
        | split row (char env_sep)
        | append '/run/current-system/sw/bin'
        | append '/nix/var/nix/profiles/default/bin'
        | append $'($env.HOME)/.nix-profile/bin'
        | append '/opt/homebrew/bin'
        | uniq
      )
    '';
  };

  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    settings = {
      format = ''
        $os$username$hostname$directory$git_branch
        $character
      '';
      os = {
        disabled = false;
        style = "bold blue";
      };
      username = {
        show_always = true;
        style_user = "bold green";
        format = "[$user]($style)";
      };
      hostname = {
        ssh_only = false;
        format = "@[$hostname](bold red) ";
      };
      directory = {
        truncation_length = 3;
        style = "bold italic cyan";
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };
}
