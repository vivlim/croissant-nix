{ buildLuarocksPackage, fetchurl, lua, luaOlder, ... }:
buildLuarocksPackage {
  pname = "lpeg";
  version = "1.1.0-1";
  knownRockspec = (fetchurl {
    url = "mirror://luarocks/lpeg-1.1.0-1.rockspec";
    sha256 = "03af1p00madfhfxjzrsxb0jm0n49ixwadnkdp0vbgs77d2v985jn";
  }).outPath;
  src = fetchurl {
    url = "http://www.inf.puc-rio.br/~roberto/lpeg/lpeg-1.1.0.tar.gz";
    sha256 = "0aimsjpcpkh3kk65f0pg1z2bp6d83rn4dg6pgbx1yv14s9kms5ab";
  };

  disabled = (luaOlder "5.1");
  propagatedBuildInputs = [ lua ];

  meta = {
    homepage = "http://www.inf.puc-rio.br/~roberto/lpeg.html";
    description = "Parsing Expression Grammars For Lua";
    license.fullName = "MIT/X11";
  };
}
