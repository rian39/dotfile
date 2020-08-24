set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    Plugin 'jalvesaq/Nvim-R'
    Plugin 'vim-pandoc/vim-rmarkdown'
    Plugin 'junegunn/seoul256.vim'
    Plugin 'vim-pandoc/vim-pandoc'
    Plugin 'vim-pandoc/vim-pandoc-syntax'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'reedes/vim-pencil'
    Plugin 'reedes/vim-colors-pencil'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'chrisbra/csv.vim'
    Plugin 'junegunn/goyo.vim'
    Bundle "kshenoy/vim-signature"
    Plugin 'tpope/vim-surround'
    Plugin 'scrooloose/nerdtree'
    Plugin 'morhetz/gruvbox'
    Plugin 'nanotech/jellybeans.vim'
    Plugin 'NLKNguyen/papercolor-theme'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'itchyny/lightline.vim'
    Plugin 'ctrlpvim/ctrlp.vim'
    Bundle "jamessan/vim-gnupg"
    Bundle "SirVer/ultisnips"
    Bundle "chaoren/vim-wordmotion"
    Bundle "jalvesaq/zotcite"
    "Plugin 'wellle/tmux-complete.vim'
    "Plugin 'christoomey/vim-tmux-navigator'
    "Plugin 'christianrondeau/vim-base64'
    "Plugin 'hkupty/iron.nvim'
    "Plugin 'ChesleyTan/wordCount.vim'
    Plugin 'tpope/vim-fugitive'
    "Plugin 'tpope/vim-markdown'
    "Plugin 'Shougo/neosnippet'
    "Plugin 'Shougo/neosnippet-snippets'
    "Plugin 'tpope/vim-sensible'
    "Plugin 'severin-lemaignan/vim-minimap'
    "Plugin 'jceb/vim-orgmode'
    "Bundle "garbas/vim-snipmate"
    "Bundle "MarcWeber/vim-addon-mw-utils"
    "Plugin 'reedes/vim-wordy'
    "Plugin 'reedes/vim-colors-pencil'
    "Plugin 'vim-scripts/Screen-vim---gnu-screentmux'
    "Bundle "tomtom/tlib_vim"
    "Bundle "klen/python-mode"
    "Bundle "ivanov/vim-ipython"
    "Bundle "lervag/vimtex"
    "Bundle "farseer90718/vim-reveal"
    "Bundle "csexton/jekyll.vim"
    "Bundle "vim-scripts/TwitVim"
    "Bundle "Shougo/neocomplete.vim"
    "Plugin 'vim-scripts/Mark--Karkat'
    "Bundle 'ron89/thesaurus_query.vim'
    "Plugin 'leafgarland/typescript-vim'
    "Plugin 'supercollider/scvim'
    "Plugin 'munshkr/vim-tidal'
    "Plugin 'sudar/vim-arduino-syntax'
    "Plugin 'thorstenb/odpdown'
    "Plugin 'sudar/vim-arduino-snippets'
call vundle#end()            " required
filetype plugin indent on    " required
syntax enable
syntax on
let g:solarized_termcolors=256
if !has('gui_running')
      set t_Co=256
endif
set termguicolors
set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set showcmd
set hlsearch
set incsearch

set encoding=utf-8
set foldmethod=marker
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set autoread
au CursorHold * checktime  

"map leader

let mapleader = "\<Space>"
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P


"save keys
noremap <silent> <C-S>          :wa<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

"insert mode commands
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O

"split pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"python editing
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly
hi comment ctermfg=blue 

"set linenumbers
nnoremap <C-M><C-N> :set invnumber<CR>
map <Up> gk
map <Down> gj

nnoremap <F5> :buffers<CR>:buffer<Space>
"next buffer
nnoremap <F6> :bn<CR>
nnoremap <F4> :bp<CR>

"pandoc plugin files

let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#biblio#sources = "cg"
let g:pandoc#biblio#bibs =  ['/home/mackenza/ref_bibs/mackenzie.bib', 'ensemble.bib', 'mulligans.bib', 'home/mackenza/ref_bibs/epidemiology.bib']
let g:pandoc_use_bibtool = 1
set grepprg=grep\ -nH\ $*

let g:pandoc#folding#fdc = 3
let g:pandoc#formatting#mode = 's'
let g:pandoc#folding#level = 2
"let g:pandoc#completion#bib#mode='pandoc-citeproc'
let g:pandoc#completion#bib#mode='fallback'
let g:pandoc#folding#fold_fenced_codeblocks=1

"bibtex
let g:Tex_BIBINPUTS =  ['/home/mackenza/ref_bibs/uni.bib']
let g:Tex_BibtexFlavor = 'bibtex'
"set omnifunc=pandoc#completion#Complete
let g:Tex_Flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'

" <leader>k Knits to MD
nnoremap <leader>k :! Rscript -e "library(knitr);knit(input='%', output='%:r.md');"<CR>

"autocmd BufNewFile,BufReadPost *.md set filetype=markdown
au BufRead,BufNewFile {*.md,*.mkd,*.markdown} set ft=pandoc
au BufRead,BufNewFile {*.rmd,*.md} set ft=rmarkdown

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
    autocmd FileType markdown,mkd,md,rmd call pencil#init()
    autocmd FileType text         call pencil#init()
augroup END

function! WordCount()
    "let s:old_status = v:statusmsg
    "let position = getpos(".")
    "exe ":silent normal g\<c-g>"
    "let stat = v:statusmsg
    "let s:word_count = 0
    "if stat != '--No lines in buffer--'
        "let s:word_count = str2nr(split(v:statusmsg)[11])
        "let v:statusmsg = s:old_status
    "end
    "call setpos('.', position)
    let w = wordcount().words
    let s:word_count = w
    return s:word_count 
endfunction


" Lines added by the Vim-R-plugin command :RpluginConfig (2014-Aug-27 20:54):
filetype plugin on
" Change the <LocalLeader> key:
let maplocalleader = ","
" Use Ctrl+Space to do omnicompletion:
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif
"
" Press the space bar to send lines (in Normal mode) and selections to R:
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine


"lightline config
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive', 'readonly', 'filename', 'modified', 'count' ] ]
            \ },
            \ 'component_function': {
            \   'fugitive': 'MyFugitive',
            \   'readonly': 'MyReadonly',
            \   'modified': 'MyModified',
            \   'count':'WordCount'
            \ },
            \ 'separator': { 'left':  '▶', 'right':  '▶'},
            \ 'subseparator': { 'left':  '»', 'right': '»' }
            \ }

function! MyModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! MyReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "⭤"
    else
        return ""
    endif
endfunction

function! MyFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

set laststatus=2

"vimtex stuff
let g:tex_flavor = 'latex'
let g:vimtex_complete_enabled = 1
let g:vimtex_complete_recursive_bib = 1

"word frequency count
function! WordFrequency() range
    let all = split(join(getline(a:firstline, a:lastline)), '\A\+')
    let frequencies = {}
    for word in all
        let frequencies[word] = get(frequencies, word, 0) + 1
    endfor
    new
    setlocal buftype=nofile bufhidden=hide noswapfile tabstop=20
    for [key,value] in items(frequencies)
        call append('$', key."\t".value)
    endfor
    sort i
endfunction
command! -range=% WordFrequency <line1>,<line2>call WordFrequency()

nnoremap : ;
nnoremap ; :
nnoremap <F7> :r !date<CR>
nnoremap <F8> :r !git rev-parse --abbrev-ref HEAD <CR>
nnoremap <leader><leader> :xa<cr>

nnoremap <leader>nf :set fdc=0<cr>
nnoremap <leader>yf :set fdc=3<cr>
nnoremap <leader>h2<CR> o<ESC>:pu=strftime('%c')<CR> 0i## <ESC>o- <ESC>
nnoremap <leader><leader>t i# <ESC>:r !git rev-parse --abbrev-ref HEAD<CR>
nnoremap <leader>m<CR> :RMarkdown! pdf<CR>

let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion = 0

nnoremap <Leader>tq :ThesaurusQueryReplaceCurrentWord<CR>

au CursorHoldI * stopinsert

nnoremap gO :!eog <cfile> &<CR>
nnoremap gP :!evince <cfile> &<CR>
nnoremap gW :!lowriter <cfile> &<CR>
nnoremap gC :!localc <cfile> &<CR>

nnoremap <C-\> :NERDTreeToggle<cr>
nnoremap <F2> :NERDTreeToggle<cr>

colorscheme gruvbox
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_contrast_dark='hard'

augroup ironmapping
    autocmd!
    autocmd Filetype ipython nmap <buffer> <localleader>t <Plug>(iron-send-motion)
    autocmd Filetype ipython vmap <buffer> <localleader>t <Plug>(iron-send-motion)
    autocmd Filetype ipython nmap <buffer> <localleader>p <Plug>(iron-repeat-cmd)
augroup END


augroup my_colours
	autocmd!
	autocmd ColorScheme industry hi SpellBad cterm=reverse
augroup END

set fdc=0
nnoremap ,* *<C-O>:%s///gn<CR>

tnoremap <Esc> <C-\><C-n>
