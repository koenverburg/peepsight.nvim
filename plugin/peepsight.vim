if !has('nvim-0.7')
  echohl WarningMsg
  echom "Peepsight needs Neovim >= 0.7"
  echohl None
  finish
endif

command! Peepsight lua require("peepsight").toggle()
command! PeepsightEnable lua require("peepsight").enable()
command! PeepsightDisable lua require("peepsight").disable()
