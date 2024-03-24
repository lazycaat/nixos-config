{
  inputs,
  ...
}:

{

  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];


  fileSystems."/persist".neededForBoot = true;

  # 172 request
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      # "/var/log"
    ];
  };
  
}
