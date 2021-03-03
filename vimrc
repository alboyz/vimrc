set number
set mouse=a
set encoding=utf-8
set shiftwidth=4
set bg=dark
imap jj <esc>
nmap io <C-c>
nmap <space> :
nmap nn :bn<CR>
nmap pp :bp<CR>
nmap ne :new<CR>
nmap <nv></nv> :vnew<CR>
nmap gg gg=G<CR>


"copy paste
vnoremap <C-c> "+y
map <C-p> "+p
vnoremap <C-c> "*y :let @+=@*<CR>


autocmd! bufwritepost .vimrc source %


set tabstop=2
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

	Plugin 'sheerun/vim-polyglot'
	Plugin 'mattn/emmet-vim'
	Plugin 'scrooloose/nerdtree'
"	Plugin 'Xuyuanp/nerdtree-git-plugin'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'simeji/winresizer'
  Plugin 'townk/vim-autoclose'		
	Plugin 'morhetz/gruvbox'
	Plugin 'jiangmiao/auto-pairs'
	Plugin 'vim-syntastic/syntastic'
  Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plugin 'junegunn/fzf.vim'

	"deoplete
	if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
  Plugin 'wokalski/autocomplete-flow'
  " Foinr func argument completion
  Plugin 'Shougo/neosnippet'
  Plugin 'Shougo/neosnippet-snippets'
endif
	

call vundle#end()            " required
filetype plugin indent on    " required

"--EMMET CONFIG--"
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_leader_key=','


"deoplete
 let g:deoplete#enable_at_startup = 1
	" neosnippet
		let g:neosnippet#enable_completed_snippet = 1
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"nerdtree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map eee :NERDTreeToggle<CR>


"airline-themes
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'


"winresizer
" If you want to start window resize mode by `Ctrl+T`
let g:winresizer_start_key = '<C-T>'

" If you cancel and quit window resize mode by `z` (keycode 122)
let g:winresizer_keycode_cancel = 122


"Buffer switch
nmap mm :ls<CR>


colorscheme gruvbox

						
"-- FOLDING --
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=88 "start file with all folds opened 


"--SYNTASTIC--
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"--SYNTASTIC_CHECK
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
