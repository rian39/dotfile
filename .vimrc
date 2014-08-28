set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    Plugin 'vim-pandoc/vim-pandoc'
    Plugin 'vim-pandoc/vim-pandoc-syntax'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'reedes/vim-pencil'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'tpope/vim-fugitive'
    Plugin 'scrooloose/nerdtree'
    Plugin 'altercation/vim-colors-solarized'
    
call vundle#end()            " required
filetype plugin indent on    " required
execute pathogen#infect()
syntax enable
syntax on
se t_Co=16
let g:solarized_termcolors=256
"set background=dark
colorscheme molokai
"call togglebg#map("<F5>")
set ruler  
set tabstop=4
set shiftwidth=4
set expandtab
set showcmd
set hlsearch
set incsearch

"cursor show
"set cursorline
"set cursorcolumn

set encoding=utf-8
set foldmethod=marker
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set statusline=WC:%{WordCount()}\ [FILE:%F%m%r%h%w]\ [TYPE=%Y\ %{&ff}]\ \ [%l/%L\ (%p%%)][GIT:%{fugitive#statusline()}]
"set statusline=wc:%{WordCount()}

"save keys
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

"python editing
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly
hi comment ctermfg=blue 

"set linenumbers
:nnoremap <C-M><C-N> :set invnumber<CR>
:map <Up> gk
:map <Down> gj

"pandoc plugin files

"let g:pandoc#filetypes#handled = ['
let g:pandoc#biblio#sources = "bcg"
let g:pandoc#biblio#bibs = ['/home/mackenza/Documents/ref_bibs/at_this_moment.bib', '/home/mackenza/Documents/ref_bibs/data_forms_thought.bib', '/home/mackenza/Documents/ref_bibs/machine_learning.bib', '/home/mackenza/Documents/ref_bibs/ngs.bib', '/home/mackenza/Documents/ref_bibs/R.bib', '/home/mackenza/Documents/ref_bibs/google_analytics.bib']
let g:pandoc_use_bibtool = 1
set grepprg=grep\ -nH\ $*

"bibtex
let g:Tex_BIBINPUTS = [ '/home/mackenza/Documents/ref_bibs/ngs.bib', '/home/mackenza/Documents/ref_bibs/at_this_moment.bib','/home/mackenza/Documents/ref_bibs/data_forms_thought.bib', '/home/mackenza/Documents/ref_bibs/machine_learning.bib', '/home/mackenza/Documents/ref_bibs/R.bib', '/home/mackenza/Documents/ref_bibs/google_analytics.bib']
let g:Tex_BibtexFlavor = 'bibtex'
"let g:Tex_Flavor='latex'
"let g:Tex_DefaultTargetFormat='pdf'

let g:pandoc#folding#fold_fenced_codeblocks=1


" <leader>k Knits to MD
nnoremap <leader>k :! Rscript -e "library(knitr);knit(input='%', output='%:r.md');"<CR>

"Rmd and Rpres are pandoc
"autocmd BufRead,BufNewFile *.rmd,*.Rpres setfiletype pandoc

"autocmd BufNewFile,BufReadPost *.md set filetype=markdown
au BufRead,BufNewFile {*.md,*.mkd,*.markdown,*.rmd} set ft=pandoc
"
"
"
" New signs for the pandoc bundle
let g:pandoc_syntax_user_cchars = {'atx': '¶', 'codelang': '>', 'footnote': '§', 'definition': '»', 'newline': '¬'}


" Format paragraphs with <leader>q
map <leader>q {!}fmt -w 105<CR>}<CR>

" Place markers with {type} for markdown files
augroup markers
   autocmd! BufEnter *.md,*.mkd,*.txt,*.rmd,*.Rpres match Error '{{\w\+}}'
augroup END
nnoremap <leader>{{ :vimgrep /{\w\+}}/ %<CR>:copen<CR>

let g:pencil#wrapModeDefault = 'soft'

augroup pencil
      autocmd!
    autocmd FileType markdown,mkd call pencil#init()
    autocmd FileType textile call pencil#init()
    autocmd FileType text call pencil#init({'wrap': 'hard'})
augroup END

function! WordCount()
      let s:old_status = v:statusmsg
        let position = getpos(".")
        exe ":silent normal g\<c-g>"
            let stat = v:statusmsg
              let s:word_count = 0
                if stat != '--No lines in buffer--'
                        let s:word_count = str2nr(split(v:statusmsg)[11])
                            let v:statusmsg = s:old_status
                              end
                                call setpos('.', position)
                                  return s:word_count 
endfunction


" Lines added by the Vim-R-plugin command :RpluginConfig (2014-Aug-27 20:54):
filetype plugin on
let vimrplugin_assign = 0
" Change the <LocalLeader> key:
let maplocalleader = ","
" Use Ctrl+Space to do omnicompletion:
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif
" Press the space bar to send lines (in Normal mode) and selections to R:
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" Lines added by the Vim-R-plugin command :RpluginConfig (2014-Aug-28 11:53):
