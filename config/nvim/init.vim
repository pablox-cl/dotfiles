scriptencoding utf-8

packadd minpac
call minpac#init()
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-git')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')

" colorschemes
call minpac#add('nanotech/jellybeans.vim')
call minpac#add('jnurmine/Zenburn')
call minpac#add('morhetz/gruvbox')
call minpac#add('dracula/vim')
call minpac#add('tomasr/molokai')
call minpac#add('vim-scripts/twilight256.vim')
call minpac#add('rakr/vim-two-firewatch')
call minpac#add('romainl/Apprentice')
call minpac#add('vim-scripts/ScrollColors')

filetype plugin indent on

set colorcolumn=+1
set diffopt+=vertical
set hidden
set expandtab
set grepprg=git\ grep\ -n\ $*
set linebreak
set list
set listchars=tab:»·,extends:❯,precedes:❮,trail:␣,conceal:Δ
set mouse=
set nojoinspaces
set nowrap
set number
set numberwidth=3
set shiftwidth=2
set showbreak=\ ↪\ 
set smartindent
set textwidth=80
set splitbelow
set splitright

let g:mapleader = ' '
let g:maplocalleader = ' '

noremap <CR> :

map <C-p> :FZF<CR>
" clear search matching
" nnoremap <silent> <C-l>:let @/=""<CR>
nnoremap <silent> <Esc><Esc>:let @/=""<CR>

set termguicolors
set background=dark
" let g:jellybeans_overrides = {
" \       'ColorColumn': { '256ctermbg': '234' },
" \       'StatusLine': { '256ctermfg': '234' },
" \}
let g:two_firewatch_italics = 1
let g:jellybeans_use_term_italics = 1
" colorscheme jellybeans
" colorscheme apprentice
color two-firewatch

set cursorline

" Only show cursorline in the current window and in normal mode.
augroup cline
  au!
  au WinLeave * set nocursorline
  au WinEnter * set cursorline
  au InsertEnter * set nocursorline
  au InsertLeave * set cursorline
augroup END

set relativenumber

augroup relnumber
  " Turn off relative number when losing focus
  autocmd FocusLost   * setlocal number norelativenumber
  autocmd FocusGained * setlocal relativenumber
  autocmd WinLeave    * setlocal number norelativenumber
  autocmd WinEnter    * setlocal relativenumber

  " Turn on relative number only when in normal mode
  autocmd InsertEnter * setlocal number norelativenumber
  autocmd InsertLeave * setlocal relativenumber
augroup END


" MAPS

nnoremap <silent> <F2> :setlocal norelativenumber! relativenumber?<CR>
set pastetoggle=<F6>
map <F9> :setlocal invspell<CR>:set spell?<CR>

" smash escape
inoremap jk <Esc>
inoremap kj <Esc>

" sane regexes
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
nnoremap :s/ :s/\v

" suggests word when spelling it's on
" https://stackoverflow.com/a/16481737/417527
inoremap <C-l> <C-g>u<Esc>[s1z=`]a<C-g>u

" Easier indenting
nnoremap <C-S-Left> <<
nnoremap <C-S-Right> >>
xnoremap <C-S-Left> <gv
xnoremap <C-S-Right> >gv

" Reselect visual block after indent/outdent
xnoremap < <gv
xnoremap > >gv

" vim-unimpaired
" Bubble single lines
nmap <C-S-Up> [e
nmap <C-S-Down> ]e
" Bubble multiple lines
vmap <C-S-Up> [egv
vmap <C-S-Down> ]egv

" remap arrow keys (aka hard mode)
" TODO: Find useful mappings for these keys
" nnoremap <Left> <Nop>
" nnoremap <Right> <Nop>
" nnoremap <Up> <Nop>
" nnoremap <Down> <Nop>
" nnoremap <Left> :bprev<CR>
" nnoremap <Right> :bnext<CR>

" Quick horizontal/vertical splits
nnoremap <Leader><Bar> :vsp<CR>
nnoremap <Leader>- :sp<CR>

set completeopt=longest,menuone,preview
set wildmode=longest:full,full
set wildignorecase

