{ stdenv, cmake, hellolib }:

stdenv.mkDerivation rec {
  pname = "hellolib";
  version = "0.1.0";
  src = ./.;
  nativeBuildInputs = [ cmake ];
}