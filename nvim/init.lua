-- ~/.config/nvim/init.lua

-- lazy.nvim 부트스트랩 경로
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- lazy.nvim이 설치되어 있지 않다면 클론합니다.
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- 최신 안정 버전 사용
    lazypath,
  })
end

-- runtimepath (rtp) 설정:
vim.opt.rtp:prepend(lazypath)
vim.opt.rtp:append(vim.fn.stdpath("config") .. "/after")
vim.opt.packpath = vim.opt.rtp:get()

-- 플러그인 로드
require("lazy").setup("plugins", {
  rocks = {
    enabled = false, -- luarocks 지원 비활성화 (checkhealth 경고 제거)
  },
  -- 디버깅을 위해 verbose를 잠시 활성화할 수 있습니다.
  -- verbose = true,
})

-- Neovim 기본 옵션 설정
vim.opt.encoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.cursorline = true
vim.opt.showtabline = 2
vim.opt.mouse = "a"

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
-- ~/.config/nvim/init.lua (하단에 추가)

-- Tagbar 관련 설정
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- F8 키로 Tagbar 토글
    vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>", { silent = true, desc = "Toggle Tagbar" })
  end,
})

-- Tagbar 기본 설정 (선택 사항)
vim.g.tagbar_autofocus = 1 -- Tagbar 열릴 때 자동으로 포커스
vim.g.tagbar_autoclose = 1 -- 마지막 버퍼 닫으면 Tagbar 자동 닫기
