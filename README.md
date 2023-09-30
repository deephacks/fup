
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


## build

1. Install [Nim v2.0](https://nim-lang.org/blog/2023/08/01/nim-v20-released.html) using [choosenim](https://github.com/dom96/choosenim) to `~/.choosenim`
   
   `curl https://nim-lang.org/choosenim/init.sh -sSf | sh`

2. install executable executable to `~/.nimble/bin`
   
   `nimble install`
