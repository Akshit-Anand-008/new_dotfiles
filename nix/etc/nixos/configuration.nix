# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # Enable networking
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.upower.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

services.keyd = {
  enable = true;
  keyboards = {
    default = {
      ids = [ "*" ];
      settings = {
        main = {
          capslock = "esc";
          leftalt = "leftcontrol";
          rightalt = "rightcontrol";
          "leftshift+leftmeta+f23" = "leftalt";
        };
      };
    };
  };
};

programs.zsh = {
  enable = true;
  interactiveShellInit = ''
    source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
  '';
};

fonts.packages = with pkgs; [
  jetbrains-mono
  nerd-fonts.jetbrains-mono
];

  users.users."akshit" = {
    isNormalUser = true;
    description = "Akshit_Anand";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      neovim tree-sitter
      lua-language-server clang-tools
      bat tealdeer eza
      thunderbird
      zsh zsh-vi-mode starship
      taskwarrior3 nnn btop
      tmux
      stow
      zathura
      nodejs
      (texlive.combine { inherit (texlive) scheme-small latexmk amsmath biber; })
    ];
  };

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    alacritty
    git
    fzf fd ripgrep
    gnumake cmake gcc gdb
    gzip zip unzip
    curl
    stdenv.cc
    niri
    noctalia-shell
    xwayland-satellite
    wayland-utils
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
