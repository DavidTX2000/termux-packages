{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  pname = "aether-sync";
  version = "1.0.0";

  src = pkgs.fetchFromGitHub {
    owner = "DavidTX2000";
    repo = "aether-sync";
    rev = "v${version}";
    sha256 = "0000000000000000000000000000000000000000000000000000"; 
  };

  installPhase = ''
    mkdir -p $out/bin
    cp aether $out/bin/
    chmod +x $out/bin/aether
  '';

  meta = with pkgs.lib; {
    description = "Stealth isolation and environment management for terminal emulation";
    homepage = "https://github.com/DavidTX2000/aether-sync";
    license = licenses.mit;
    maintainers = [ "David Thomas Xavier" ];
    platforms = platforms.linux;
  };
}
