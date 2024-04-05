{
  pkgs,
  ...
}:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    vim # or some other editor, e.g. nano or neovim
    git
    helix
    zellij
    yazi
    wget
    curl

    # Some common stuff that people expect to have
    #procps
    #killall
    #diffutils
    #findutils
    #utillinux
    #tzdata
    #hostname
    #man
    #gnugrep
    #gnupg
    #gnused
    #gnutar
    #bzip2
    #gzip
    #xz
    #zip
    #unzip
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  system.stateVersion = "23.11";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Set your time zone
  #time.timeZone = "Europe/Berlin";

  # Configure home-manager
  home-manager = {
    # config = "${self}/home/user/user1/home";

    # attribute 'self' missing
    config = ../../../home/user/user1/home;

    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
    sharedModules = [
      {home.stateVersion = "23.11";}
    ];

  };

  # User

  user = {
    shell = "${pkgs.fish}/bin/fish";
  };
  
}
