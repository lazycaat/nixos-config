{
  ...
}:

{

  programs.helix = {
    enable = true;
    settings = {

      editor = {
        line-number = "relative";
        text-width = 70;
        bufferline = "multiple";
        default-line-ending = "lf";
        rulers = [73];
        cursorline = true;
        auto-info = true;
        color-modes = true;

        lsp = {
          display-messages = true;
          display-inlay-hints	= true;
        };

        soft-wrap = {
          enable = true;
          wrap-at-text-width = true;
        };

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        statusline = {
          left = ["mode" "spinner" "file-modification-indicator" "read-only-indicator"];
          center = [ "version-control" "file-name"];
          right = ["diagnostics" "selections" "position" "file-encoding" "file-line-ending" "file-type"];
          separator = "│";
          mode.normal = "NORMAL";
          mode.insert = "-- INSERT --";
          mode.select = "-- SELECT --";
        };

        indent-guides = {
          render = true;
          character = "▏";
        };

      };

      keys = {
        insert = {
          j.k = "normal_mode";
        };
      };

    };

  };
 
}
