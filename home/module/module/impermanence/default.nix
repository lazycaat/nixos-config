{
  config,
  ...
}:

{

  environment.persistence."/persist" = {
    hideMounts = true;
    users.${config.users.users} = {
      directories = [
        "Downloads"
        "Music"
        "Pictures"
        "Documents"
        "Videos"
      ];
    };
  };
  
}
