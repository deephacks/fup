import os, terminal
from strutils import contains


const 
  maxInt32 = high(int32)


template match(s: string, filter: string, exact: bool): bool = 
  (exact and s == filter) or (not exact and s.contains(filter))

iterator walk(dir: string, kinds = {pcFile, pcDir}): (string, string, string) =
  for (kind, path) in walkDir(dir):
    if kind in kinds:
      yield splitFile(path)

proc fup0(patterns: seq[string], 
  exact = false, full = false, file = false, dir = false, incl = false,
  level = maxInt32, num = maxInt32,
  workdir = "") = 
  let
    filters = if patterns.len == 0: @[""] else: patterns
    kinds = if file: {pcFile} elif dir: {pcDir} else: {pcFile, pcDir}
  var 
    depth = 0
    matches = 0
    workdir = if workdir.len == 0: getCurrentDir() else: workdir
  for filter in filters:
    for dir in parentDirs(workdir, inclusive = incl):
      depth.inc
      if depth <= level:
        for (dir, name, ext) in walk(dir, kinds):
          var path = if full: dir / name & ext else: name & ext
          if path.match(filter, exact) and matches <= num:
            matches.inc
            echo dir / name & ext

when isMainModule:
  import cligen

  dispatch(fup0, "fup",
    short = {
      "workdir":  'w',
      "full":     'F',
      "file":     'f',
      "dir":      'd',
      "incl":     'i',
      "num":      'n',
      "level":    'l'
    },
    help  = {
      "exact":        "match name path exactly",
      "full":         "match full path",
      "full":         "match full path",
      "dir":          "only match dirs",
      "file":         "only match files",
      "incl":         "include workdir",
      "level":        "limit directory traversal",
      "num":          "max results",
      "help-syntax":  "CLIGEN-NOHELP",
    },
    doc = "   find paths in parent directories", 
    noHdr = true
  )
