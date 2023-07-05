{
  config,
  pkgs,
  nixpkgs-f2k,
  ...
}: {
  services.picom = {
    enable = true;
    package = nixpkgs-f2k.packages.${pkgs.system}.picom-ft-labs;
    extraArgs = ["--animations"];

    fade = true;
    fadeDelta = 5;
    fadeSteps = [ 0.05 0.05 ];
    fadeExclude = [
        "window_type *= 'menu'"
    ];

    backend = "glx";
    settings = {
      corner-radius = 12;

      animation-stiffness = 300;
      animation-window-mass = 1;
      animation-dampening = 25;
      animation-clamping = true;

      animation-for-open-window = "zoom";
      animation-for-menu-window = "slide-down";
      animation-for-transient-window = "slide-down";
      animation-for-prev-tag = "zoom";
      enable-fading-prev-tag = true;
      animation-for-next-tag = "zoom";
      enable-fading-next-tag = true;

      shadow = true;
      shadow-radius = 20;
      shadow-offset-x = -20;
      shadow-offset-y = -18;

      no-fading-openclose = false;

      vsync = false;
      glx-no-stencil = true;
      glx-no-rebind-pixmap = true;
      xrender-sync-fence = true;
      use-damage = true;
    };
  };
}
