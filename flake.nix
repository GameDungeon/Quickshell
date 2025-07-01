{
  description = "Hyprland is a dynamic tiling Wayland compositor that doesn't sacrifice on its looks";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      ...
    }:
    let
      inherit (nixpkgs) lib;
      inherit (nixpkgs) config;
    in
    {
      # nixosModules.default = import ./nix/module.nix inputs;
      homeManagerModules.default = import ./nix/hm-module.nix {
        inherit
          self
          lib
          inputs
          nixpkgs
          config
          ;
      };
    };
}
