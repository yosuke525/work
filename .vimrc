
"setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
"set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk


"ハイフンを単語に含める
set isk+=-
"スペルチェック時に日本語を除外する
set spelllang=en,cjk
" インサートモードから抜けるときにペーストモードを解除する
autocmd InsertLeave * set nopaste
"syntax markdown
au BufRead,BufNewFile *.md set filetype=markdown

"------- Look&Feel -----"
set ruler
set number
syntax on
filetype on
filetype plugin on
filetype indent on
set title
set showcmd
set cmdheight=2

set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<
set display=lastline
set pumheight=10


"------- Cursor -----"
"挿入モードでカーソル形状を変更する
let &t_SI.="\e[6 q"
let &t_EI.="\e[2 q"
"カーソル形状がすぐに元に戻らないのでタイムアウト時間を調整
set ttimeoutlen=10
"挿入モードを抜けた時にカーソルが見えなくなる現象対策(なぜかこれで治る)
inoremap <ESC> <ESC>
set mouse=a








" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
      

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"Dein設定
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif
" Required:
set runtimepath+=/Users/yosuke/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/yosuke/.vim/dein')
  call dein#begin('/Users/yosuke/.vim/dein')
  " Let dein manage dein
  " Required:
  call dein#add('/Users/yosuke/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('bling/vim-bufferline')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('scrooloose/nerdtree')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('davidhalter/jedi-vim')
  call dein#add('tomtom/tcomment_vim')


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

"airline設定
" パワーラインでかっこよく
let g:airline_powerline_fonts = 1
" カラーテーマ指定してかっこよく
let g:airline_theme = 'wombat'
" タブバーをかっこよく
let g:airline#extensions#tabline#enabled = 1

" 選択行列の表示をカスタム(デフォルトだと長くて横幅を圧迫するので最小限に)
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])

" virtulenvを認識しているか確認用に、現在activateされているvirtualenvを表示(vim-virtualenvの拡張)
let g:airline#extensions#virtualenv#enabled = 1

" gitのHEADから変更した行の+-を非表示(vim-gitgutterの拡張)
"let g:airline#extensions#hunks#enabled = 0

" Lintツールによるエラー、警告を表示(ALEの拡張)
"let g:airline#extensions#ale#enabled = 1
"let g:airline#extensions#ale#error_symbol = 'E:'
"let g:airline#extensions#ale#warning_symbol = 'W:'




"set laststatus=2
"set showtabline=2 " 常にタブラインを表示
set t_Co=256 " この設定がないと色が正しく表示されない
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline_theme='papercolor' "落ち着いた色調が好き
let g:airline_powerline_fonts = 1









map <C-n> :NERDTreeToggle<CR>


let g:python3_host_prog = expand('python3')


" Denite用プレフィックス
":Denite -mode=normal buffer
"nmap [denite] <Nop>
"map <C-j> [denite]
" プロジェクト内のファイル検索
"nmap <silent> [denite]<C-P> :<C-u>Denite file_rec -highlight-mode-insert=Search<CR>
" バッファに展開中のファイル検索
"nmap <silent> [denite]<C-B> :<C-u>Denite buffer -highlight-mode-insert=Search<CR>
" ファイル内の関数/クラス等の検索
"nmap <silent> [denite]<C-O> :<C-u>Denite outline -highlight-mode-insert=Search<CR>
" dotfiles配下をカレントにしてfile_rec起動
"nmap <silent> [denite]<C-V> :<C-u>call denite#start([{'name': 'file_rec', 'args': ['~/.dotfiles']}]) -highlight-mode-insert=Search=Search<CR>
" 上下移動を<C-N>, <C-P>
"call denite#custom#map('normal', '<C-N>', '<denite:move_to_next_line>')
"call denite#custom#map('normal', '<C-P>', '<denite:move_to_previous_line>')
"call denite#custom#map('insert', '<C-N>', '<denite:move_to_next_line>')
"call denite#custom#map('insert', '<C-P>', '<denite:move_to_previous_line>')
" 入力履歴移動を<C-J>, <C-K>
"call denite#custom#map('insert', '<C-J>', '<denite:assign_next_text>')
"call denite#custom#map('insert', '<C-K>', '<denite:assign_previous_text>')
" 横割りオープンを`<C-S>`
"call denite#custom#map('insert', '<C-S>', '<denite:do_action:split>')
" 縦割りオープンを`<C-I>`
"call denite#custom#map('insert', '<C-I>', '<denite:do_action:vsplit>')
" タブオープンを`<C-O>`
"call denite#custom#map('insert', '<C-O>', '<denite:do_action:tabopen>')
" file_rec検索時にfuzzymatchを有効にし、検索対象から指定のファイルを除外
"call denite#custom#source(
"    \ 'file_rec', 'matchers', ['matcher_fuzzy', 'matcher_project_files', 'matcher_ignore_globs'])
" 検索対象外のファイル指定
"call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
"    \ [ '.git/', '.ropeproject/', '__pycache__/',
"    \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])


" netrwは常にtree view
let g:netrw_liststyle = 3
" CVSと.で始まるファイルは表示しない
let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1

"クリップボード使うよ設定
set clipboard=unnamed,autoselect


"git変更行をハイライト
"let g:gitgutter_highlight_lines = 1

