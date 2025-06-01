# dotfiles
![image](https://github.com/user-attachments/assets/b62cbed4-9c04-4828-985d-552bae2865b2)

내가 사용하는 간단한 설정 파일들입니다. 

1. .zshrc : zshrc 설정파일<br>
![image](https://github.com/user-attachments/assets/f6faf1cd-0985-4d45-ac20-e49e477e4982)

2. i3wm with polybar<br>
![image](https://github.com/dogsinatas29/dotfiles/blob/main/screenshots/2025-06-01-19%3A23%3A46-screenshot.png)

i3 : i3wm과 Polybar, 그리고 picom을 사용하고 있습니다. Nord 테마를 적용했습니다. <br>
Polybar는 플로팅 스타일로 바꾸었습니다. 각 모듈에 반지름 적용을 하려고 하는데 잘 안되네요. <br>
<br>
모니터 설정을 하시려면 <br>
set $monitor1 "HDMI-0"<br>
set $monitor2 "DVI-D-0"<br>
workspace $ws1 output HDMI-0<br>
workspace $ws2 output DVI-D-0<br>
workspace $ws3 output HDMI-0<br>
workspace $ws4 output DVI-D-0<br>
workspace $ws5 output HDMI-0<br>
workspace $ws6 output DVI-D-0<br>
이 부분을 조정하세요<br>



3. nvim : nvim 설정 <br>
![image](https://github.com/user-attachments/assets/d7f2ac4e-c178-4a11-9ca5-1dc5e1a2f2a7)
Plug으로 플러그인을 업데이트합니다. <br>
" 플러그 인 설치 <br>
"======= nord themes <br>
Plug 'shaunsingh/nord.nvim' <br>

"Light Line themes 플러그 <br>
Plug 'itchyny/lightline.vim' <br>

" 스타티파이 플러그 인 <br>
Plug 'mhinz/vim-startify' <br>

" 프로그램 관련 플러그 인 <br>
Plug 'scrooloose/nerdtree' <br>
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} <br>
Plug 'nvim-treesitter/playground' <br>
Plug 'yegappan/taglist' <br>
Plug 'github/copilot.vim' <br>
Plug 'tpope/vim-fugitive' " Git Wrapper <br>
Plug 'jackguo380/vim-lsp-cxx-highlight' <br>
Plug 'neovim/nvim-lspconfig' <br>
Plug 'chrisbra/csv.vim' <br>
Plug 'blueyed/vim-diminactive' <br>
Plug 'ryanoasis/vim-devicons' <br>

" telescope 플러그 <br>
Plug 'nvim-lua/plenary.nvim' <br>
Plug 'nvim-telescope/telescope.nvim' " 태그 제거 <br>

테마는 Nord 테마입니다.  <br>
Coc가 적용되어 있지 않습니다. 계속 문제가 생겨 포기했어요<br>

4. neofetch : neofetch 설정<br>
![image](https://github.com/user-attachments/assets/e083d14d-29d1-4dcd-a706-0bd34bcf0b10)
OS 로고 대신 아스키 아트를 출력하도록 바꾸었습니다<br>

5. cava <br>
