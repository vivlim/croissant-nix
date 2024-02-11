{ bit32, buildLuarocksPackage, compat53, fetchgit, fetchurl, hump, lua, lua-term
, luaOlder, wcwidth, ... }:
buildLuarocksPackage {
  pname = "sirocco";
  version = "0.0.1-5";
  knownRockspec = (fetchurl {
    url = "mirror://luarocks/sirocco-0.0.1-5.rockspec";
    sha256 = "0bs2zcy8sng4x16clfz47cn4l6fw43rj224vjgmnkfvp9nznd4b4";
  }).outPath;
  src = fetchgit (removeAttrs (builtins.fromJSON ''
    {
      "url": "https://github.com/giann/sirocco",
      "rev": "b2af2d336e808e763b424d2ea42e6a2c2b4aa24d",
      "date": "2019-03-10T06:11:17+01:00",
      "path": "/nix/store/jh7vjxmlm7m47n4pydd2x7wph1ga5ljv-sirocco",
      "sha256": "1mkkdfjc7zc3as3vpyvqbg3ldgcb2s16lgxc8mrxc74kwiblgird",
      "hash": "sha256-LcdHV+STHNZzRaw/aoIWi71Gx1t4+7uHVoP9w6Rrc9Y=",
      "fetchLFS": false,
      "fetchSubmodules": true,
      "deepClone": false,
      "leaveDotGit": false
    }
  '') [ "date" "path" "sha256" ]);

  disabled = (luaOlder "5.1");
  propagatedBuildInputs = [ bit32 compat53 hump lua lua-term wcwidth ];

  meta = {
    homepage = "https://github.com/giann/sirocco";
    description = "A collection of useful cli prompts";
    license.fullName = "MIT/X11";
  };
}
