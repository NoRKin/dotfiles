call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Prevent gulp/grunt watch to trigger twice
set nowritebackup

set runtimepath^=~/.vim/bundle/ctrlp.vim
set guioptions-=r  "scrollbar
set guioptions-=L
set relativenumber
set lazyredraw

:imap jk <Esc>
:imap <F6> <c-y>,
:map <End> :w <Enter>

" Easier
noremap H ^
noremap L $

filetype on
filetype plugin on
filetype indent on
set number
set smartindent
set shiftwidth=4
set softtabstop=4
set nu
set expandtab

" Fugitive
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>

"Vim airline
set laststatus=2

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|output|bower_components|dist|node-webkit.app|webkitbuilds)|(\.(swp|hg|git|svn))$'

"JsDoc
let g:jsdoc_access_descriptions=1
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_underscore_private=1
let g:jsdoc_allow_shorthand=1
let g:jsdoc_additional_descriptions=1

"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

autocmd FileType html let b:closetag_html_style=1
autocmd FileType html,xhtml,xml source ~/.vim/bundle/closetag/plugin/closetag.vim
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
autocmd FileType ruby setl sw=2 sts=2 et

let g:user_emmet_install_global = 0
autocmd FileType html,css,scss EmmetInstall
let g:html_indent_inctags = "html,body,head,tbody,ul,li"
colorscheme molokai

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" ---------------------------------------------------------------------------
"  Strip all trailing whitespace in file
" ---------------------------------------------------------------------------

function! StripWhitespace ()
    exec ':%s/ \+$//g'
endfunction

map <Leader>s :call StripWhitespace ()<CR>


" ---------------------------------------------------------------------------
"  Break Line
" ---------------------------------------------------------------------------
function! BreakHere()
    s/\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\r\3\5
    call histdel("/", -1)
endfunction

nnoremap K :call BreakHere()<CR>
