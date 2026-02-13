{ pkgs, ... }:

{
  home.packages = [
    pkgs.nil
  ];

  home.shellAliases = {
    zed = "zeditor";
  };

  programs.helix = {
    enable = true;
  };

  programs.vscode = {
    enable = true;
  };

  programs.zed-editor = {
    enable = true;
    extensions = [
      "codebook"
      "csv"
      "dart"
      "dockerfile"
      "html"
      "make"
      "mcp-server-context7"
      "mcp-server-sequential-thinking"
      "nix"
      "sql"
      "terraform"
      "toml"
    ];
    userSettings = {
      show_whitespaces = "all";
      context_servers = {
        mcp-server-context7 = {
          enabled = true;
          settings = {
            context7_api_key = "\${CONTEXT7_API_KEY}";
          };
        };
      };
      preferred_line_length = 80;
      soft_wrap = "preferred_line_length";
      ui_font_size = 14;
      buffer_font_size = 12;
      terminal = {
        shell = {
          program = "nu";
        };
      };
    };
  };
}
