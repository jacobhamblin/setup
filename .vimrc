if &term == "screen"
  set t_Co=256
endif
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'vim-syntastic/syntastic'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'nightsense/snow'
Plug 'albertorestifo/github.vim'
Plug 'millermedeiros/vim-esformatter'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'prettier/vim-prettier'
Plug 'garbas/vim-snipmate'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf.vim'
call plug#end()
set rtp+=~/.fzf
syntax enable
let g:netrw_banner=0 
set number
set nostartofline
filetype plugin indent on
set softtabstop=2 shiftwidth=2 expandtab
set nowrap
set textwidth=79
filetype plugin on
let g:NERDSpaceDelims = 1
map <C-n> :NERDTreeToggle<CR>
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
colorscheme spacemacs-theme
nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1
let delimitMate_expand_cr=1
set hlsearch
let g:prettier#autoformat = 0
let g:prettier#config#parser = 'babylon'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql Prettier
" let g:ctrlp_use_caching = 0
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <c-p> :GFiles<CR>
nmap <c-f> :Find 
let $FZF_DEFAULT_COMMAND='rg --files'
" Highlight ES6 template strings
hi link javaScriptTemplateDelim String
hi link javaScriptTemplateVar Text
hi link javaScriptTemplateString String
