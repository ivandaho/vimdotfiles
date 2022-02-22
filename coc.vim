call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

" coc.nvim start
nnoremap <silent> gh :call <SID>show_documentation()<CR>
map <silent>gr <Plug>(coc-references)
map <silent>gd <Plug>(coc-definition)
map <silent>gt <Plug>(coc-type-definition)
map <silent>gj <Plug>(coc-float-hide)<Plug>(coc-diagnostic-info)

" doesnt work??
map <silent>gl :echo CocAction('getCurrentFunctionSymbol')<CR>

" coc.nvim scroll float window
nnoremap <nowait><expr> <C-e> coc#float#has_scroll() ? coc#float#scroll(1, 2) : "\<C-e>"
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(0, 2) : "\<C-f>"
inoremap <nowait><expr> <C-e> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 2)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 2)\<cr>" : "\<Left>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" still doesn't work?
map \fg :call CocAction('quickfixes')<CR>
map \ff :call CocActionAsync('codeAction')<CR>
map gf <Plug>(coc-fix-current)

map g2 <Plug>(coc-rename)
map gw <Plug>(coc-rename)
map <silent>g<tab> <Plug>(coc-float-hide)
map <silent>g<esc> <Plug>(coc-float-hide)
nmap <expr> <esc> coc#float#has_float() ? "\<Plug>(coc-float-hide)" : '\<esc>'
map <silent>g1 <Plug>(coc-float-hide)

autocmd CursorHold *.tsx,*.ts,*.jsx,*.js,*.go silent call CocActionAsync('highlight')

hi default CocHighlightText  guibg=#111111 ctermbg=100

nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)
:map <silent> <C-l> :lopen<cr>
command! Prettier :CocCommand prettier.formatFile
map <silent> \q :Prettier<cr>
let g:coc_enable_locationlist = 0
autocmd User CocLocationsChange CocList --normal location
" coc.nvim end

