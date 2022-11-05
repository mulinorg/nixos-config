{ config, pkgs, ... }:

{
  imports =
    [
      ../../hardware/hyper-v.nix
      ../../users/mulin/user.nix
    ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  nix.settings.substituters = [
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "vm-nixos";
  networking.nameservers = [
    "119.29.29.29"
    "223.5.5.5"
  ];

  time.timeZone = "Asia/Shanghai";

  environment.systemPackages = with pkgs; [
    curl
    dig
    nodejs
    parted
    rnix-lsp
    unstable.go
    vim
    wget
    texlive.combined.scheme-full
  ];

  services.openssh.enable = true;

  system.stateVersion = "22.05";
}
