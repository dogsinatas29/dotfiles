set encoding=utf-8

" path 설정

" Plug-In 시작 
call plug#begin('~/.vim/plugged')

" 플러그 인 설치
"=============테마 플러그 인 설정
"Plug 'sainnhe/gruvbox-material/'
"======= nord themes
Plug 'shaunsingh/nord.nvim'

"Light Line themes 플러그
Plug 'itchyny/lightline.vim'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons

" 스타티파이 플러그 인
Plug 'mhinz/vim-startify'

" 프로그램 관련 플러그 인
Plug 'scrooloose/nerdtree'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'preservim/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'github/copilot.vim'
Plug 'tpope/vim-fugitive' " Git Wrapper
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'neovim/nvim-lspconfig'
Plug 'chrisbra/csv.vim'
Plug 'blueyed/vim-diminactive'
Plug 'ryanoasis/vim-devicons'
" telescope 플러그
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim' " 태그 제거


" 플러그인 시스템 초기화
call plug#end()

" 터미널 트루 컬러
set termguicolors

" NVIM 설정

" Line number 관련 설정
set nu
" set relativenumber
set numberwidth=3

" 각종 기본 호스트 및 프로바이더 설정
let g:python3_host_prog = '/home/dogsinatas/.venv/bin/python3'
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

" syntax highlight
syntax enable
syntax on
"filetype on
filetype plugin indent on
"==================== 테마 관련 설정임. 테마에 따라 해당 설정을 온오프 시킬 것. airline theme는 별도로 설정할 것

"================== gruvbox_material 설정
"    let g:gruvbox_material_background = 'hard'
"    let g:gruvbox_material_better_performance = 1
"    let g:gruvbox_material_enable_italic=1
"    let g:gruvbox_material_enable_bold=1
"    let g:gruvbox_material_cursor='auto'
"    let g:gruvbox_material_transparent_background=2
"    let g:gruvbox_material_visual='red background'
"    let g:gruvbox_material_disable_terminal_colors=1
"    let g:gruvbox_material_better_performance=1
"    let g:gruvbox_material_telescope_theme = 1
"    colorscheme gruvbox-material

" cursor 설정
set cursorline
highlight CursorLine guibg=#4C566A ctermbg=238 gui=NONE
highlight CursorLineNr guibg=#4C566A ctermbg=238 guifg=#D8DEE9 ctermfg=251 gui=NONE

"Vim-Script:

colorscheme nord
let g:nord_contrast = v:true
let g:nord_borders = v:false
let g:nord_disable_background = v:false
let g:nord_italic = v:false
let g:nord_uniform_diff_background = v:true
let g:nord_bold = v:false

" nerdtree
map <Leader>nt <ESC>:NERDTree<CR>

" NERDTree ON 단축키를 "\nt"로 설정
map <Leader>nt <ESC>:NERDTree<CR>

"======================NERDTREE
" NERDTree 숨김 파일 보이기
let NERDTreeShowHidden=1

" nerdtree 자동 시작
autocmd VimEnter * NERDTree | wincmd p
let g:NERDTreeSyntax=1

" ==================== vim startify 설정
highlight StartifyFooter guifg=#ebdbb2 guibg=#202020
highlight StartifyFooter guifg=#ebdbb2 guibg=#202020

" startify 아스키 아트 헤더
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction

let g:startify_custom_header = s:filter_header([
\'⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷',
\'⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇',
\'⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽',
\'⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕',
\'⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕',
\'⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕',
\'⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄',
\'⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕',
\'⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿',
\'⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
\'⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟',
\'⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠',
\'⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙',
\'⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣',
\ ])
let g:startify_bookmarks = [
  \ { 'z': '~/.zshrc' },
  \ { 'v': '~/.config/nvim/init.vim' },
  \ { 'i': '~/.config/nvim/lua/init.lua' },
  \ { 'n': '~/.config/neofetch/config.conf' },
  \ { 'c': '~/.config/cava/config' },
  \ ]

let g:startify_lists = [
      \ { 'header': ['   Bookmarks'],       'type': 'bookmarks' },
      \ { 'header': ['   MRU'],            'type': 'files' },
      \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
      \ ]
" ==================== vim startify 설정 끝

" ============ Tagbar 설정
let g:tagbar_autofocus = 1 " Tagbar 열릴 때 자동으로 포커스 이동
let g:tagbar_width = 30    " 사이드바 너비
let g:tagbar_autoclose = 1 " 다른 파일 열면 자동으로 닫기
nnoremap <F8> :TagbarToggle<CR>

" ============ IndentLine 설정
let g:indentLine_enabled = 1
let g:indentLine_setIcons = '│'
let g:indentLine_concealcursor = 'niv'
let g:indentLine_tab_chars = ['│'] " 탭 문자마다 표시할 문자 설정
let g:indentLine_leadingSpaceChar = ' ' " 스페이스 들여쓰기 시 사용할 문자
let g:indentLine_leadingTabChar = '│' " 탭 들여쓰기 시 사용할 문자

" Configuration of LanguageClient-neovim to use cquery and ccls with


" ccls
" also see https://github.com/autozimu/LanguageClient-neovim/wiki/ccls
let s:ccls_settings = {
         \ 'highlight': { 'lsRanges' : v:true },
         \ }

let s:ccls_command = ['ccls', '-init=' . json_encode(s:ccls_settings)]

let g:LanguageClient_serverCommands = {
      \ 'c': s:ccls_command,
      \ 'cpp': s:ccls_command,
      \ 'objc': s:ccls_command,
      \ }

" cquery
" also see https://github.com/autozimu/LanguageClient-neovim/wiki/cquery
let s:cquery_settings = {
         \ 'cacheDirectory': '/var/cquery/',
         \ 'highlight': { 'enabled' : v:true },
         \ }

let s:cquery_command = ['cquery', '-init=' . json_encode(s:cquery_settings)]

let g:LanguageClient_serverCommands = {
      \ 'c': s:cquery_command,
      \ 'cpp': s:cquery_command,
      \ 'objc': s:cquery_command,
      \ }
" Show line diagnostics automatically in hover window

" vim.o.updatetime = 250
" vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
"
"lvim.o.updatetimeocal signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
"for type, icon in pairs(signs) do
"  local hl = "DiagnosticSign" .. type
"  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
"end

" Print diagnostics to message area
"function PrintDiagnostics(opts, bufnr, line_nr, client_id)
"  bufnr = bufnr or 0
"  line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
"  opts = opts or {['lnum'] = line_nr}
"
"  local line_diagnostics = vim.diagnostic.get(bufnr, opts)
"if vim.tbl_isempty(line_diagnostics) then return end
"
" local diagnostic_message = ""
"  for i, diagnostic in ipairs(line_diagnostics) do
"    diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
"    print(diagnostic_message)
"    if i ~= #line_diagnostics then
"      diagnostic_message = diagnostic_message .. "\n"
"    end
"  end
"  vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
"end

"vim.cmd [[ autocmd! CursorHold * lua PrintDiagnostics() ]]

" 커서 베이스 하이라이트 설정
" highlight Cursor guibg=#5f87af ctermbg=67
" highlight iCursor guibg=#ffffaf ctermbg=229
" highlight rCursor guibg=#d70000 ctermbg=124
" set guicursor=n-v-c:block-Cursor/lCursor
"            \,i-ci-ve:ver100-iCursor
"            \,r-cr:block-rCursor
"            \,o:hor50-Cursor/lCursor
"            \,sm:block-iCursor
"             \,a:blinkwait1000-blinkon500-blinkoff250

"lightline 플러그인 설정
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
" 탭라인이 항상 보이도록 설정
set showtabline=2
" 마우스 지원 활성화
set mouse+=a
" lspconfig 설정
lua << EOF
require'lspconfig'.pylsp.setup{}
EOF
