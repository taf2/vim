if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

set nocompatible        " Use Vim defaults (much better!)
set bs=2                " allow backspacing over everything in insert mode
"set ai                 " always set autoindenting on
"set backup             " keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=512         " keep 512 lines of command line history
set ruler               " show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
	autocmd BufRead *.txt set tw=78
	" When editing a file, always jump to the last cursor position
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal g'\"" |
	\ endif
endif
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
	"set hlsearch
endif

if &term=="xterm"
	set t_Co=8
	set t_Sb=^[4%dm
	set t_Sf=^[3%dm
endif

" set list                                                     " show trailing whitespace
" set listchars=tab:▸\ ,trail:▫
set encoding=utf-8
" set clipboard=unnamed                                        " yank and paste with the system clipboard

set nocp
set ignorecase
set smartcase
"set redraw
set report=1
"set showmatch
set warn
"set window=43
"set wrapmargin=10
"set wrapscan
set ai
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set nowrap
set nohlsearch
set is
"version 4.0             " avoid warning for wrong version

if has("terminfo")
  set t_Co=8
  set t_Sf=[3%p1%dm
  set t_Sb=[4%p1%dm
else    
  set t_Co=8
  set t_Sf=[3%dm   
  set t_Sb=[4%dm
endif

if version >=500
  map gqp gqap
endif

syntax on

highlight type ctermfg=4
highlight statement ctermfg=4
highlight comment ctermfg=3
highlight string ctermfg=6
highlight number ctermfg=NONE
highlight function ctermfg=4
highlight identifier ctermfg=NONE
highlight todo ctermfg=4 ctermbg=NONE
highlight operator ctermfg=7 ctermbg=NONE
highlight preproc ctermfg=4
highlight error ctermfg=1 ctermbg=NONE
highlight errormsg ctermfg=1 ctermbg=NONE
highlight constant ctermfg=7

"au BufNewFile,BufRead *.m so $HOME/.vim/matlab.vim
"au BufNewFile,BufRead *.m4 so $HOME/.vim/matlab.vim
"au BufNewFile,BufRead *.tex so $HOME/.vim/tex.vim
au BufNewFile,BufRead *.go so $HOME/.vim/go.vim
au BufRead,BufNewFile *.go set filetype=go
au BufNewFile,BufRead *.c so $HOME/.vim/c.vim
au BufNewFile,BufRead *.m so $HOME/.vim/objc.vim
au BufNewFile,BufRead *.cc so $HOME/.vim/cpp.vim
au BufNewFile,BufRead *.template so $HOME/.vim/cpp.vim
au BufNewFile,BufRead *.cpp so $HOME/.vim/cpp.vim
au BufNewFile,BufRead *.h so $HOME/.vim/cpp.vim
au BufNewFile,BufRead *.hh so $HOME/.vim/cpp.vim
au BufNewFile,BufRead *.js so $HOME/.vim/js.vim
au BufNewFile,BufRead *.gjs so $HOME/.vim/js.vim
au BufNewFile,BufRead *.as so $HOME/.vim/js.vim
au BufNewFile,BufRead *.htc so $HOME/.vim/js.vim
au BufNewFile,BufRead *.idl so $HOME/.vim/idl.vim
au BufNewFile,BufRead *.html so $HOME/.vim/html.vim
au BufNewFile,BufRead *.ejs set filetype=js.html
"au BufNewFile,BufRead *.rhtml so $HOME/.vim/eruby.vim
"au BufNewFile,BufRead *.erb so $HOME/.vim/eruby.vim
"au BufNewFile,BufRead *.html.erb so $HOME/.vim/eruby.vim
au BufNewFile,BufRead *.pt so $HOME/.vim/eruby.vim
au BufNewFile,BufRead *.zcml so $HOME/.vim/eruby.vim
au BufNewFile,BufRead *.rl so $HOME/.vim/ragel.vim
au BufNewFile,BufRead *.php so $HOME/.vim/syntax/php.vim
au BufNewFile,BufRead Makefile so $HOME/.vim/make.vim
au BufNewFile,BufRead *.moon so $HOME/.vim/moon.vim
" nginx
au BufNewFile,BufRead nginx.conf,nginx/conf.d/*.conf so $HOME/.vim/nginx.vim
"set viminfo='10,\"100,:20,%,nc:\\some\\place\\under\\Windoz\\_viminfo 
" the following restores the position in a previously edited file
set viminfo='10,\"100,:20,%,n~/.viminfo
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 
"au BufNewFile,BufRead *.asm so $HOME/.simple/simple.vim

" When starting to edit a file:
"   For *.c and *.h files set formatting of comments and set C-indenting on
"   For other files switch it off
"   Don't change the sequence, it's important that the line with * comes first.
autocmd BufRead * set formatoptions=tcql nocindent comments&
autocmd BufRead *.c,*.h,*.cc,*.cpp,*.template,*.m set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
autocmd BufRead *.rb,*.rake,Rakefile,Gemfile set filetype=ruby
autocmd BufRead *.js.erb,*.js set filetype=javascript
autocmd BufRead wscript set filetype=python

" Enable editing of gzipped files
"    read: set binary mode before reading the file
"          uncompress text in buffer after reading
"   write: compress file after writing
"  append: uncompress file, append, compress file
autocmd BufReadPre,FileReadPre      *.gz set bin
autocmd BufReadPost,FileReadPost    *.gz '[,']!gunzip
autocmd BufReadPost,FileReadPost    *.gz set nobin

autocmd BufWritePost,FileWritePost  *.gz !mv <afile> <afile>:r
autocmd BufWritePost,FileWritePost  *.gz !gzip <afile>:r

autocmd FileAppendPre               *.gz !gunzip <afile>
autocmd FileAppendPre               *.gz !mv <afile>:r <afile>
autocmd FileAppendPost              *.gz !mv <afile> <afile>:r
autocmd FileAppendPost              *.gz !gzip <afile>:r

"set shellcmdflag=--rcfile\ -c
"set shellcmdflag=-c
"set shellxquote=\"
"set shellquote=
"set shellslash          " Use the forward slash for expansion.
"set shellxquote="
"set shell=/bin/bash " Use the bash shell
" set shellpipe=2>&1| tee
" set shellredir=>%s 2>&1

"map <C-i> <C-l>
"map <C-n> :tabnew<cr>
"map <C-m> :tabclose<cr>
"map <C-l> :tabnext<cr>
"map <C-h> :tabprevious<cr>
"map <C-o> :tabonly<cr>
"make it so can open files in a new tab
map gF :sp<CR>gf

"set path+=/home/taf2/project/portal-unified
set suffixesadd=.rb
set includeexpr+=substitute(v:fname,'s$','','g')
"" or you can add substitution pattern s/ies$/y/g, s/ves$/f/g like this:
"" set includeexpr+=substitute(substitute(substitute(v:fname,'s$','','g'),'ie$','y','g'),'ve$','f','g')
iab xch <c-r>=strftime("%Y-%m-%d")<cr>

let loaded_matchparen = 1
" color desert
" set term ansi

" spell checking
map <F6> <Esc>:setlocal spell spelllang=en_gb<CR>
map <F7> <Esc>:setlocal nospell<CR>
" ]s and [s to navigate
" z= shows suggestions zg adds word to dictionary, zug performs an undo to the dictionary addition
hi SpellBad term=reverse ctermfg=white ctermbg=darkred guifg=#ffffff guibg=#7f0000 gui=underline
hi SpellCap guifg=#ffffff guibg=#7f007f
hi SpellRare guifg=#ffffff guibg=#00007f gui=underline
hi SpellLocal term=reverse ctermfg=black ctermbg=darkgreen guifg=#ffffff guibg=#7f0000 gui=underline


" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path 
" (thanks Douglas Potts)
if has("unix")
  map ,e :e <C-R>=expand("%:p:h") . '/'<CR>
else
  map ,e :e <C-R>=expand("%:p:h") . '\'<CR>
endif

if has("unix")
  cmap %/ <C-R>=expand("%:p:h") . '/'<CR>
else
  cmap %/ <C-R>=expand("%:p:h") . '\'<CR>
endif

" set statusline+=%{rvm#statusline()}
color desert
