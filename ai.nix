{ pkgs, ... }:

let
  rust-mcp-filesystem = pkgs.rustPlatform.buildRustPackage {
    pname = "rust-mcp-filesystem";
    version = "main";
    src = pkgs.fetchFromGitHub {
      owner = "rust-mcp-stack";
      repo = "rust-mcp-filesystem";
      rev = "main";
      hash = "sha256-GC72nFi0fI3GIj6X0BW+b4/sixi7ATszxjhkv8SiAkA=";
    };
    cargoHash = "sha256-5GSWZGC/ACUcwCWC7giRqS+yj2SA/dsZtedcmAGvVJs=";
    doCheck = false;
  };
in
{
  home.packages = [
    rust-mcp-filesystem
  ];

  programs.gemini-cli = {
    enable = true;
    settings = {
      security.auth.selectedType = "gemini-api-key";
      security.auth.geminiApiKey.apiKey = "$GOOGLEAI_API_KEY";
      general = {
        sessionRetention = {
          enabled = true;
          maxAge = "30d";
          warningAcknowledged = true;
        };
        preferredEditor = "hx";
      };
      mcpServers = {
        context7 = {
          url = "https://mcp.context7.com/sse";
          headers = {
            X-API-Key = "$CONTEXT7_API_KEY";
          };
        };
      };
    };
  };

  programs.aichat = {
    enable = true;
    settings = {
      model = "openrouter:google/gemini-3.1-pro-preview";
      function_calling = true;
      clients = [
        {
          type = "openai-compatible";
          name = "openrouter";
          api_base = "https://openrouter.ai/api/v1";
          models = [
            {
              name = "google/gemini-3.1-pro-preview";
              supports_function_calling = true;
              use_tools = [ "filesystem" ];
            }
          ];
          patch = {
            chat_completions = {
              ".*" = {
                body = {
                  include_reasoning = false;
                };
              };
            };
          };
        }
      ];
      mcp_servers = [
        {
          name = "filesystem";
          command = "${rust-mcp-filesystem}/bin/rust-mcp-filesystem";
          args = [
            "/Users/jjb/.config/home-manager"
            "/Users/jjb/Projects"
          ];
        }
      ];
    };
  };
}
