{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    poetry2nix.url = "github:nix-community/poetry2nix/secp256k1-0_14_0";
  };
  outputs = { self, nixpkgs, poetry2nix }:
  let
    pkgs = import nixpkgs { system = "x86_64-linux"; overlays = [ poetry2nix.overlay ]; };
#    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    packages.x86_64-linux.lnbits = pkgs.poetry2nix.mkPoetryApplication {
      projectDir = ./.;
    };
#    packages.x86_64-linux.lnbits = pkgs.python39Packages.buildPythonPackage {
#      propagatedBuildInputs = with pkgs; [
#        poetry
#        python39Packages.ecdsa
#        python39Packages.zipp
#      ];
#      pname = "lnbits";
#      version = "0.1.0";
#      format = "pyproject";
#      src = ./.;
#    };
  };
}
