-- ~/.config/nvim/init.lua
-- ============================================================================
-- 1. Neovim 전역 옵션 설정 (플러그인 로드 전에 설정하는 것이 좋습니다.)
-- ============================================================================
-- 맵 리더 키 설정 (가장 일반적인 설정: 스페이스 바를 리더 키로 사용)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- 기본적인 Neovim 동작 및 외관 관련 설정
vim.opt.nu = true            -- 줄 번호 표시

-- vim.opt.relativenumber = true  -- 상대 줄 번호 표시 (현재 줄 기준)
vim.opt.tabstop = 2          -- 탭 문자의 너비를 2칸으로 설정
vim.opt.shiftwidth = 2       -- 자동 들여쓰기 시 2칸 사용
vim.opt.expandtab = true     -- 탭 대신 스페이스 사용
vim.opt.smartindent = true   -- 지능형 들여쓰기
vim.opt.hlsearch = true      -- 검색어 하이라이트
vim.opt.incsearch = true     -- 점진적 검색 (입력 중 결과 표시)
vim.opt.termguicolors = true -- 터미널 색상 사용 (대부분의 컬러 스킴에 필요)
vim.opt.scrolloff = 8        -- 커서가 화면 가장자리에서 얼마나 떨어져 있을지
vim.opt.updatetime = 300     -- 디스크에 스왑 파일 쓰기 전 지연 시간 (ms)
vim.opt.timeoutlen = 500     -- 매핑 대기 시간 (ms)
vim.opt.undofile = true      -- 실행 취소(undo) 기록을 파일로 저장 (Neovim 재시작 후에도 유지)
vim.opt.ignorecase = true    -- 검색 시 대소문자 무시
vim.opt.smartcase = true     -- 검색 시 대문자가 포함되면 대소문자 구분
vim.opt.splitbelow = true    -- 수평 분할 창은 아래에 생성
vim.opt.splitright = true    -- 수직 분할 창은 오른쪽에 생성
vim.opt.wrap = false         -- 자동 줄 바꿈 비활성화
-- 공백 문자, 탭, 후행 공백 등의 특수 문자 표시를 끕니다.
vim.opt.list = false
-- (선택 사항) listchars를 초기화하여 공백 문자를 정의하지 않습니다.
vim.opt.listchars = ""
-- IndentLine 플러그인 설정
-- 공백 문자 대신 세로 라인만 표시되도록 합니다.
-- 참고: 이는 IndentLine이 로드된 후 실행되어야 합니다.
vim.g.indentLine_setConceal = 0


-- 하이라이트 그룹 설정
vim.cmd("highlight CursorLine guibg=#4C566A ctermbg=238 gui=NONE")
vim.cmd("highlight CursorLineNr guibg=#4C566A ctermbg=238 guifg=#D8DEE9 ctermfg=251 gui=NONE")

-- 각종 기본 호스트 및 프로바이더 설정
vim.g.python3_host_prog = '/home/dogsinatas/.venv/bin/python3'
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- syntax highlight
vim.cmd("syntax enable")
vim.cmd("syntax on")
vim.opt.filetype = "on"

-- ============================================================================
-- 2. lazy.nvim 플러그인 매니저 부트스트랩 (설치 및 로드)
-- ============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- 최신 안정 버전
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.opt.rtp:append(vim.fn.stdpath("config") .. "/after") -- 이 줄이 이전 파일에 없었습니다!
vim.opt.packpath = vim.opt.rtp:get()                     -- 이 줄도 중요합니다.

require("lazy").setup({
  -- 'lua/plugins/' 디렉토리의 모든 .lua 파일을 플러그인 설정으로 가져옵니다.
  { import = "plugins" },
}, {
  rocks = {
    enabled = false,
  },
  install = { colorscheme = { "habamax" } }, -- 플러그인 설치 중 사용할 colorscheme
  checker = { enabled = true },
  performance = {
    rtp = {
      -- 필요한 경우 추가 경로를 여기에 추가할 수 있습니다.
    },
  },
  -- debug = true, -- 디버깅 시 주석 해제
  -- verbose = true,
})

-- Nerdtree 항상 열기 설정
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("NerdtreeAutoOpen", { clear = true }),
  callback = function()
  -- NerdTree가 이미 열려 있지 않고, 파일을 인자로 받지 않았을 때만 엽니다.
  -- (예: nvim <file> 로 열었을 때는 열리지 않음)
    if vim.fn.argc() == 0 and not vim.api.nvim_buf_get_name(0):match("NerdTree") then
      vim.cmd("NERDTree")
    end
  end,
})

-- Tagbar 관련 설정
-- =============================================
-- [핵심 변수 설정]
-- =============================================
-- 자동 닫힘 방지: Tagbar를 항상 띄워 놓기 위해 필수 (0으로 설정)
vim.g.tagbar_autoclose = 0
-- Tagbar로 포커스가 자동으로 이동하도록 설정 (선택 사항)
vim.g.tagbar_autofocus = 1

-- =============================================
-- [Autocmd 및 단축키 설정]
-- =============================================
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("UserConfigGroup", { clear = true }),
  callback = function()


-- Neovim 시작 시 Tagbar 관련 설정 실행
-- 1. F8 단축키 설정 (일반 모드)
    vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>", { silent = true, desc = "Toggle Tagbar" })
-- 2. Tagbar 자동 열기 (Neovim 시작 시)
    vim.cmd('TagbarOpen')
-- 3. Nord 테마 적용 (플러그인 로드 후)
    vim.cmd('colorscheme nord')
  end,
})

-- 이 'VimEnter' Autocmd 블록 바깥에 추가로 정의되어야 합니다.
-- (예: require('lspconfig').lua_ls.setup{})
-- Telescope Oldfiles (즐겨찾기처럼 사용) 단축키 설정
-- <leader>F (Space + Shift + f)로 매핑됩니다.

-- Telescope로 최근파일 불러오기 
vim.keymap.set('n', '<leader>f', function()
  -- require('telescope.builtin') 모듈의 oldfiles 함수를 호출합니다.
  require('telescope.builtin').oldfiles()
end, { desc = "Telescope Old Files (Favorites-like)" })

-- Telescope buffers 
vim.keymap.set('n', '<leader>b', function() -- <leader>b (Space + b)
      require('telescope.builtin').buffers()
    end, { desc = "Telescope Buffers (Switch buffers)" })

-- gemini_ai 모듈 로드
local gemini_ai = require('gemini_ai')

-- 시각 모드 매핑: V (Visual Mode) + <leader>g (Space + g)
-- 선택된 코드를 '설명해주세요'라는 프롬프트와 함께 Gemini에게 보냅니다.
vim.keymap.set('v', '<leader>g', function()
    -- 시각 모드 선택 영역 가져오기
    local selected_text = vim.fn.getbufline(0, vim.fn.line("v"), vim.fn.line("."))
    local prompt = "이 코드를 자세히 설명해 주세요: " .. table.concat(selected_text, "\n")
    
    gemini_ai.ask_gemini(prompt)
end, { noremap = true, silent = true, desc = "Gemini: 선택된 코드 설명" })


-- 일반 모드 매핑: N (Normal Mode) + <leader>G (Space + Shift + g)
-- 간단한 코드 생성 요청 등을 위해 사용 (커서 위치에 따라 다른 프롬프트를 만들 수 있음)
vim.keymap.set('n', '<leader>G', function()
    -- 예시: 현재 파일의 내용을 기반으로 질문
    gemini_ai.ask_gemini("이 파일에 자주 사용되는 유틸리티 함수 5개를 제안해 줘.")
end, { noremap = true, silent = true, desc = "Gemini: 유틸리티 함수 제안" })
