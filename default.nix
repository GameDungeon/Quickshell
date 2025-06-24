{
  pkgs,
  inputs,
  lib,
  ...
}:
let
  quickshell = inputs.quickshell.packages.${pkgs.system}.default;
in
{
  home.packages = with pkgs; [
    quickshell
    lm_sensors
    ddcutil
  ];

  home.sessionVariables = {
    QS_CONFIG_PATH = "/etc/nixos/modules/home/quickshell";
    QML2_IMPORT_PATH = lib.concatStringsSep ":" [
      "${quickshell}/lib/qt-6/qml"
      "${pkgs.kdePackages.qtdeclarative}/lib/qt-6/qml"
      "${pkgs.kdePackages.kirigami.unwrapped}/lib/qt-6/qml"
    ];
  };

  xdg.stateFile."caelestia/scheme.json".source = ./config_files/mocha.json;
  xdg.stateFile."caelestia/wallpaper/path.txt".text = builtins.path {
    path = ../../../images/nix-wallpaper.png;
    name = "nix-wallpaper";
  };
  #  builtins.path {
  #   path = ../../../images/nix-wallpaper-binary-black.png;
  #   name = "binary-wallpaper";
  # };
}
