set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Matt-Deacalion/vim-systemd-syntax'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
execute pathogen#infect()

set expandtab               "Tab key inserts spaces
set tabstop=2               "Use two spaces for tabs
set shiftwidth=2            "Use two spaces for auto-indent
set autoindent              "Auto indent based on previous line
let php_htmlInStrings = 1   "Syntax highlight for HTML inside PHP strings
let php_parent_error_open = 1 "Display error for unmatch brackets


"Set filetype for Drupal PHP files.
if has("autocmd")
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php 
    autocmd BufRead,BufNewFile *.php set filetype=php 
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.theme set filetype=php
    autocmd BufRead,BufNewFile *.engine set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.cll set filetype=c

  augroup END
endif
syntax on


set statusline=%f\%<\ %y\ format:\ %{&ff};\ [%c,%l]
set laststatus=2

map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

"CTRL-S to check php syntax
map <C-S> :!php -l %<CR>

command! -nargs=* R :read! <args>
command! -nargs=* T :call ExecInNewBuffer(<f-args>)
fu! ExecInNewBuffer(...)
 let fullCmd = "new +r!"
 for s in a:000
  let fullCmd = fullCmd . s . "\\ "
 endfor
 set modifiable
 set modified
 exec(fullCmd)
 set nomodifiable
 set nomodified
endf


let mapleader = ","

" ,n to toggle nerd tree directory
map <Leader>n :NERDTreeToggle<CR>

" Ctrl+h and Ctrl+l to navigate through tabs
map <C-h> gT
map <C-l> gt

map <Leader>p :w !pastepipe -t "%"

set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

autocmd filetype mkd setlocal linebreak | 
autocmd filetype mkd nnoremap k gk
autocmd filetype mkd nnoremap j gj
autocmd filetype mkd vnoremap j gj
autocmd filetype mkd vnoremap k gk
autocmd filetype mkd nnoremap gj
autocmd filetype mkd nnoremap gk
autocmd filetype mkd vnoremap gj
autocmd filetype mkd vnoremap gk
autocmd filetype mkd inoremap gj
autocmd filetype mkd inoremap gk
autocmd filetype mkd setlocal spell spelllang=en_us

let NERDTreeQuitOnOpen = 1
"Haskell
autocmd filetype haskell setlocal shiftwidth=4
autocmd filetype haskell setlocal tabstop=4
autocmd filetype hamlet setlocal shiftwidth=4
autocmd filetype hamlet setlocal tabstop=4

"Yesod
"-open template named under cursor
:map <Leader>H :tabnew templates/<C-R><C-F>.hamlet<CR>
:map <Leader>J :tabnew templates/<C-R><C-F>.julius<CR>
:map <Leader>C :tabnew templates/<C-R><C-F>.cassius<CR>

:map <Leader>T :tabnew <C-R><C-F><CR>

"Swap word with word after comma
"test (firstWord, secondWord, thirdWord)
nmap ,mc dwEi, pbbbF,xx

let g:syntastic_javascript_checker = "jshint"
let g:jshint_highlight_color = "Red"
let g:syntastic_javascript_jshint_conf = "/home/g/.jshintrc"

au FileType html compiler html


:map <leader>d3 :diffget //3<cr>
:map <leader>d2 :diffget //2<cr>
:map <leader>WW :wqa<cr>

set cm=blowfish

let g:haddock_browser = "xdgg-open"
