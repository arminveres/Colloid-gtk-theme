{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      {
        packages = {
          colloid-gtk-theme = (import ./nix/default.nix) {
            inherit (nixpkgs.legacyPackages.${system})
              lib
              stdenvNoCC
              fetchFromGitHub
              gnome-themes-extra
              gtk-engine-murrine
              jdupes sassc;
          };
        };
      });
}
