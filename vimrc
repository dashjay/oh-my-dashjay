"set background=white
colorscheme molokai
set nocompatible              " be iMproved, required
filetype off                  " required

" 启用vundle来管理vim插件
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tell-k/vim-autopep8'
Plugin 'bling/vim-airline'
Plugin 'The-NERD-tree'
Plugin 'tomlion/vim-solidity'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'dgryski/vim-godef'
Plugin 'rhysd/vim-clang-format'
call vundle#end()            " required
filetype plugin on    " required

" NERD 插件设置
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
 map <F2> :NERDTreeToggle<CR>
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
let NERDTreeWinSize=25
autocmd VimEnter * NERDTree
" NERDTree config

nmap <F9> :TagbarToggle<CR>
let g:tagbar_width=25
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1
"--------------------------------"
syntax on
set ts=4  "(注：ts是tabstop的缩写，设TAB宽4个空格)
set expandtab
set nu!                                    "显示行号
set smartindent                             "（cindent是特别针对 C语言语法自动缩进）
set shiftwidth =4 "设置当行之间交错时使用4个空格i

" set for navi
set rtp+=/usr/local/opt/fzf

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" YouCompleteMe
let g:ycm_server_python_interpreter='/Users/dashjay/.pyenv/versions/3.7.3/bin/python'
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"
let g:ycm_language_server =
  \ [
  \   {
  \     'name': 'gopls',
  \     'cmdline': [ '~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/go/src/golang.org/x/tools/cmd/gopls/gopls' , "-rpc.trace" ],
  \     'filetypes': [ 'go' ],
  \     "project_root_files": [ "go.mod" ]
  \   }
  \ ]
let g:go_def_mode='~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/go/src/golang.org/x/tools/cmd/gopls/gopls'
let g:go_info_mode='~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/go/src/golang.org/x/tools/cmd/gopls/gopls'

"go函数追踪
autocmd FileType go nnoremap <buffer> gd :call GodefUnderCursor()<cr>
autocmd FileType go nnoremap <buffer> <C-]> :call GodefUnderCursor()<cr>
let g:godef_split=3    "左右打开新窗口的时候
let g:godef_same_file_in_same_window=1    "函数在同一个文件中时不需要打开新窗口

"YCM more
let g:ycm_complete_in_strings = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0

" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1

nmap <C-f> :ClangFormat<cr>

let g:ycm_filetype_blacklist = {
     \ 'tagbar' : 1,
     \ 'nerdtree' : 1,
     \}

"配置
let g:clang_format#auto_format_on_save=1	"自动格式化
