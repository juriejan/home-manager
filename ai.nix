{ ... }:

{

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
          url = "https://mcp.context7.com/mcp";
          headers = {
            X-API-Key = "$CONTEXT7_API_KEY";
          };
        };
      };
    };
  };

  programs.claude-code = {
    enable = true;
    settings = {
      model = "claude-opus-4-6";
      effortLevel = "high";
      mcpServers = {
        context7 = {
          type = "http";
          url = "https://mcp.context7.com/mcp";
          headers = {
            X-API-Key = "$CONTEXT7_API_KEY";
          };
        };
      };
    };
  };

}
