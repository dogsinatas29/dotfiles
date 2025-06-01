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

" 스타티파이 플러그 인
Plug 'mhinz/vim-startify'

" 프로그램 관련 플러그 인
Plug 'scrooloose/nerdtree'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'yegappan/taglist'
Plug 'github/copilot.vim'
Plug 'tpope/vim-fugitive' " Git Wrapper
" Plug 'neoclide/coc.nvim', {'brach': 'release'}
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

"Vim-Script:

colorscheme nord
let g:nord_contrast = v:true
let g:nord_borders = v:false
let g:nord_disable_background = v:false
let g:nord_italic = v:false
let g:nord_uniform_diff_background = v:true
let g:nord_bold = v:false



" Load the colorscheme
colorscheme nord
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

" ===========TagList 설정
let Tlist_Auto_Open = 1
let Tlist_Use_Right_Window = 1
let Tlist_Close_On_Select = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Ctags_Cmd = '/usr/bin/ctags'

" ======= Coc 설정
" coc.nvim
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Settings for neovim: nevoim does not support signcolumn+number column yet
"set signcolumn=no
hi coc_err_hi ctermfg=1 ctermbg=15
sign define coc_err numhl=coc_err_hi
sign place 1 line=2 name=coc_err
hi CocErrorSign ctermfg=gray
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

highlight Normal     ctermbg=NONE
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
" Floating window background=white, foreground=black

" CocFloating - Pmenu의 옆에 나오는 box & error시 나오는 box
highlight CocFloating ctermbg=white ctermfg=black

"syntax
syntax on

"tap size
set tabstop=4
set shiftwidth=4
set expandtab

"line number
set number

"set smartindent
"hilight search
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> 

"backspace
set backspace=indent,eol,start
set t_kb=

"mouse wheel
set mouse=a
"set nowrap
set wrap
" reduce empty space at bottom
set cmdheight=1
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"====================================================================================================
"avoid overriding variables py Vim filetype
autocmd FileType python setlocal tabstop=4
      
" diminactive 설정
let g:diminactive_use_colorcolumn = 1
let g:diminactive_enable_focus = 1
let g:diminactive_use_syntax = 1

" vim-lsp-cxx-hilight 설정
let g:lsp_cxx_hl_use_text_props = 1
" Configuration of vim-lsp to use cquery and ccls with vim-lsp

" also see https://github.com/prabirshrestha/vim-lsp/wiki/Servers-cquery
"
" cquery always requires these options
" highlight.enabled = true
" emitInactiveRegions = true
if executable('cquery')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'cquery',
      \ 'cmd': {server_info->['cquery']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {
      \   'cacheDirectory': '/path/to/cquery/cache',
      \   'highlight': { 'enabled' : v:true },
      \   'emitInactiveRegions': v:true
      \ },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

" also see https://github.com/prabirshrestha/vim-lsp/wiki/Servers-ccls
"
" highlight.lsRanges = true
" is only necessary if vim doesn't have +byte_offset
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {
      \   'highlight': { 'lsRanges' : v:true },
      \ },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif
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
      
" lspconfig 설정
lua << EOF
require'lspconfig'.pylsp.setup{}
EOF

