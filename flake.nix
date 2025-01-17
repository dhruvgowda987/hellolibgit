{
  description = "lab2p3 flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
    let 
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      overlays = [ self.overlays.default ];
    };  

    hellolib_overlay = final: prev: {
          hellolib = final.callPackage ./default.nix { };
    };
    my_overlays = [ hellolib_overlay ];

    
  in
  {      
    packages.x86_64-linux.default = pkgs.hellolib;
    overlays.default = nixpkgs.lib.composeManyExtensions my_overlays;
  };
}