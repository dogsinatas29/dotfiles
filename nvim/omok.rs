" Plug-In 시작 
call plug#begin('~/.vim/plugged')

" 플러그 인 설치
"=============테마 플러그 인 설정
Plug 'sainnhe/gruvbox-material/'
"Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
"Plug 'shaunsingh/nord.nvim'
"Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}

"에어라인 테마 플러그
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 스타티파이 플러그 인
Plug 'mhinz/vim-startify'

" 프로그램 관련 플러그 인
Plug 'scrooloose/nerdtree'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'yegappan/taglist'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'neovim/nvim-lspconfig'
Plug 'chrisbra/csv.vim'
Plug 'blueyed/vim-diminactive'
Plug 'ryanoasis/vim-devicons'
Plug 'SmiteshP/nvim-navic'
Plug 'melkster/modicator.nvim'

"markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

"구글 바드 플러그 인 설정
Plug 'mosajjal/bard-cli', {'rtp': 'nvim'}

" neural Plugin 불러오기 및 서포트 인터페이스 불러오기
Plug 'dense-analysis/neural'
Plug 'muniftanjim/nui.nvim'
Plug 'elpiloto/significant.nvim'

" limelight/ Goyo 플러그인 - 뷰어 모드 플러그인과 뷰어 모드 강조 플러그인
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

"indent guide line plugins
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'lukas-reineke/indent-blankline.nvim'

" telescope 플러그
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

" 플러그인 시스템 초기화
call plug#end()

" 터미널 트루 컬러
set termguicolors

" NVIM 설정
" Line number 관련 설정
set nu
" set relativenumber
set numberwidth=3

" indent guide line
"set list
"set listchars+=tab:┊\ <-- there's a <Space> after the backslash
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" 각종 기본 호스트 및 프로바이더 설정
let g:python3_host_prog = '/bin/python'
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

" vim-devicon 설정
set encoding=utf8

"let g:bard_enabled = 1
"let g:bard_api_key = 'YOUR_API_KEY'
"let g:bard_suggest_on_keystroke = 0
"let g:bard_auto_start = 1

" syntax highlight
syntax enable
syntax on
filetype on

"==================== 테마 관련 설정임. 테마에 따라 해당 설정을 온오프 시킬 것. airline theme는 별도로 설정할 것
"=========================gruvbox 설정
"set termguicolors
"set background=dark
"let g:gruvbox_italic=1
"let g:gruvbox_contrast_dark='hard'
"colo gruvbox
""colo desert

"================== gruvbox_material 설정
    let g:gruvbox_material_background = 'hard'
    let g:gruvbox_material_better_performance = 1
    let g:gruvbox_material_enable_italic=1
    let g:gruvbox_material_enable_bold=1
    let g:gruvbox_material_cursor='auto'
    let g:gruvbox_material_transparent_background=2
    let g:gruvbox_material_visual='red background'
    let g:gruvbox_material_disable_terminal_colors=1
    let g:gruvbox_material_better_performance=1
    let g:gruvbox_material_telescope_theme = 1
    colorscheme gruvbox-material

" ============ catppuccin themes 설정 
"vim.cmd.colorscheme "catppuccin-macchiato"

"==== nord 테마 설정
"colorscheme nord
"let g:nord_transparent_mode = 1

"============== gruvbox-baby 설정
"let g:gruvbox_baby_function_style = "NONE"
"let g:gruvbox_baby_keyword_style = "italic"
" 그루브박스 베이비 Enable telescope theme
"let g:gruvbox_baby_telescope_theme = 1
" Enable transparent mode
"let g:gruvbox_baby_transparent_mode = 1
" Load the colorscheme
"colorscheme gruvbox-baby

" ======================= VIM_AIRLINE 설정
" integrate vim-airline  (:h airline-coc) -> Does not work as I expected!
 let g:airline#extensions#coc#enabled = 1
" let g:airline#extensions#coc#error_symbol = 'E:'
" let g:airline#extensions#coc#warning_symbol = 'W:'
" let g:airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
" let g:airline#extensions#coc#stl_format_warn = '%W{[%e(#%fw)]}'
" Add (Neo)Vim's native statusline support. -> Does not work as I expected!
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Custom vim-airline integration
function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, 'E' . info['error'])
    endif
    if get(info, 'warning', 0)
        call add(msgs, 'W' . info['warning'])
    endif
    return join(msgs, ' '). ' ' . get(g:, 'coc_status', '') . ' ' . get(b:, 'coc_current_function', '')
endfunction
let airline_section_c = '%{StatusDiagnostic()}'

" +++++++++++++ vim-airline 설정
" Powerline-font 활성화
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
" 에어라인 테마. 테마를 불러들일 때 마다 따로 설정할 것.
"let g:airline_theme='gruvbox'
let g:airline_theme='gruvbox-material'
"let g:airline_theme='catppuccin-macchiato'
"let g:airline_theme='nord'
"let g:airline_theme='gruvbox_baby'

" Tab line 에 파일명만 출력되도록 설정
let g:airline#extensions#tabline#formatter = 'unique_tail'
set laststatus=2 " turn on bottom bar

"airline_section_b is empty now, because corresponding plugins (e.g. coc-git) are not installed
" but maybe not required
" Mappings for CoCList
" Show all diagnostics.
"coc_nav
nnoremap <silent><nowait> <Leader>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <Leader>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <Leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <Leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <Leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <Leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <Leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <Leader>cp  :<C-u>CocListResume<CR>
"====================================================================================================
" nerdtree
map <Leader>nt <ESC>:NERDTree<CR>


" ==================== vim startify 설정

highlight StartifyFooter guifg=#ebdbb2 guibg=#202020
highlight StartifyFooter guifg=#ebdbb2 guibg=#202020

" figlet 헤더 설정
"let g:startify_custom_header =
"       \ startify#pad(split(system('figlet -f ~/.local/share/fonts/3d.flf NeoVim'), '\n'))
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

" NERDTree ON 단축키를 "\nt"로 설정
map <Leader>nt <ESC>:NERDTree<CR>


"======================NERDTREE
" NERDTree 숨김 파일 보이기
let NERDTreeShowHidden=1

" nerdtree 자동 시작
autocmd VimEnter * NERDTree | wincmd p
let g:NERDTreeSyntax=1

"===========TagList 설정
let Tlist_Auto_Open = 1
let Tlist_Use_Right_Window = 1
let Tlist_Close_On_Select = 1
let Tlist_Exit_OnlyWindow = 1
" let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

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
set signcolumn=no
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
autocmd CursorHold * silent call CocActionAsync('highlight')
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
"" Remap <C-f> and <C-b> for scroll float windows/popups.
"if has('nvim-0.4.0') || has('patch-8.2.0750')
"  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif
" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
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

" Neural 사용을 위한 기본 설정
let g:neural = {
\   'source': {
\       'openai': {
\           'api_key': $OPENAI_API_KEY
\       },
\   },
\}

" 라임라이트 옵션
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


"===================== MarkdownPreview 
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'dark'
