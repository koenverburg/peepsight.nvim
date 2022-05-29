# Peepsight

Working on a lot of code can be overwelming sometimes, so just focus on one function at the time.
Peepsight is created to allow you to focus on a single function using treesitter.

[![asciicast](https://asciinema.org/a/7w0JoI88ZAEIlbTvwCZKM1voN.svg)](https://asciinema.org/a/7w0JoI88ZAEIlbTvwCZKM1voN)

## Installation

Make sure you are using Neovim (v0.7) or the latest neovim nightly.

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


## Related Projects

- [junegunn/limelight.vim](https://github.com/junegunn/limelight.vim)
- [folke/twilight.nvim](https://github.com/folke/twilight.nvim)

