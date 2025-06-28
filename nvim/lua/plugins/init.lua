-- ~/.config/nvim/lua/plugins/init.lua

return {
  -- 테마 플러그인
 {
    "shaunsingh/nord.nvim",
    -- VimEnter 이벤트 발생 시 플러그인 로드
    event = "VimEnter",
    -- 플러그인 로드 후 실행될 설정 함수
    config = function()
      vim.cmd.colorscheme("nord")
    end,
  }, 
  { "itchyny/lightline.vim" },
  { "romgrk/barbar.nvim" },
  { "nvim-tree/nvim-web-devicons" }, -- OPTIONAL: for file icons
  { "mhinz/vim-startify" },

  -- 프로그램 관련 플러그인
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- 플러그인 빌드 시 TSUpdate 실행
    opts = {
      ensure_installed = { "lua", "c", "cpp", "python", "javascript", "typescript", "html", "css" }, -- Lua 파서 포함
      highlight = {
        enable = true, -- 구문 강조 활성화
      },
      indent = {
        enable = true, -- 들여쓰기 활성화
      },
    },
    config = function(_, opts)
      -- treesitter config
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  { "nvim-treesitter/playground" },
  { "preservim/tagbar" },
  { "Yggdroot/indentLine" },
  { "github/copilot.vim" },
  { "tpope/vim-fugitive" },
  { "jackguo380/vim-lsp-cxx-highlight" },
  { "neovim/nvim-lspconfig" },
  { "chrisbra/csv.vim" },
  { "blueyed/vim-diminactive" },
  { "ryanoasis/vim-devicons" },
  { "scrooloose/nerdtree" }, -- 여기에 콤마(,)가 있어야 합니다.

  -- telescope 플러그인
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim", branch = "0.1.x" },
}
