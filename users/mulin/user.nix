{ pkgs, ... }:

let
  authKey = builtins.replaceStrings [ "\n" ] [ "" ] (builtins.readFile ../../ssh/auth.pub); in
{
  users.users = {
    mulin = {
      description = "Mu Lin";
      extraGroups = [
        "wheel"
      ];
      hashedPassword = "$6$i4x/MYGamLnVkX2H$HJkenUiYARhY8rtT78yks3XCdi1RKYzR1OWWdYu9fkPNfwxtdpKd.ory26o0H1nUxGNt4e.geW2F4y.XNOe1v0";
      home = "/home/mulin";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [ authKey ];
      shell = pkgs.zsh;
    };
  };
}
