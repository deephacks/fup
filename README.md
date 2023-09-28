
# fup

Find files in parent directories

```bash
fup [optional-params] [patterns: string...]
   find paths in parent directories
Options:
  -h, --help                           print this cligen-erated help
  -e, --exact      bool    false       match name path exactly
  -F, --full       bool    false       match full path
  -f, --file       bool    false       only match files
  -d, --dir        bool    false       only match dirs
  -i, --incl       bool    false       include workdir
  -l=, --level=    int32   2147483647  limit directory traversal
  -n=, --num=      int32   2147483647  max results
  -w=, --workdir=  string  ""          set workdir
```

