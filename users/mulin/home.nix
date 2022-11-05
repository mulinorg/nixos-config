{ lib, ... }:

let signKey = lib.strings.fileContents ../../ssh/sign.pub; in
{
  home.file = {
    ".ssh/allowed_signers".text = "mulin@mulin.org " + signKey + "\n";
  };

  programs = {
    git = {
      enable = true;
      extraConfig = {
        gpg.format = "ssh";
        gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
        init.defaultBranch = "main";
      };
      lfs.enable = true;
      signing = {
        key = signKey;
        signByDefault = true;
      };
      userEmail = "mulin@mulin.org";
      userName = "Mu Lin";
    };

    zsh = {
      autocd = true;
      enable = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "docker"
          "encode64"
          "extract"
          "git-lfs"
          "git"
          "gitignore"
          "golang"
          "history"
          "man"
          "python"
          "terraform"
          "z"
        ];
        theme = "robbyrussell";
      };
    };
  };
}
