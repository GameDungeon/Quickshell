{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
  quickshell = inputs.quickshell.packages.${pkgs.system}.default;
in
{
  options = {
    caelestia.enable = lib.mkEnableOption "Enable Caelestia UI";
  };

  config = lib.mkIf config.caelestia.enable {
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
  };
}
