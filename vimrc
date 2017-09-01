set nocompatible              " be iMproved, required
"set rop=type:directx
let g:AutoPairsMapCR = 1
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
so ~/vimfiles/plugins.vim

set nocompatible

cd ~                           "�������� ������ � �������� ����������
set autochdir
nnoremap d<space> :exec (search('^\s*\S\+', 'b') + 1) . "," . (search('^\s*\S\+') - 1) . 'd'<cr>

let mapleader=','
"let mapleader="\<Space>"
 
set shiftwidth=3
set breakindent
set synmaxcol=300                     " The max number of columns to try and highlight
"set ttyfast                           " Optimize for fast terminal connections
"set lazyredraw                        " Don't redraw vim in all situations
set scrolloff=5 
set autoindent
set backspace=indent,eol,start

set nobackup
set noswapfile

"set paste               " Paste from a windows or from vim
"set clipboard+=unnamed  " use the clipboards of vim and win
"set go+=a               " Visual selection automatically copied to the clipboard
"nnoremap <p> :<c-u> set paste<cr><p>:<c-u> set nopaste<cr>

"��������� ������ ��� ������������ ������
nnoremap <expr> gp  '`[' . getregtype()[0] . '`]' 
vnoremap <c-c> "*y
nnoremap <c-v> "*P


filetype plugin indent on
set tabstop=4                                              " show existing tab with 4 spaces width
set shiftwidth=4                                           " when indenting with '>', use 4 spaces width
set expandtab                                              " On pressing tab, insert 4 spaces

set nonumber
set tags=tags;/

set formatoptions-=r                                           " disabel insert comment while hinting ENTER
set formatoptions-=o                                           " disabel insert comment while hinting o or O

if has('win32')
    set encoding=cp1251
    "set encoding=utf-8

else
    set encoding=utf-8
    set termencoding=utf-8

endif

set ffs=unix,dos,mac " ������ ����� �� ��������� (������ �� ��������� �����) - ����� ������������ � ��������� �������
set fencs=utf-8,cp1251,koi8-r,cp866 " �������� ��������� ����� �� ��������� (��� ����� �� ��������� ����������� � ���� ���������)

"������� � ��������� ����
"
function! TextObjectFunction()
    normal! ]}%
    execute "normal ?function\<CR>"
    normal! vf{%
endfunction
vnoremap af :<C-U>silent! :call TextObjectFunction()<CR>
omap af :normal vaf<CR>

"----- search -----

set hlsearch
set incsearch

"----- split manager -----

set splitbelow
set splitright

nmap <c-j> <c-w><c-j>
nmap <c-k> <c-w><c-k>
nmap <c-h> <c-w><c-h>
nmap <c-l> <c-w><c-l>


"----- ui -----

colorscheme gruvbox
"colorscheme molokai

set lines=999 columns=999

syntax enable
set laststatus=2 "������ ���������� ������ ������� ����� ����

let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme=g:colors_name

set guioptions-=e "������ ����

set guioptions-=T "������ ������
set guioptions-=m "������ ����
set guioptions-=l "����� ������������ ������
set guioptions-=L "����� ������������ ������
set guioptions-=r "������ ������������ ������
set guioptions-=R "������ ������������ ������
"set guifont=Ubuntu_Mono_derivative_Powerlin:h12:cRUSSIAN
set guifont=Consolas:h11:cRUSSIAN

"��� ��� ������� ����� ��� ��� ������
hi LineNr guibg=bg 
"�������� ������ �����
set foldcolumn=2 
hi foldcolumn guibg=bg
"������� ��������� ������������ �������
hi vertsplit guibg=bg guifg=bg

"----- localization -----


"----- localization -----

set keymap=russian-jcukenwin "������� �������������� ��������� ��� ������ �����
set iminsert=0 "����� iminsert � imsearch ���������, ����� ����� ������ ��� ������� 
set imsearch=0 "� ���� �������� ������ �������� � ��������. �� ����, Ctrl+^ ����������� ��� �������� ����� 0 � 1
highlight lCursor guifg=Cyan guibg=Cyan "������ ���� ������� ��� �������������� ���������
inoremap <c-l> <c-^>| "������������ ��������� �� ctrl-l
set isk=@,48-57,65-90,97-122,192-255,_ "��������� ����������� ������� ����� ��� ������� "*", dw  � ��

"----- mappings -----


"�������������� �������
map <Leader>ev :e $MYVIMRC<cr>
 
"nnoremap <silent> <leader>b :<C-u>Unite buffer bookmark<CR>
nnoremap <silent> <leader>b :<C-u>CtrlPBuffer<CR>
nmap <Leader>m :CtrlPMRUFiles<cr>

inoremap jj <ESC>la
nnoremap H ^
vnoremap H ^
nnoremap L g_
vnoremap L g_
nnoremap <leader><leader> <C-^>

nnoremap <S-Tab> '[<lt>']
nnoremap <Tab> '[>']
nnoremap <leader><space> '[=']

nnoremap <Leader>: :<c-r>:<cr>

"������������ ��������� ������
nnoremap <silent> <ESC> :nohlsearch<CR><ESC>

"nnoremap / :set hlsearch<cr>/


"------ plugins config ------

"
" unite
"
"


" let g:unite_enable_start_insert = 1                      " �������������� insert mode
 let g:unite_split_rule = "botright"                       " ���������� Unite � ������ ����� ������
 let g:unite_force_overwrite_statusline = 0                " ��������� ������ ������ ������
 let g:unite_winheight = 10                                " ������ ���� Unite

"
" autosave
"
"

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1
let g:auto_save_all = 0 " ���� ���������� ������ �������� �����. ��� ������� � autosave plugin
			"if g:auto_save_all >= 1
			"   silent! wa
			"else 
			"   silent! w
			"endif

" 
"CtrlP
"

let g:ctrlp_custom_ignore='node_modules|git'
let g:ctrlp_match_window = 'top,order:btt,min:1,max:10,results:30'

"
"EasyAlign
"
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)


"
"CtrlP
"
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>


"
"SuperTab
"
let g:SuperTabDefaultCompletionType = "context"

"
" WildFire
"
map <SPACE> <Plug>(wildfire-fuel)


"
" Vault
"
autocmd Filetype vault  nnoremap <buffer> yy f{l"*yi{ 

"
" QuickTask
"
let g:quicktask_snip_path = "~/snips"

"----- auto-commands -----

"��������� beep
autocmd GUIEnter * set vb t_vb=

augroup autosourcing
   autocmd!
"   autocmd BufEnter _vimrc let g:auto_save = 0
"   autocmd BufLeave _vimrc let g:auto_save = 1
"   autocmd BufWritePost _vimrc source %
augroup end

augroup JavaScript
   autocmd!
   autocmd FileType javascript nnoremap <buffer> <leader>c gI//<esc>
   autocmd FileType javascript vnoremap <buffer> <leader>c :normal gI//<esc>
   autocmd FileType javascript nnoremap <buffer> <leader>r :!node %<cr>
   autocmd FileType javascript set formatoptions-=r | set formatoptions-=o                                           
augroup END

"----- functions -----

function! NeatFoldText() 
   let line = repeat(' ', indent(v:foldstart)) . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
   let lines_count = v:foldend - v:foldstart + 1
   let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
   let foldchar = matchstr(&fillchars, 'fold:\zs.')
   let foldtextstart = strpart(line, 0, (winwidth(0)*2)/3)
   let foldtextend = lines_count_text . repeat(foldchar, 8)
   let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
   return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

function! Incr() 
   let a = line('.') - line("'<") 
   let c = virtcol("'<") 
   if a > 0
      execute 'normal! '.c.'|'.a."\<C-a>" 
   endif 
endfunction 

vnoremap <C-a> :call Incr()<CR>

"----- tips -----
"
" ��� ��������������� ��������� � ����� ������, ����� ������� �� ��� ���������
" ��� ����� �������� ����� ����� ����� ���������� ������� ��� �������
" ��������� \
"

function! Get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction


inoremap <F5> <C-R>=ListMonths()<CR>

func! ListMonths()
    call complete(col('.'), ['Januaryyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy$', 'Februaryyyyyyyyyyy', 'Marchyyyyyyyyyy',
                \ 'Aprilyyyyyyyyyy', 'Mayyyyyyyyyyy', 'Juneyyyyyyyyyy', 'Julyyyyyyyyyyy', 'Augusyyyyyyyyyyt', 'Septemyyyyyyyyyyber',
                \ 'Octyyyyyyyyyyober', 'Noveyyyyyyyyyymber', 'Decyyyyyyyyyyember'])
    return ''
endfunc

