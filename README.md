# dotfiles
기본적으로 gnome환경과 i3wm 환경을 번갈아가면서 사용중입니다. <br?
i3wm은 내 마음에 들도록 바꾸고는 있지만 아직은 어렵네요. <br> 
최종적으로는 i3를 현재의 gnome 환경과 유사하게 바꾸는 걸 목표로 하고 있습니다. <br>
![image](https://github.com/dogsinatas29/dotfiles/blob/main/gnome.png) <br>
1. .zshrc : zshrc 설정파일<br>
![image](https://github.com/user-attachments/assets/f6faf1cd-0985-4d45-ac20-e49e477e4982) <br>
<br>
2. i3wm with polybar<br>
![image](https://github.com/dogsinatas29/dotfiles/blob/main/i3-screenshot.png) <br>
<br>
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
<br>
3. nvim : nvim 설정 <br>
![image](https://github.com/dogsinatas29/dotfiles/blob/main/nvim.png) <br>
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
<br>
테마는 Nord 테마입니다.  <br>
Coc가 적용되어 있지 않습니다. 계속 문제가 생겨 포기했어요<br>

4. neofetch : neofetch 설정<br>
![image](https://github.com/user-attachments/assets/neofetch.png) <br>
OS 로고 대신 아스키 아트를 출력하도록 바꾸었습니다<br>
logo.txt에서 원하는 로고로 바꾸시면 됩니다<br>
<br>
5. cava <br>
![image](https://github.com/dogsinatas29/dotfiles/blob/main/cava.png) <br>
nord 테마로 변경한 cava 설정입니다. <br>

6. 내가 Gnome 환경에서 사용중인 확장 리스트<br>
Applications Overview Tooltip by RaphaelR <br>
https://extensions.gnome.org/extension/1071/applications-overview-tooltip/<br>
ArcMenu by andrew_z <br>
https://extensions.gnome.org/extension/3628/arcmenu/<br>
Auto Move Windows by fmuellner <br>
https://extensions.gnome.org/extension/16/auto-move-windows/<br>
Burn My Windows by Simon Schneegans<br>
https://extensions.gnome.org/extension/4679/burn-my-windows/<br>
Caffeine by eon<br>
https://extensions.gnome.org/extension/517/caffeine/<br>
Compiz alike magic lamp effect by hermes83<br>
https://extensions.gnome.org/extension/3740/compiz-alike-magic-lamp-effect/<br>
Coverflow Alt-Tab by dsheeler <br>
https://extensions.gnome.org/extension/97/coverflow-alt-tab/<br>
Dash2Dock Animated by icedman<br>
https://extensions.gnome.org/extension/4994/dash2dock-lite/<br>
Frippery Move Clock by rmyorston<br>
https://extensions.gnome.org/extension/2/move-clock/<br>
Gnome 4x UI Improvements by AXP<br>
https://extensions.gnome.org/extension/4158/gnome-40-ui-improvements/<br>
GNOME Fuzzy App Search by charlotte <br>
https://extensions.gnome.org/extension/3956/gnome-fuzzy-app-search/<br>
Gravatar by dsheeler<br>
https://extensions.gnome.org/extension/6922/gravatar/<br>
Mute spotify ads by danigm <br>
https://extensions.gnome.org/extension/2176/mute-spotify-ads/<br>
No overview at start-up by fthx <br>
https://extensions.gnome.org/extension/4099/no-overview/<br>
Quick Settings Tweaks by qwreey <br>
https://extensions.gnome.org/extension/5446/quick-settings-tweaker/<br>
Search Light by icedman <br>
https://extensions.gnome.org/extension/5489/search-light/<br>
Space Bar by luchrioh<br>
https://extensions.gnome.org/extension/5090/space-bar/<br>
Spotify Controls + Track Info by Sonath21<br>
https://extensions.gnome.org/extension/7406/spotify-controls/<br>
User Avatar In Quick Settings by d-go <br>
https://extensions.gnome.org/extension/5506/user-avatar-in-quick-settings/<br>
User Themes by fmuellner <br>
https://extensions.gnome.org/extension/19/user-themes/<br>
V-Shell (Customize GNOME Shell UI and App Grid) by GdH <br>
https://extensions.gnome.org/extension/5177/vertical-workspaces/<br>

7. 사용중인 테마는 https://github.com/vinceliuice/Graphite-gtk-theme 를 제가 커스텀 한 테마입니다.<br>
https://github.com/vinceliuice 에 가보시면 고품질의 GTK 테마가 많이 있습니다. <br>

탑 바를 커스텀하기 위해서는 기본적으로 gnome-shell.css 파일을 편집해주셔야 합니다. <br>

몇가지 포인트만 적어봅니다.<br>
먼저 아래 부분을 찾아줍니다.<br>
~/.themes/테마 이름/gnome-shell/gnome-shell.css파일에서<br>

#panel {<br>
이 부분이 패널의 외형을 결정합니다.<br>

패널 모드가 아닌 투명 배경으로 만들어보자.<br>
내려보시면 color 항목이 있습니다.<br>
color: rgba(255, 255, 255, 0.7);<br>
background-color: transparent;<br>
이렇게 바꿔 주시면 패널이 투명해집니다. 그리고 버튼만 남겠죠.<br>

사이즈를 조절해서 floating bar 형태로 만들자<br>
이제 패널의 사이즈와 위치를 바꿔줄 겁니다.<br>
margin 항목을 찾아서 바꿔줍니다.<br>
margin: 2px 100px 1px;<br>
맨 처음 px은 모니터 탑 부분에서 2픽셀 떨어지라는 의미입니다.<br>
마지막 1px은 탑 바와 창 사이의 간격입니다.<br>
중간 100px 부분은 좌우 모니터끝단과의 간격을 말합니다.<br>

height: 24px; 패널의 높이입니다.<br>
경계선 border를 넣고 싶다<br>
border: 2px solid #bdae8e;<br>
border-radius: 5px;<br>
box-shadow: none;<br>
경계선 2픽셀로 솔리드하게 색상을 지정하고 경계선의 휨 정도는 5픽셀로 그림자를 넣지 말라는 의미입니다.<br>
이 3가지만 조절해주셔도 예쁜 탑 바를 가지게 됩니다.<br>
