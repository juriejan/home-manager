{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      alias = {
        ad = "add";
        br = "branch";
        ci = "commit";
        co = "checkout";
        pl = "pull";
        ps = "push";
        st = "status";
      };
      core.editor = "hx";
      user = {
        name = "Jurie-Jan Botha";
        email = "juriejanbotha@gmail.com";
      };
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };

  programs.gh.enable = true;
}
