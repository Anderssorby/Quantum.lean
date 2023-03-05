{
  inputs = {
    lean = {
      url = "github:leanprover/lean4";
    };
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { self, lean, flake-utils, nixpkgs }:
    let
      supportedSystems = [
        "aarch64-linux"
        "aarch64-darwin"
        "i686-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      inherit (flake-utils) lib;
    in
    lib.eachSystem supportedSystems (system:
      let
        leanPkgs = lean.packages.${system};
        pkgs = nixpkgs.legacyPackages.${system};
        name = "Quantum";  # must match the name of the top-level .lean file
        project = leanPkgs.buildLeanPackage {
          inherit name;
          src = ./.;
        };
      in
      {
        inherit project;
        packages = project // {
          ${name} = project.executable;
        };

        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              elan
            ];
          };
          lean-dev = pkgs.mkShell {
            buildInputs = with pkgs; [
              leanPkgs.lean-dev
            ];
          };
        };
      });
}
