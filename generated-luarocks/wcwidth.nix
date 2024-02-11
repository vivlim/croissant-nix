{ buildLuarocksPackage, fetchgit, fetchurl, lua, luaOlder, ... }:
buildLuarocksPackage {
  pname = "wcwidth";
  version = "0.5-1";
  knownRockspec = (fetchurl {
    url = "mirror://luarocks/wcwidth-0.5-1.rockspec";
    sha256 = "0hyl8f3fvmiq2grhafz1cbnkp60mb58y2p8jg7yafin9kk69zg64";
  }).outPath;
  src = fetchgit (removeAttrs (builtins.fromJSON ''
    {
      "url": "https://github.com/aperezdc/lua-wcwidth",
      "rev": "2742b255aec83b80bc288cedc02681a9c1db3208",
      "date": "2020-03-29T19:46:48+03:00",
      "path": "/nix/store/lysh6077537mwx72k90ak6rp7zzs5fr7-lua-wcwidth",
      "sha256": "1ay2dq82lca58na939k0774vq7x0k2hhj059ylhg2wvm9mn3cqxb",
      "hash": "sha256-q2M2bE11c/Eg9akACaGYoB+8yTlgppGURUUxKhBuwqs=",
      "fetchLFS": false,
      "fetchSubmodules": true,
      "deepClone": false,
      "leaveDotGit": false
    }
  '') [ "date" "path" "sha256" ]);

  disabled = (luaOlder "5.1");
  propagatedBuildInputs = [ lua ];

  meta = {
    homepage = "https://github.com/aperezdc/lua-wcwidth";
    description = "Pure Lua implementation of the wcwidth() function";
    license.fullName = "MIT/X11";
  };
}
