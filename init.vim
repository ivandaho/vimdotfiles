
call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'airblade/vim-gitgutter'
Plug 'bkad/CamelCaseMotion'
Plug 'groenewege/vim-less'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'tomtom/tcomment_vim'
Plug 'chrisbra/csv.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'darrikonn/vim-gofmt'
Plug 'iloginow/vim-stylus'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim', { 'branch': 'main' }
Plug 'MunifTanjim/prettier.nvim', { 'branch': 'main' }
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" telescope start
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' , 'branch': 'main'}
" telescope end

call plug#end()

source ~/.config/nvim/vimrc

" use telescope
source ~/.config/nvim/tele.vim

" use new lsp server based config
lua require('config')

function! GrepQuickFix(pat)
  let all = getqflist()
  for d in all
    if bufname(d['bufnr']) !~ a:pat && d['text'] !~ a:pat
        call remove(all, index(all,d))
    endif
  endfor
  call setqflist(all)
endfunction
command! -nargs=* GrepQF call GrepQuickFix(<q-args>)
