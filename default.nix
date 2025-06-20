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
    libsForQt5.qt5.qtsvg
    kdePackages.qtsvg
  ];

  home.sessionVariables = {
    QS_CONFIG_PATH = "/etc/nixos/modules/home/quickshell";
    QML2_IMPORT_PATH = lib.concatStringsSep ":" [
      "${quickshell}/lib/qt-6/qml"
      "${pkgs.kdePackages.qtdeclarative}/lib/qt-6/qml"
      "${pkgs.kdePackages.kirigami.unwrapped}/lib/qt-6/qml"
    ];
  };
}
