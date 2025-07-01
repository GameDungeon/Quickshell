{
  self,
  lib,
  inputs,
  pkgs,
  config,
  ...
}:
let
  inherit (pkgs.stdenv.hostPlatform) system;
  quickshell = inputs.quickshell.packages.${system}.default;
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

    xdg.stateFile."caelestia/scheme.json".source = ./config_files/mocha.json;

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
