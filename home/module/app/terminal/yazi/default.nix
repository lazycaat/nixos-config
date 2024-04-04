_:

{

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;

    settings = {
        log = {
          enabled = false;
        };
        manager = {
          show_hidden = true;
          sort_by = "natural";
          sort_dir_first = true;
          sort_reverse = false;
          linemode = "mtime";
          show_symlink = true;
        };
    };
   
  };
  
}
