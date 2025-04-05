{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  pname = "pg_processfile";
  version = "1.0";

  src = ./.;

  buildInputs = [ pkgs.postgresql pkgs.gcc ];

  buildPhase = ''
    make
  '';

  installPhase = ''
    mkdir -p $out/lib
    mkdir -p $out/share/postgresql/extension
    cp *.so $out/lib/
    cp *.sql *.control $out/share/postgresql/extension/
  '';
}
