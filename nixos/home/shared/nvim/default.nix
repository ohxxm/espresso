{ inputs, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
  };

  home.activation.installNvimConfig = ''
    if [ ! -d "$HOME/.config/nvim/" ]; 
    then
      ln -s "/etc/nixos/home/shared/nvim/custom" "$HOME/.config/nvim/lua/"
    	chmod -R +w "$HOME/.config/nvim/lua/custom"
    fi
  '';
}
