-- for floating window border
vim.o.winborder = "rounded"

-- vim-gitgutter has to be configured before plugin loaded
vim.g.gitgutter_sign_added = '█'
vim.g.gitgutter_sign_modified = '█⫶'
vim.g.gitgutter_sign_removed = '█▁'
vim.g.gitgutter_sign_removed_first_line = '█▔'
vim.g.gitgutter_sign_modified_removed = "█▟"

require("config.lazy")


-- close buffer
vim.cmd([[nnoremap tq :bd<cr>]])
-- close buffer and flush
vim.cmd([[map <silent> TQ :bp<cr>:bd #<cr>]])
-- delete trailing whitespaces
vim.cmd([[map <leader>dtw :%s/\s\+$//<cr>]])

vim.cmd([[set showcmd]])

-- console logs
vim.cmd([[map <Plug>ConSoleLog yss)Iconsole.log<esc> :call repeat#set("\<Plug>ConSoleLog", v:count)<cr>]])
vim.cmd([[map <leader>csl <Plug>ConSoleLog]])

vim.cmd([[map <Plug>ConSolelogCopy _v$hyPa: , <esc>hhv_S'yss)Iconsole.log<esc> :call repeat#set("\<Plug>ConSolelogCopy", v:count)<cr>]])
vim.cmd([[map <leader>csc <Plug>ConSolelogCopy]])

vim.cmd([[map <Plug>ConsoleLogString yss'yss)Iconsole.log<esc> :call repeat#set("\<Plug>ConsoleLogString", v:count)<cr>]])
vim.cmd([[map <leader>css <Plug>ConsoleLogString]])

-- cd to the current's file's directory
vim.cmd([[map <leader>wd :lcd %:p:h<cr>]])

-- copy file name
vim.cmd([[map <leader>cfn :let @0=expand('%:t')<cr>]])
vim.cmd([[map <leader>ccfn :let @+=expand('%:t')<cr>]])
-- copy file path
vim.cmd([[map <leader>cfp :let @0=@%<cr>]])
vim.cmd([[map <leader>ccfp :let @+=@%<cr>]])

-- useful for React component props
vim.cmd([[map <Plug>CloneProps $vbyPa=<esc>lveS}athis.props.<esc> :call repeat#set("\<Plug>CloneProps", v:count)<cr>]])
vim.cmd([[map <Plug>CloneState $vbyPa=<esc>lveS}athis.state.<esc> :call repeat#set("\<Plug>CloneState", v:count)<cr>]])
vim.cmd([[map <Plug>CloneExact $vbyPa=<esc>lveS} :call repeat#set("\<Plug>CloneExact", v:count)<cr>]])
vim.cmd([[map <Plug>CloneThis $vbyPa=<esc>lveS}athis.<esc> :call repeat#set("\<Plug>CloneThis", v:count)<cr>]])
vim.cmd([[map <leader>cp <Plug>CloneProps]])
vim.cmd([[map <leader>cst <Plug>CloneState]])
vim.cmd([[map <leader>ce <Plug>CloneExact]])
vim.cmd([[map <leader>ct <Plug>CloneThis]])


-- Change Equal (=) Delete
vim.cmd([[map <silent> <Plug>ChangeEqualDelete V<Plug>VChangeEqualDelete :call repeat#set("\<Plug>ChangeEqualDelete", v:count)<cr>]])
vim.cmd([[map <silent> <leader>cwd <Plug>ChangeEqualDelete]])

-- Change Equal (=) Delete (visual)
vim.cmd([[vmap <silent> <Plug>VChangeEqualDelete <esc>:set nohlsearch<cr>gv:s/=.*//<cr>:let @/=''<cr>:set hlsearch<cr> :call repeat#set("\<Plug>VChangeEqualDelete", v:count)<cr>]])
vim.cmd([[vmap <silent> <leader>cwd <Plug>VChangeEqualDelete]])

-- Change CoLon to Equal (=)
vim.cmd([[map <silent> <Plug>ChangeColonToEqual V<Plug>VChangeColonToEqual :call repeat#set("\<Plug>ChangeColonToEqual", v:count)<cr>]])
vim.cmd([[map <silent> <leader>cle <Plug>ChangeColonToEqual]])

-- Change CoLon to Equal (=) (visual)
vim.cmd([[vmap <silent> <Plug>VChangeColonToEqual <esc>:set nohlsearch<cr>gv:s/?\?:.*/=/<cr>:let @/=''<cr>:set hlsearch<cr> :call repeat#set("\<Plug>VChangeColonToEqual", v:count)<cr>]])
vim.cmd([[vmap <silent> <leader>cle <Plug>VChangeColonToEqual]])

-- Change CoLon to Equal (=) with braces
vim.cmd([[map <silent> <Plug>ChangeColonToEqualWithBraces V<Plug>VChangeColonToEqualWithBraces :call repeat#set("\<Plug>ChangeColonToEqualWithBraces", v:count)<cr>]])
vim.cmd([[map <silent> <leader>clb <Plug>ChangeColonToEqualWithBraces]])

-- Change CoLon to Equal (=) with braces (visual)
vim.cmd([[vmap <silent> <Plug>VChangeColonToEqualWithBraces <esc>:set nohlsearch<cr>gv:s/\(\w*\)\(?\?:.*\)/\1={\1}<cr>:let @/=''<cr>:set hlsearch<cr> :call repeat#set("\<Plug>VChangeColonToEqualWithBraces", v:count)<cr>]])
vim.cmd([[vmap <silent> <leader>clb <Plug>VChangeColonToEqualWithBraces]])

-- Change CoLon to Comma
vim.cmd([[map <silent> <Plug>ChangeColonToComma V<Plug>VChangeColonToComma :call repeat#set("\<Plug>ChangeColonToComma", v:count)<cr>]])
vim.cmd([[map <silent> <leader>clc <Plug>ChangeColonToComma]])

-- Change CoLon to Comma (visual)
vim.cmd([[vmap <silent> <Plug>VChangeColonToComma <esc>:set nohlsearch<cr>gv:s/?\?:.*/,/<cr>:let @/=''<cr>:set hlsearch<cr> :call repeat#set("\<Plug>VChangeColonToComma", v:count)<cr>]])
vim.cmd([[vmap <silent> <leader>clc <Plug>VChangeColonToComma]])

-- Delete after CoLon
vim.cmd([[map <silent> <Plug>ColonDelete V<Plug>VColonDelete :call repeat#set("\<Plug>ColonDelete", v:count)<cr>]])
vim.cmd([[map <silent> <leader>cld <Plug>ColonDelete]])

-- Delete after CoLon (visual)
vim.cmd([[vmap <silent> <Plug>VColonDelete <esc>:set nohlsearch<cr>gv:s/?\?:.*//<cr>:let @/=''<cr>:set hlsearch<cr> :call repeat#set("\<Plug>VColonDelete", v:count)<cr>]])
vim.cmd([[vmap <silent> <leader>cld <Plug>VColonDelete]])

-- Delete after CoLon retain colon
vim.cmd([[map <silent> <Plug>ColonDeleteRetain V<Plug>VColonDeleteRetain :call repeat#set("\<Plug>ColonDeleteRetain", v:count)<cr>]])
vim.cmd([[map <silent> <leader>clsd <Plug>ColonDeleteRetain]])

-- Delete after CoLon retain colon (visual)
vim.cmd([[vmap <silent> <Plug>VColonDeleteRetain <esc>:set nohlsearch<cr>gv:s/?\?:.*/:/<cr>:let @/=''<cr>:set hlsearch<cr> :call repeat#set("\<Plug>VColonDeleteRetain", v:count)<cr>]])
vim.cmd([[vmap <silent> <leader>clsd <Plug>VColonDeleteRetain]])

-- Change Tab to Colon. Useful when copying model from swagger
vim.cmd([[map <silent> <Plug>ChangeTabToColon V<Plug>VChangeTabToColon :call repeat#set("\<Plug>ChangeTabToColon", v:count)<cr>]])
vim.cmd([[map <silent> <leader>ctc <Plug>ChangeTabToColon]])

-- Change Tab to Colon. (visual) Useful when copying model from swagger
vim.cmd([[vmap <silent> <Plug>VChangeTabToColon <esc>:set nohlsearch<cr>gv:s/	/:/<cr>:let @/=''<cr>:set hlsearch<cr> :call repeat#set("\<Plug>VChangeTabToColon", v:count)<cr>]])
vim.cmd([[vmap <silent> <leader>ctc <Plug>VChangeTabToColon]])

-- remove search highlight
vim.cmd([[map <silent>/<esc> :nohl<cr>]])
vim.cmd([[map <silent>/<tab> :nohl<cr>]])

-- TODO: better macro, for true/false toggling
vim.cmd([[nmap <silent><leader>ft :s/\(true\)\\|\(false\)/true<cr>:nohl<cr>]])
vim.cmd([[nmap <silent><leader>ff :s/\(true\)\\|\(false\)/false<cr>:nohl<cr>]])

-- rename current file with _ prefix
vim.cmd([[map <leader>ref <leader>cfn :Rename _0<cr>]])

-- fle explorer
vim.cmd([[:map <leader>fe :Explore<cr>]])
vim.cmd([[let g:netrw_liststyle=3]])

-- disable esc sound
vim.cmd([[set noeb vb t_vb=]])
vim.cmd([[au GUIEnter * set vb t_vb=]])

vim.cmd([[set incsearch]])
vim.cmd([[set scrolloff=1]])

vim.cmd([[set laststatus=2]])
vim.cmd([[set encoding=utf-8]])
vim.cmd([[set hlsearch]])

vim.cmd([[set noshowmode]])
vim.cmd([[set background=dark]])
vim.cmd([[set noswapfile]])
vim.cmd([[set sw=2]])
vim.cmd([[set ts=2]])
vim.cmd([[set et]])
vim.cmd([[set number]])
vim.cmd([[set relativenumber]])

-- TODO: check if these are still needed
-- autocmd FileType html setlocal shiftwidth=2 tabstop=2
-- autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
-- autocmd FileType stylus setlocal shiftwidth=2 expandtab
-- autocmd FileType typescriptreact setlocal shiftwidth=2 noexpandtab
-- autocmd FileType typescript setlocal shiftwidth=2 noexpandtab

-- backspace fix
-- :set backspace=start,indent,eol



