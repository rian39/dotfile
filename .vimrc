execute pathogen#infect()
syntax enable
syntax on
set nocompatible
filetype plugin on
filetype indent on
se t_Co=16
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
call togglebg#map("<F5>")
set ruler  
set tabstop=4
set shiftwidth=4
set expandtab
set showcmd
set hlsearch
"cursor show
"set cursorline
"set cursorcolumn

set encoding=utf-8
"let mapleader=","
set foldmethod=marker
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\
\ [%l/%L\ (%p%%)

"python editing
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly
hi comment ctermfg=blue 

"set linenumbers
:nnoremap <C-N><C-N> :set invnumber<CR>
:map <Up> gk
:map <Down> gj

"pandoc plugin files
let g:pandoc#biblio#sources = "bcg"
let g:pandoc#biblio#bibs = ['/home/mackenza/Documents/ref_bibs/data_forms_thought.bib', '/home/mackenza/Documents/ref_bibs/machine_learning.bib', '/home/mackenza/Documents/ref_bibs/R.bib', '/home/mackenza/Documents/ref_bibs/google_analytics.bib']
let g:pandoc_use_bibtool = 1
set grepprg=grep\ -nH\ $*

"bibtex
let g:Tex_BIBINPUTS = ['/home/mackenza/Documents/ref_bibs/data_forms_thought.bib', '/home/mackenza/Documents/ref_bibs/machine_learning.bib', '/home/mackenza/Documents/ref_bibs/R.bib', '/home/mackenza/Documents/ref_bibs/google_analytics.bib']
"let g:Tex_BIBINPUTS = "/home/mackenza/Documents/ref_bibs/data_forms_thought.bib"
let g:Tex_BibtexFlavor = 'bibtex'
let g:Tex_Flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'

"markdown syntax
"au BufRead,BufNewFile *.md *.rmd  set filetype=mkd

" <leader>k Knits to MD
nnoremap <leader>k :! Rscript -e "library(knitr);knit(input='%', output='%:r.md');"<CR>


"vimroom
nnoremap <Leader>mz <Plug>VimroomToggle
nnoremap <Leader><C-V><C-V> <Plug>VimroomToggle<CR>
