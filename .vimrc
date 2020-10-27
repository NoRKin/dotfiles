call plug#begin('~/.vim/plugged')

Plug 'crusoexia/vim-monokai'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'gcmt/wildfire.vim'

call plug#end()

command! -nargs=0 Prettier :CocCommand prettier.formatFile

filetype plugin on

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
set shortmess+=c


" Format with Prettier
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
map <Leader>p :Prettier<CR>

syntax on
colorscheme monokai
set termguicolors

set guioptions-=r  "scrollbar
set guioptions-=L
set relativenumber

" Easier
noremap H ^
noremap L $

set shiftwidth=2
set softtabstop=2

" Lightline
set laststatus=2

nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

" Surround helpers
vmap <leader>" S"lvi"
vmap <leader>' S'lvi'
vmap <leader>` S`lvi`
vmap <leader>( S)lvi(
vmap <leader>{ S}lvi{
vmap <leader>[ S]lvi[
vmap <leader>< S>lvi<

 " Buffers
 nnoremap <leader>gn :bn<cr>
 nnoremap <leader>gp :bp<cr>
 nnoremap <leader>gb :b#<cr>
 nnoremap <leader>gdd :bd<cr>

" ---------------------------------------------------------------------------
"  Strip all trailing whitespace in file
" ---------------------------------------------------------------------------

function! StripWhitespace ()
    exec ':%s/ \+$//g'
endfunction

map <Leader>s :call StripWhitespace ()<CR>


" ---------------------------------------------------------------------------
" Use tab for trigger completion with characters ahead and navigate.
" ---------------------------------------------------------------------------
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" FZF
nnoremap <c-p> :GFiles<cr>


nnoremap <leader>t :rightbelow terminal npm test<cr>


nnoremap <leader>k :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
