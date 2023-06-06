require("toggleterm").setup{
    open_mapping=[[<c-\>]],
    start_in_insert = false,
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<c-[>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
