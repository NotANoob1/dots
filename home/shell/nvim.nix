{ inputs, ... }:

{
  imports = [
    inputs.nvf.homeManagerModules.nvf
  ];

  programs.nvf = {
    enable = true;
    settings.vim = {
      viAlias = true;
      vimAlias = true;

      lsp.enable = true;

      treesitter = {
        enable = true;
        context.enable = true;
        indent.enable = false;
      };

      statusline.lualine.enable = true;
      autocomplete.nvim-cmp.enable = true;
      telescope.enable = true;

      languages = {
        enableFormat = true;
        nix.enable = true;
        rust.enable = true;
        lua.enable = true;
        java.enable = true;
        kotlin.enable = true;
        json.enable = true;
        python.enable = true;
        clang.enable = true;
      };

      options = {
        tabstop = 2;
        expandtab = true;
        softtabstop = 2;
        shiftwidth = 2;
        autoindent = true;
        smartindent = true;
      };

      git.enable = true;
      terminal.toggleterm.lazygit.enable = true;

      keymaps = [
        {
          mode = "n";
          key = "f";
          action = "<cmd>lua vim.lsp.buf.format()<CR>";
          desc = "format file";
        }
        {
          mode = "n";
          key = "ff";
          action = "<cmd>Telescope find_files<CR>";
          desc = "fuzzy find files";
        }
        {
          mode = "n";
          key = "cw";
          action = "<cmd>Yazi cwd<cr>";
          desc = "open yazi in directory";
        }
        {
          mode = "n";
          key = "e";
          action = "<cmd>lua vim.diagnostic.open_float()<cr>";
          desc = "show error";
        }
        {
          mode = "n";
          key = "w";
          action = "<cmd>w<cr>";
          desc = "write file";
        }
      ];

      utility.yazi-nvim.enable = true;
      notify.nvim-notify.enable = true;
    };
  };
}
