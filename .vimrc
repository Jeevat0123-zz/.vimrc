"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"Basic Config
syntax on 						      "Syntax Hilight 
set mouse=a 						    "Enable Mouse
set nu 							        "Enable Line Number
set ruler 						      "Enable Ruler
set cursorline 						  "Cursor Line set incsearch && Incremental Search
set noswapfile 	
set autoindent
set smartindent
set nowrap 						      "No Wrap"
set noshowmode 						  "Don't Show Mode
set ignorecase 						  "case insensitive
set smartcase 						  "use case if any caps used 
set incsearch 						  "show match as search proceeds
set hlsearch 						    "search highlighting
hi QuickFixLine term=reverse ctermbg=52
"-----------------------------------------
		"Plug Start
call plug#begin()
Plug 'itchyny/lightline.vim'  			                    "LightLine Bar
Plug 'morhetz/gruvbox'       				                    "Theme GruvBox
Plug 'chun-yang/auto-pairs'   			                    "Auto-Pairs
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } 	"NerdTree
"Plug 'frazrepo/vim-rainbow'				                    "RainBowBrackets
Plug 'neoclide/coc.nvim', {'branch': 'release'} 	      "Coc
Plug 'mattn/emmet-vim' 					                        "Emmit
Plug 'ap/vim-css-color' 				                       "Color Code
Plug 'mhinz/vim-startify' 			        	            "Start Screen
call plug#end()
		"Plug End
"----------------------------------------
	        "Light-Line 
"----------------------------------------
">>> Defalut
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
">>> Light-Line Bar-config
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
"----------------------------------------
          " GruvBox ( Colour Scheme )
"----------------------------------------
">>> GruvBox Config
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark    " Setting dark mode
"----------------------------------------
        " NeredTree ( File Tree )
"----------------------------------------
">>> NerdTree Config
map <F3> :NERDTreeMirror<CR>
">>> Open and close NERD Tree
map <F2> :NERDTreeToggle<CR> 
">>> Auto refresh NERDTree files
autocmd CursorHold,CursorHoldI * if (winnr("$") > 1) | call NERDTreeFocus() | call g:NERDTree.ForCurrentTab().getRoot().refresh() | call g:NERDTree.ForCurrentTab().render() | wincmd w | endif
">>> Nerdtree on right
let g:NERDTreeWinPos = "right"
">>> NeredTree Window Sixe
let g:NERDTreeWinSize=26
">>> Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
">>> NerdTree Arrow Symbol
let g:NERDTreeDirArrowExpandable = '▸' 			"Arrow Icon
let g:NERDTreeDirArrowCollapsible = '▾' 		"Arrow Icon 
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"----------------------------------------
        " Rainbo_Brackets ( Bracket hi )
"----------------------------------------
">>> Rainbo-Brackets Config
let g:rainbow_active = 1
"----------------------------------------
        "COC ( Conqure Of Completion )
"----------------------------------------
">>> Coc-Config
">>> use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
">>> use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
">>> use <c-space>for trigger completion
inoremap <silent><expr> <NUL> coc#refresh()
"----------------------------------------
      "Emmit ( HTML, CSS autoComplete )
"----------------------------------------
">>> Emmit-config
">>> Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" Config the EMMET from [Ctrl+y & ,]  to [,,]
let g:user_emmet_leader_key=','
filetype plugin on
set omnifunc=syntaxcomplete#Complete
"----------------------------------------
      "Maping and Config
"----------------------------------------
	"<leader> 		:Leader Key [ Space ]
	"<cr> 			:Enter
	"inoremap 		:On Insert Mode
	"nnoremap 		:On Normal Mode
	"<C-s> 			:Crtl+s
"----------------------------------------
">>> Leader Key [ Space ]
let mapleader="\<space>"       				
">>> jk is escape
inoremap jjj <esc>
nnoremap <leader>r <C-r>
nnoremap <leader>u :u<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>qq :q!
nnoremap <leader>q :q<cr>
nnoremap <leader>wq :wq<cr>
">>> Search
nnoremap <leader>ss / 
">>> Search by Word under the cursor
nnoremap <leader>sw *<cr>
">>> Find and Replace
nnoremap <leader>fr :%s///gic


