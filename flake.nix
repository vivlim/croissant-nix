{
  description = "A Lua REPL and debugger implemented in Lua, packed in a Nix flake.";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };
    rock-candy = {
      url = "github:vivlim/rock-candy";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, rock-candy, ... }:
    {
      packages = let
        pkgSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
        packagesForEachSystem = f: nixpkgs.lib.genAttrs pkgSystems (system: f {
          pkgs = import nixpkgs { inherit system; };
        });
      in packagesForEachSystem ({ pkgs }: let
        lua = rock-candy.lib.luaWithRocksFromDir {
          lua = pkgs.lua5_2;
          dir = ./generated-luarocks;
          inherit pkgs;
        };
      in {
        default = pkgs.writeShellScriptBin "croissant" ''
          ${lua.out}/bin/croissant $@
        '';
      });
    };
}
