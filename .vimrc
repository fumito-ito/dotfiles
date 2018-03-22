" vi 互換ではなくVim のデフォルト設定にする
set nocompatible
 
" 一旦ファイルタイプ関連を無効化
filetype off
 
" plugins {{{
 
 
" 環境設定系 {{{
 
" シンタックスハイライト
syntax on
 
" エンコード
set encoding=utf8
 
" ファイルエンコード
set fileencoding=utf-8
 
" スクロールする時に下が見えるようにする
set scrolloff=5
 
" .swapファイルを作らない
set noswapfile
 
" バックアップファイルを作らない
set nowritebackup
 
" バックアップをしない
set nobackup
 
" バックスペースで各種消せるようにする
set backspace=indent,eol,start
 
" ビープ音を消す
set vb t_vb=
set novisualbell
 
" OSのクリップボードを使う
set clipboard+=unnamed
set clipboard=unnamed
 
" 不可視文字を表示
set list
 
" 行番号を表示
set number
 
" 右下に表示される行・列の番号を表示する
set ruler
 
" compatibleオプションをオフにする
set nocompatible
 
" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline
 
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
 
" 対応括弧をハイライト表示する
set showmatch
 
" 対応括弧の表示秒数を3秒にする
set matchtime=3
 
" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set wrap
 
" 入力されているテキストの最大幅を無効にする
set textwidth=0
 
" 不可視文字を表示
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
 
" インデントをshiftwidthの倍数に丸める
set shiftround
 
" 補完の際の大文字小文字の区別しない
set infercase
 
" 文字がない場所にもカーソルを移動できるようにする
set virtualedit=all
 
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
 
" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen
 
" 小文字の検索でも大文字も見つかるようにする
set ignorecase
 
" ただし大文字も含めた検索の場合はその通りに検索する
set smartcase
 
" インクリメンタルサーチを行う
set incsearch
 
" 検索結果をハイライト表示
:set hlsearch
 
" コマンド、検索パターンを10000個まで履歴に残す
set history=10000
 
" マウスモード有効
set mouse=a
 
" xtermとscreen対応
set ttymouse=xterm2
 
" コマンドを画面最下部に表示する
set showcmd
 
" スマートタブを有効にする
set smarttab
 
" 256色表示
set t_Co=256
 
" アンチエイリアスを効かせる
set antialias
 
" コマンド系 
 
" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %
 
" 入力モード中に素早くJJと入力した場合はESCとみなす
inoremap jj <Esc>
 
" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
 
" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
 
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
 
" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
 
" vを二回で行末まで選択
vnoremap v $h
 
" TABにて対応ペアにジャンプ
nnoremap &lt;Tab&gt; %
vnoremap &lt;Tab&gt; %
 
" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
 
" T + ? で各種設定をトグル
nnoremap [toggle] <Nop>
nmap T [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>
 
" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
 
 
" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif
 
" /{pattern}の入力中は「/」をタイプすると自動で「\/」が、
" ?{pattern}の入力中は「?」をタイプすると自動で「\?」が 入力されるようになる
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus
else
    set clipboard& clipboard+=unnamed,autoselect
endif
 
"表示行単位で行移動する
nnoremap <silent> j gj
nnoremap <silent> k gk
 
"画面切り替え
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
 
"<space>j, <space>kで画面送り
noremap [Prefix]j <c-f><cr><cr>
noremap [Prefix]k <c-b><cr><cr>
