" plugin manager: https://github.com/junegunn/vim-plug

" permanently turn on syntax highlighting
syntax on

" turn on line/col numbers in status bar
set ruler

" line numbers
set number

" incremental search
set incsearch

" highlight when done
set hlsearch

" auto indent
set ai

" in insert mode, press 'i' twice to go to command mode
imap ii <C-[>

" highlight characters that go over 80 cols
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
" use this to match even while typing
"match ExtraWhitespace /\s\+$/

" use this as a less intrusive option
2match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * redraw!

" map the space key to recenter the screen;
" do the same when 'n' or 'N' is pressed
nmap <space> zz
nmap n nzz
nmap N Nzz

" the following settings are changed by a script that looks for
" 'begin c', 'end c', etc.  It removes the '"' character in front of
" the 'set' commands when setting python or c settings


" begin c
" tabstop = 8, shiftwidth = 8, softtabstop = 8
" old: set smarttab, expandtab
"set tabstop=8
"set shiftwidth=8
"set softtabstop=8
" end c

" begin py
set tabstop=4
set shiftwidth=4
set softtabstop=4
" end py


" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" use spaces instead of tabs
set expandtab

" diff with saved: :w !diff % -

" turn off error bells
" setting noerrorbells leaves visualbells, and t_vb= sets
" the visual options to empty
set noerrorbells visualbell t_vb=

call plug#begin('~/.vim/plugged')

Plug 'elixir-lang/vim-elixir'
Plug 'altercation/vim-colors-solarized'

call plug#end()

set background=dark
try
    #colorscheme solarized
    colorscheme Monokai
catch
endtry
