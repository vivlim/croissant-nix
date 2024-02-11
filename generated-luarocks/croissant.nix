{ argparse, buildLuarocksPackage, compat53, fetchgit, fetchurl, hump, lpeg, lua
, luaOlder, sirocco, ... }:
buildLuarocksPackage {
  pname = "croissant";
  version = "0.0.1-6";
  knownRockspec = (fetchurl {
    url = "mirror://luarocks/croissant-0.0.1-6.rockspec";
    sha256 = "0jdj7akx9r1ak40ff1997f7i6d5hw8533w21fckdvvpyg01kc8qz";
  }).outPath;
  src = fetchgit (removeAttrs (builtins.fromJSON ''
    {
      "url": "https://github.com/giann/croissant",
      "rev": "65f2d3d61b9b13bdc380afc2eaf0c7c6ef461be7",
      "date": "2019-11-19T07:23:36+01:00",
      "path": "/nix/store/lahj87bdnn6w23p2plfddz7gpn5a0s4f-croissant",
      "sha256": "0ya8wc97bsnxdccdcfvp2202a8wlypn8gv9hfdx6193qyds2yvp9",
      "hash": "sha256-6W4vdPN4pGB6czDth+z1lCMlgBB3O9YYa93qdRLjSHk=",
      "fetchLFS": false,
      "fetchSubmodules": true,
      "deepClone": false,
      "leaveDotGit": false
    }
  '') [ "date" "path" "sha256" ]);

  disabled = (luaOlder "5.1");
  propagatedBuildInputs = [ argparse compat53 hump lpeg lua sirocco ];

  meta = {
    homepage = "https://github.com/giann/croissant";
    description = "A Lua REPL implemented in Lua";
    license.fullName = "MIT/X11";
  };
}
