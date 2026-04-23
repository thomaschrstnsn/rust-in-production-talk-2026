{
  description = "Presenterm dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        py = pkgs.python3.withPackages (ps: [
          ps.weasyprint
        ]);
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            presenterm
            qrencode

            py
            # native deps WeasyPrint needs
            cairo
            pango
            gdk-pixbuf
            glib
            harfbuzz
            freetype
            fontconfig
            libffi
            libjpeg
            libpng

            # optional fonts
            dejavu_fonts
          ];

          shellHook = ''
            echo "📽  presenterm ready"
          '';
        };
      }
    );
}
