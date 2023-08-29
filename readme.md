# Peepsight

Working on a lot of code can be overwelming sometimes, so just focus on one function at the time.
Peepsight is created to allow you to focus on a single function using treesitter.

[![asciicast](https://asciinema.org/a/7w0JoI88ZAEIlbTvwCZKM1voN.svg)](https://asciinema.org/a/7w0JoI88ZAEIlbTvwCZKM1voN)

## Installation

Make sure you are using Neovim (v0.7) or the latest Neovim nightly.

Using [vim-plug](https://github.com/junegunn/vim-plug)

```viml
Plug 'koenverburg/peepsight.nvim'
```

Using [dein](https://github.com/Shougo/dein.vim)

```viml
call dein#add('koenverburg/peepsight.nvim')
```
Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use 'koenverburg/peepsight.nvim'
```
## Setup

```lua
require('peepsight').setup({
  -- go
  "function_declaration",
  "method_declaration",
  "func_literal",

  -- typescript
  "class_declaration",
  "method_definition",
  "arrow_function",
  "function_declaration",
  "generator_function_declaration"
})
```

## Usage

```
PeepsightEnable
PeepsightDisable
```

Alternatively you can start **Peepsight** with the `Lua` API:

```lua
local peepsight = require("peepsight")

peepsight.enable()
peepsight.disable()
peepsight.toggle()
```

## Grammers

- [TypeScript Grammer](https://github.com/tree-sitter/tree-sitter-typescript/blob/master/common/define-grammar.js)


## Related Projects

- [junegunn/limelight.vim](https://github.com/junegunn/limelight.vim)
- [folke/twilight.nvim](https://github.com/folke/twilight.nvim)

