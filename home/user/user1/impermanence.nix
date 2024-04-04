{
  ...
}:

{

  environment.persistence."/persist" = {
    hideMounts = true;
    users.user1 = {
      directories = [
        "Downloads"
        "Music"
        "Pictures"
        "Documents"
        "Videos"
      ];
      files = [
        ".local/share/fish/fish_history"
      ];
    };
  };
  
}
