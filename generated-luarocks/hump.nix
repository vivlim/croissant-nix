{ buildLuarocksPackage, fetchgit, fetchurl, lua, luaOlder, ... }:
buildLuarocksPackage {
  pname = "hump";
  version = "0.4-2";
  knownRockspec = (fetchurl {
    url = "mirror://luarocks/hump-0.4-2.rockspec";
    sha256 = "0j89rznvq90bvjsj1mj9plxmxj8c7b4jkqsllw882f8xscdqq2sa";
  }).outPath;
  src = fetchgit (removeAttrs (builtins.fromJSON ''
    {
      "url": "https://github.com/vrld/hump",
      "rev": "08937cc0ecf72d1a964a8de6cd552c5e136bf0d4",
      "date": "2021-03-23T19:50:46+01:00",
      "path": "/nix/store/pph6fj29fshcysa3g80qf8vw2znyv238-hump",
      "sha256": "0vr8zclf0c1x9mwv49m8ldvsdbidms25agl24rcng3q1n15v4289",
      "hash": "sha256-CQmyS7ABj2dZJoI+VYSuLa6md6OoJrJ5TT0w4Cj7KG8=",
      "fetchLFS": false,
      "fetchSubmodules": true,
      "deepClone": false,
      "leaveDotGit": false
    }
  '') [ "date" "path" "sha256" ]);

  disabled = (luaOlder "5.1");
  propagatedBuildInputs = [ lua ];

  meta = {
    homepage = "https://hump.readthedocs.io";
    description = "Lightweight game development utilities";
    license.fullName = "MIT";
  };
}
