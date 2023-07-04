{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nixneovim.nixosModules.default
  ];

  programs.nixneovim = {
    enable = true;
    colorscheme = "catppuccin-mocha";
    extraPlugins = with pkgs; [
      vimPlugins.catppuccin-nvim
    ];

    extraConfigLua = ''
      	    require("catppuccin").setup({
      		transparent_background = true,
      	    })
      	'';

    plugins = {
      lsp-lines.enable = true;
      lsp-progress.enable = true;
      lspkind.enable = true;
      nvim-cmp.enable = true;
      nvim-cmp.snippet.luasnip.enable = true;
      coq-nvim = {
        enable = true;
        autoStart = true;
      };
      lualine = {
        enable = true;
        theme = "catppuccin";
      };
      lsp = {
        enable = true;
        coqSupport = true;
        servers = {
          cssls.enable = true;
          html.enable = true;
          pyright.enable = true;
          rnix-lsp.enable = true;
        };
      };
      treesitter = {
        enable = true;
        indent = true;
      };
    };
  };
}
