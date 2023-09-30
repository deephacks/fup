version     = "0.0.1"
author      = "Kristoffer Sjögren"
description = "Find files in parent directories"
license     = "MIT"

bin = @[ "fup" ]
binDir = ".bin"

requires "nim >= 2.0.0", "cligen"
