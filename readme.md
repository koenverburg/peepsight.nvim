# Nvim Plugin Template

> This repo contains the bare minimum boilerplate to setup a Neovim Plugin in lua

## Getting started

Clone the project
```bash
git clone https://github.com/koenverburg/template-nvim-plugin.git
```

Then cd into the directory and launch nvim using the following command

```bash
nvim --cmd "set rtp+=$(pwd)"
```

After this you can call the plugin with the following command

```bash
:lua require('greeting').setup({ enable = true })
```

This should return `Hello World!`
