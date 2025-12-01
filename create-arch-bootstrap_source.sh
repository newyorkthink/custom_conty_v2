#!/usr/bin/env bash

:<<'NOTE'
以后如果出现比较新的软件或者程序，先不要那这两个archlinux 来试，而是重新开个新的conty.

请留意，对比代码的时候，需要同时用到bcompare 和 bcompare5 ，因为有些行对比就是不一样，需要用两个同时确认，先用bcompare5 再用 bcompare 
一般更新拷贝的软件，只需要将代码文件复制到 /opt 就行，那个图标和desktop 就不要去动

重新进行打包封装文件之间，需要重新确认conty.sh文件里面的fastfatch命令与本地主机的版本一致。
每次重新进行封装之前，需要对各种包进行重新整理。
每次打包封装的时候，需要留意是否存在包与包有冲突的情况。
封装其他conty.sh文件的时候，不要安装firefox，而是改成安装chromium.
dxvk 驱动，不要装，需要编译, solidity 也是，换成bin版本的:dxvk-bin dxvk-gplasync-bin libdxvk dxvk-mingw dxvk-async-git dxvk-nvapi-mingw
polkit 这个文件需要装，有些程序需要用root的时候，需要有pkexec 命令执行
每次打包的时候， 记得用 >> 把日志存到本地文本文件，以便观察那些包或者文件过时
jriver media center 通过copy的方式移到里面, 版本不要频繁更新，并且不要单独封装成一个文件，只能依附在这个conty.sh。
不要再安装过多软件.
nvidia-utils 不要安装，会和原本系统版本冲突，又会重新下载和主机系统版本的驱动
建议不要单独打包jriver, 单独打包这个程序太大
下次再进行封装的时候，不要封装wine和32位的软件，这些单独出来，可以封装更多的基础软件，例如文件管理等
每次进行更新的时候，需要再arch linux包官网看下包的最新情况,并且打包完成之后，也要进行一次全面测试，判断这些包在功能上有没有问题等。
并且每次更新的时候，想下哪些包需要进行添加，哪些包需要删除，再并且整理下包的排版。
以后进行更新，某些特殊的软件包，通过复制进去的方式的，如果再运行过程中出现某些库文件缺少，就先把相关的库文件记录下来，然后通过新建一个item depend把相关库进行安装，最后重新打包。
请注意就是国产软件需要完整的中文字体，缺了部分中文字体会导致字体无法正常显示

注意重点：尽可能不要安装需要破解, 有公司背景的或者需要注册的软件在这个conty上，如果实在有特殊情况单独打包一个新的conty.sh

以下包不要安装，这里进行说明：
ungoogle chromium: 这些会让albert直接调用chromium
pdf studio文件夹无法打开
QtScrcpy 也不要放进去
kando-bin 不要安装，无法启动。
tonfotos 不要放进去，有时候报错缺少libffmpeg.so等
niri 不要放进去, 在i3wm下面只是开了各窗口，无法使用
kodi不要安装 ,kodi 无法进行nvidia解码，而且会和mediacenter有一定的冲突。
cisco-anyconnect 无法正常打开，无法执行，可能或可以用openconnect平替
Rssguard 不建议打包，有跨平台的follow
keepassxc 这个软件会存入很多密码之类的，不要封装进去，当读出来，避免版本更新出现问题，用旧版的就行
xnviewmp appimage 版本可以显示图片以及视频播放了，不会闪退
kate 不要安装
# Do not install these packages: zathura, zathura-cb, zathura-djvu, zathura-pdf-mupdf, zathura-pdf-poppler, zathura-ps
# Do not install these packages: dolphin dolphin-plugins
# Do not install these packages: plasma5-themes-matchama plasma5-themes-dracula-git
# Do not install these packages: ffmpeg-full
# Do not install these packages: kdeconnect
# do not install these packages: pipewire-pulse pipewire-audio pipewire-jack
# do not install these packages: ftp
bcompare5 不建议打包进去，会和4发生冲突
hifile 不建议打包
Rssguard 不建议打包，有跨平台的follow

以下包只能通过复制的方式进行安装：
sudo cp -r ./sharedfolder/Downloads/fonts/* ./custom_conty/root.x86_64/usr/share/fonts
sudo cp -r ./sharedfolder/Downloads/icons/* ./custom_conty/root.x86_64/usr/share/pixmaps

请和archlinux2 判断一样，看下以下文件夹打包前是否缺少一些文件
这部分一定要留意，就是arch linux 是缺少libpixbufloader-svg.so（注意是-不是_）缺少这个会导致某些程序缺失小图标
sudo cp -r ./sharedfolder/Downloads/lib/libpixbufloader-svg.so ./custom_conty/root.x86_64/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/
sudo cp -r ./sharedfolder/Downloads/lib/* ./custom_conty/root.x86_64/usr/lib/

下次打包的注意事项：

特殊软件的说明：
有些软件会调用终端，文件夹，文本编辑之类的软件，我个人建议就还是能放进去的尽量放进去，有些个别特殊软件，频繁更新的软件就不要放。

请留意以下情况：
1. Generating mirrorlist...
[2024-09-28 09:49:33] WARNING: failed to rate http(s) download (https://mirror.cyberbits.eu/archlinux/extra/os/x86_64/extra.db): Download timed out after 10 second(s).
出现timed out 的时候，需要注意就是出现一个的时候，可以继续，如果出现两个以上的话，就删除重新开始

以下软件/命令请确保版本和主机的保持一直(如果比较多的话，就打包前把主机的拷贝进去，前提是全部安装好之后)：
fastfatch lf

这个情况比较特殊
其次，libffmpeg.so lib下缺少这个，某些特定软件也会无法打开，这种情况，一般就是该程序没有指名执行路径导致的，一般archlinux 软件源有.sh文件，把这个复制到本地上执行就可以
不要用连接的方式,这个方式会导致程序自身复制到Bin中，导致报错, 所有需要创建一个sh脚本， 指名绝对路径，/opt/.../...
NOTE

# Dependencies: curl tar gzip grep coreutils
# Root rights are required

########################################################################

# Package groups
cli_download_tools="yt-dlp curl wget wget2 aria2 axel httpie"
cli_sync_tools="rsync rclone unison"
udisks2_tools="udiskie udisks2 udisks2-btrfs udisks2-lvm2 udisks2-qt5"
terminal_emulators="terminator lxterminal rxvt-unicode xterm gnome-terminal xfce4-terminal"
text_editors="neovim nano geany geany-plugins leafpad mousepad gedit gedit-plugins"
pdf_utilities="evince evince-lib-docs pdftk pdfgrep qpdf okular"
shell_tools="zsh zsh-autosuggestions zsh-completions zsh-doc zsh-history-substring-search zsh-syntax-highlighting dash bash bash-completion bash-language-server bash-preexec"
compression_cli_tools="p7zip gzip bzip2 pbzip2 xz pixz zip unzip minizip zstd arj unarj lrzsz tar atool pax cpio"
gui_compression_tools="file-roller ark engrampa xarchiver"
qt_dependencies='qt5ct qt5-base qt5-wayland qt5-tools qt5-declarative qt5-multimedia qt5-webengine qt5-x11extras qt5-graphicaleffects qt5-imageformats qt5-location qt5-quickcontrols \
	qt5-quickcontrols2 qt5-systems qt5-webchannel qt5-websockets qt5-svg kvantum kvantum-qt5 \
	qt6ct qt6-base qt6-wayland qt6-tools qt6-declarative qt6-multimedia qt6-webengine qt6-imageformats qt6-multimedia-gstreamer qt6-networkauth qt6-webchannel qt6-websockets qt6-webview'
input_method_frameworks="fcitx5 fcitx5-anthy fcitx5-bamboo fcitx5-breeze fcitx5-chewing fcitx5-chinese-addons fcitx5-configtool fcitx5-gtk fcitx5-hangul fcitx5-kkc fcitx5-libthai fcitx5-lua \
	fcitx5-m17n fcitx5-material-color fcitx5-nord fcitx5-pinyin-zhwiki fcitx5-qt fcitx5-rime fcitx5-sayura fcitx5-skk fcitx5-table-extra fcitx5-table-other fcitx5-unikey libime \
	ibus ibus-anthy ibus-chewing ibus-hangul ibus-kkc ibus-libpinyin ibus-rime ibus-skk ibus-sunpinyin ibus-table ibus-table-chinese ibus-table-extraphrase ibus-typing-booster ibus-unikey \
	rime-bopomofo rime-cangjie rime-double-pinyin rime-emoji rime-essay rime-loengfan rime-luna-pinyin rime-pinyin-simp rime-pinyin-zhwiki rime-prelude rime-quick rime-stroke rime-terra-pinyin rime-wubi rime-wugniu"
fonts_management_tools="font-manager fontconfig gnome-font-viewer freetype2 freetype2-demos freetype2-docs"
common_fonts='ttf-dejavu ttf-droid ttf-dejavu-nerd ttf-liberation ttf-roboto-mono ttf-roboto-mono-nerd ttf-jetbrains-mono-nerd ttf-jetbrains-mono \
	wqy-bitmapfont wqy-zenhei wqy-microhei \
	adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts \
	noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra'
desktop_themes="sound-theme-freedesktop gnome-themes-extra hicolor-icon-theme gtk-engine-murrine papirus-icon-theme adwaita-icon-theme adw-gtk-theme adwaita-cursors materia-gtk-theme kvantum-theme-materia breeze breeze-icons"
spellcheck_tools="enchant aspell hspell hunspell gspell gtkspell codespell nuspell"
package_management_tools="rpmextract rpm-sequoia dpkg yay pacredir pkgfile pacman-contrib"
wayland_packages="wayland wayland-protocols wlroots wayland-utils xdg-desktop-portal xdg-desktop-portal-gtk"
xorg_packages="xorg-server xorg-server-common xorg-server-devel xorg-xinit xorg-xinput xorg-xwayland xorg-server-xephyr xorg-xrandr xorg-xset xorg-xprop xorg-font-util xorg-xkbcomp xorg-docs"
x11_core_libraries="libx11 libxslt libxext libxau libxdmcp libxkbcommon libxkbcommon-x11 libxcb libxi libxrandr libxinerama libxcomposite libsm libxrender libxfixes libxdamage libxft libxtst libxv"
multimedia_tools="mpv vlc smplayer smplayer-skins smplayer-themes handbrake simplescreenrecorder ffmpeg audacity audacity-docs qview feh nsxiv nitrogen imagemagick gpicview gimp v4l-utils libtiff \
	gstreamer gstreamer-vaapi gst-plugins-base gst-plugins-base-libs gst-plugins-good gst-plugins-bad gst-plugins-bad-libs gst-plugins-ugly gst-libav gst-plugin-pipewire gst-plugins-espeak"
file_manager_tools="thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman pcmanfm-gtk3 libfm-qt tumbler ffmpegthumbnailer libgepub libgsf libopenraw poppler poppler-glib nautilus nautilus-image-converter nautilus-python nautilus-share"
gvfs_packages="gvfs gvfs-afc gvfs-dnssd gvfs-goa gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb gvfs-wsdd"
dbus_packages="dbus dbus-units dbus-glib dbus-docs xdg-dbus-proxy python-dbus"
python_dev_tools="python python-pip python-protobuf python-setuptools python-wheel python-virtualenv python-virtualenvwrapper python-requests ipython cython python-pipenv python-poetry python-pytest python-pylint python-pylint-venv python-coverage"
go_dev_tools="go gopls delve go-tools"
rust_dev_tools="rust rust-analyzer"
nodejs_dev_tools="nodejs npm yarn"
cpp_dev_tools="cmake extra-cmake-modules clang make ninja gdb cppcheck valgrind mingw-w64-gcc"
cpp_libs="boost eigen glibc gcc-libs"
java_dev_tools="jdk-openjdk jdk17-openjdk maven gradle"
additional_language_dev_tools="ruby ruby-bundler php php-fpm perl cpanminus ghc cabal-install lua luajit zig"
development_tools="base-devel devtools binutils meson autoconf automake strace patch pkg-config flex"
database_libs="sqlite"
bluetooth_management_packages="bluez bluez-cups bluez-deprecated-tools bluez-hid2hci bluez-libs bluez-mesh bluez-obex bluez-qt bluez-qt5 bluez-tools bluez-utils blueberry blueman bluedevil gnome-bluetooth gnome-bluetooth-3.0 switchboard-plug-bluetooth pulseaudio-bluetooth"
gtk_packages="gtk2 gtk3 gtk4 webkit2gtk webkit2gtk-docs webkit2gtk-4.1 webkit2gtk-4.1-docs glib2"
gnome_environment_tools="gnome-tweaks gnome-control-center gnome-system-monitor gnome-disk-utility baobab gnome-settings-daemon gnome-characters gnome-logs"
cli_git_tools="git git-lfs lazygit tig git-delta"
cli_process_monitor_tools="btop nvtop htop bottom"
openbox_environment="openbox lxappearance libnotify libappindicator-gtk3 libxft libvoikko at-spi2-core"
firmware_packages="sof-firmware linux-firmware alsa-firmware intel-ucode amd-ucode"
haskell_libraries="haskell-bzlib haskell-graphscc haskell-pandoc-lua-engine haskell-pandoc-lua-marshal haskell-alsa-core haskell-alsa-mixer"
graphics_drivers="mesa xf86-video-intel xf86-video-amdgpu xf86-video-vesa intel-media-driver libdrm libglvnd libepoxy libclc"
vulkan_tools="vulkan-radeon vulkan-intel vulkan-icd-loader vulkan-mesa-layers vulkan-tools mangohud libvpl libvpl-tools openpgl openvkl glslang spirv-tools shaderc"
utility_software_packages="dconf dconf-editor hplip meld psensor speedcrunch cheese qalculate-gtk kcolorchooser bleachbit peek flameshot shutter copyq uget filezilla chromium"
video_acceleration="libva libva-mesa-driver libva-intel-driver mesa-vdpau vdpauinfo libvdpau libvdpau-va-gl"
debugging_tools="mesa-utils libva-utils mesa-demos glmark2 apitrace renderdoc"
directx_tools="vkd3d directx-headers directx-shader-compiler"
network_manager="networkmanager network-manager-applet network-manager-sstp networkmanager-docs networkmanager-l2tp networkmanager-openconnect networkmanager-openvpn nm-cloud-setup networkmanager-qt5 networkmanager-strongswan networkmanager-vpnc nm-connection-editor"
multimedia_libs="libpng libjpeg-turbo giflib mpg123 sdl2 libgphoto2"
alsa_packages="alsa-card-profiles alsa-lib alsa-oss alsa-plugins alsa-scarlett-gui alsa-tools alsa-topology-conf alsa-ucm-conf alsa-utils"
pulseaudio_packages="pulseaudio pavucontrol pavucontrol-qt pulseaudio-alsa pamixer paprefs pasystray plasma-pa pulseaudio-equalizer pulseaudio-equalizer-ladspa libpulse"
pipewire_packages="pipewire-audio wireplumber"
audio_tools_plugins="qastools qemu-audio-alsa drumstick kmidimon qmidiarp qmidiarp-lv2 qmidiarp-standalone fluidsynth lv2"
audio_effects_tools="zita-ajbridge zita-alsa-pcmi zita-bls1 zita-convolver easyeffects helvum qpwgraph tinycompress musepack-tools sndio speex speexdsp rtkit webrtc-audio-processing-1 orc"
audio_drivers_libraries="jack2 libldac sbc libfreeaptx openal libsndfile libsamplerate libsamplerate libcanberra libsoxr libasyncns libvorbis"
network_management_tools="net-tools traceroute iperf mtr iproute2 libnm dhclient wireless_tools wpa_supplicant iw iwd nethogs iftop hostapd bridge-utils ethtool dnsmasq inetutils netctl dhcpcd"
security_tools="openssh openssl openssl-1.1 krb5 lxqt-openssh-askpass openvpn iptables ufw fail2ban squid privoxy tinyproxy gnutls libldap qrencode haveged gnu-netcat nmap tcpdump libgpg-error"
file_system_tools="attr cryptsetup smartmontools parted gparted lvm2 fsarchiver gsmartcontrol mkinitcpio-nfs-utils ntfs-3g exfat-utils jfsutils util-linux dosfstools e2fsprogs btrfs-progs xfsprogs cifs-utils mdadm"
network_file_systems="samba nfs-utils mkinitcpio-nfs-utils avahi sshfs"
cli_utilities="tmux screen bat bat-extras ripgrep fzf lsd shellcheck mcfly fd ncdu inxi jq sdcv dust duf dua-cli lf tree which cmatrix usbutils pciutils less findutils psmisc procps-ng expect zoxide"
desktop_utilities="desktop-file-utils xdotool arandr xclip xsel xbindkeys numlockx albert zenity xdg-utils xdg-user-dirs dmenu rofi nwg-drawer dunst xdotool"
base_utilities="polkit expat filesystem coreutils shadow libffi libxml2 gettext ncurses file duktape cairo vorbis-tools libxcrypt-compat"
android_tools="android-tools android-udev scrcpy android-file-transfer"
remote_utilities="remmina freerdp freerdp2 spice spice-vdagent spice-protocol spice-gtk libvncserver x11vnc wayvnc gtk-vnc kwallet5 libsecret tigervnc virt-viewer"
cli_system_info_tools="clinfo hwinfo lshw lm_sensors fastfetch"

###################################################################################################################

# Packages to install
# You can add packages that you want and remove packages that you don't need
# Apart from packages from the official Arch repos, you can also specify
# packages from the Chaotic-AUR repo
export packagelist="${base_utilities} \
	${x11_core_libraries} \
	${firmware_packages} \
	${graphics_drivers} \
	${video_acceleration} \
	${vulkan_tools} \
	${alsa_packages} \
	${pulseaudio_packages} \
	${pipewire_packages} \
	${audio_drivers_libraries} \
	${audio_tools_plugins} \
	${audio_effects_tools} \
	${network_management_tools} \
	${network_manager} \
	${security_tools} \
	${file_system_tools} \
	${network_file_systems} \
	${udisks2_tools} \
	${wayland_packages} \
	${xorg_packages} \
	${development_tools} \
	${cpp_libs} \
	${python_dev_tools} \
	${go_dev_tools} \
	${rust_dev_tools} \
	${nodejs_dev_tools} \
	${cpp_dev_tools} \
	${java_dev_tools} \
	${additional_language_dev_tools} \
	${haskell_libraries} \
	${cli_utilities} \
	${cli_download_tools} \
	${cli_sync_tools} \
	${cli_git_tools} \
	${cli_process_monitor_tools} \
	${cli_system_info_tools} \
	${shell_tools} \
	${package_management_tools} \
	${compression_cli_tools} \
	${gtk_packages} \
	${qt_dependencies} \
	${gnome_environment_tools} \
	${openbox_environment} \
	${desktop_themes} \
	${desktop_utilities} \
	${file_manager_tools} \
	${gvfs_packages} \
	${multimedia_libs} \
	${multimedia_tools} \
	${text_editors} \
	${pdf_utilities} \
	${terminal_emulators} \
	${fonts_management_tools} \
	${common_fonts} \
	${input_method_frameworks} \
	${spellcheck_tools} \
	${gui_compression_tools} \
	${bluetooth_management_packages} \
	${dbus_packages} \
	${utility_software_packages} \
	${android_tools} \
	${remote_utilities} \
	${debugging_tools} \
	${directx_tools} \
	${database_libs}"

# If you want to install AUR packages, specify them in this variable
export aur_packagelist=""

# ALHP is a repository containing packages from the official Arch Linux
# repos recompiled with -O3, LTO and optimizations for modern CPUs for
# better performance
#
# When this repository is enabled, most of the packages from the official
# Arch Linux repos will be replaced with their optimized versions from ALHP
#
# Set this variable to true, if you want to enable this repository
enable_alhp_repo="false"

# Feature levels for ALHP. Available feature levels are 2 and 3
# For level 2 you need a CPU with SSE4.2 instructions
# For level 3 you need a CPU with AVX2 instructions
alhp_feature_level="2"

########################################################################

if [ $EUID != 0 ]; then
	echo "Root rights are required!"

	exit 1
fi

if ! command -v curl 1>/dev/null; then
	echo "curl is required!"
	exit 1
fi

if ! command -v gzip 1>/dev/null; then
	echo "gzip is required!"
	exit 1
fi

if ! command -v grep 1>/dev/null; then
	echo "grep is required!"
	exit 1
fi

if ! command -v sha256sum 1>/dev/null; then
	echo "sha256sum is required!"
	exit 1
fi

script_dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

mount_chroot () {
	# First unmount just in case
	umount -Rl "${bootstrap}"

	mount --bind "${bootstrap}" "${bootstrap}"
	mount -t proc /proc "${bootstrap}"/proc
	mount --bind /sys "${bootstrap}"/sys
	mount --make-rslave "${bootstrap}"/sys
	mount --bind /dev "${bootstrap}"/dev
	mount --bind /dev/pts "${bootstrap}"/dev/pts
	mount --bind /dev/shm "${bootstrap}"/dev/shm
	mount --make-rslave "${bootstrap}"/dev

	rm -f "${bootstrap}"/etc/resolv.conf
	cp /etc/resolv.conf "${bootstrap}"/etc/resolv.conf

	mkdir -p "${bootstrap}"/run/shm
}

unmount_chroot () {
	umount -l "${bootstrap}"
	umount "${bootstrap}"/proc
	umount "${bootstrap}"/sys
	umount "${bootstrap}"/dev/pts
	umount "${bootstrap}"/dev/shm
	umount "${bootstrap}"/dev
}

run_in_chroot () {
	if [ -n "${CHROOT_AUR}" ]; then
		chroot --userspec=aur:aur "${bootstrap}" /usr/bin/env LANG=en_US.UTF-8 TERM=xterm PATH="/bin:/sbin:/usr/bin:/usr/sbin" "$@"
	else
		chroot "${bootstrap}" /usr/bin/env LANG=en_US.UTF-8 TERM=xterm PATH="/bin:/sbin:/usr/bin:/usr/sbin" "$@"
	fi
}

install_packages () {
	echo "Checking if packages are present in the repos, please wait..."
	for p in ${packagelist}; do
		if pacman -Sp "${p}" &>/dev/null; then
			good_pkglist="${good_pkglist} ${p}"
		else
			bad_pkglist="${bad_pkglist} ${p}"
		fi
	done

	if [ -n "${bad_pkglist}" ]; then
		echo ${bad_pkglist} > /opt/bad_pkglist.txt
	fi

	for i in {1..10}; do
		if pacman --noconfirm --needed -S ${good_pkglist}; then
			good_install=1
			break
		fi
	done

	if [ -z "${good_install}" ]; then
		echo > /opt/pacman_failed.txt
	fi
}

install_aur_packages () {
	cd /home/aur

	echo "Checking if packages are present in the AUR, please wait..."
	for p in ${aur_pkgs}; do
		if ! yay -a -G "${p}" &>/dev/null; then
			bad_aur_pkglist="${bad_aur_pkglist} ${p}"
		fi
	done

	if [ -n "${bad_aur_pkglist}" ]; then
		echo ${bad_aur_pkglist} > /home/aur/bad_aur_pkglist.txt
	fi

	for i in {1..10}; do
		if yes | yay --needed --removemake --builddir /home/aur -a -S ${aur_pkgs}; then
			break
		fi
	done
}

generate_pkg_licenses_file () {
	for p in $(pacman -Q | cut -d' ' -f1); do
		echo -n $(pacman -Qi "${p}" | grep -E 'Name|Licenses' | cut -d ":" -f 2) >>/pkglicenses.txt
		echo >>/pkglicenses.txt
	done
}

generate_localegen () {
	cat <<EOF > locale.gen
ar_EG.UTF-8 UTF-8
en_US.UTF-8 UTF-8
en_GB.UTF-8 UTF-8
en_CA.UTF-8 UTF-8
en_SG.UTF-8 UTF-8
es_MX.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8
fr_FR.UTF-8 UTF-8
ru_RU.UTF-8 UTF-8
ru_UA.UTF-8 UTF-8
es_ES.UTF-8 UTF-8
de_DE.UTF-8 UTF-8
pt_BR.UTF-8 UTF-8
it_IT.UTF-8 UTF-8
id_ID.UTF-8 UTF-8
ja_JP.UTF-8 UTF-8
bg_BG.UTF-8 UTF-8
pl_PL.UTF-8 UTF-8
da_DK.UTF-8 UTF-8
ko_KR.UTF-8 UTF-8
tr_TR.UTF-8 UTF-8
hu_HU.UTF-8 UTF-8
cs_CZ.UTF-8 UTF-8
bn_IN UTF-8
hi_IN UTF-8
EOF
}

generate_mirrorlist () {
	cat <<EOF > mirrorlist
Server = https://mirror1.sl-chat.ru/archlinux/\$repo/os/\$arch
Server = https://mirror3.sl-chat.ru/archlinux/\$repo/os/\$arch
Server = https://us.mirrors.cicku.me/archlinux/\$repo/os/\$arch
Server = https://mirror.osbeck.com/archlinux/\$repo/os/\$arch
Server = https://md.mirrors.hacktegic.com/archlinux/\$repo/os/\$arch
Server = https://geo.mirror.pkgbuild.com/\$repo/os/\$arch
Server = https://mirror.qctronics.com/archlinux/\$repo/os/\$arch
Server = https://arch.mirror.constant.com/\$repo/os/\$arch
Server = https://america.mirror.pkgbuild.com/\$repo/os/\$arch
Server = https://mirror.tmmworkshop.com/archlinux/\$repo/os/\$arch
EOF
}

cd "${script_dir}" || exit 1

bootstrap="${script_dir}"/root.x86_64

curl -#LO 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
curl -#LO 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

if [ ! -s chaotic-keyring.pkg.tar.zst ] || [ ! -s chaotic-mirrorlist.pkg.tar.zst ]; then
	echo "Seems like Chaotic-AUR keyring or mirrorlist is currently unavailable"
	echo "Please try again later"
	exit 1
fi

bootstrap_urls=("arch.hu.fo" \
		"mirror.cyberbits.eu" \
		"mirror.osbeck.com" \
		"mirror.lcarilla.de" \
		"mirror.moson.org" \
  		"mirror.f4st.host")

echo "Downloading Arch Linux bootstrap"

for link in "${bootstrap_urls[@]}"; do
	curl -#LO "https://${link}/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.zst"
	curl -#LO "https://${link}/archlinux/iso/latest/sha256sums.txt"

	if [ -s sha256sums.txt ]; then
		grep bootstrap-x86_64 sha256sums.txt > sha256.txt

		echo "Verifying the integrity of the bootstrap"
		if sha256sum -c sha256.txt &>/dev/null; then
			bootstrap_is_good=1
			break
		fi
	fi

	echo "Download failed, trying again with different mirror"
done

if [ -z "${bootstrap_is_good}" ]; then
	echo "Bootstrap download failed or its checksum is incorrect"
	exit 1
fi

rm -rf "${bootstrap}"
tar xf archlinux-bootstrap-x86_64.tar.zst
rm archlinux-bootstrap-x86_64.tar.zst sha256sums.txt sha256.txt

mount_chroot

generate_localegen

if command -v reflector 1>/dev/null; then
	echo "Generating mirrorlist..."
	reflector --connection-timeout 10 --download-timeout 10 --protocol https --score 10 --sort rate --save mirrorlist
	reflector_used=1
else
	generate_mirrorlist
fi

rm "${bootstrap}"/etc/locale.gen
mv locale.gen "${bootstrap}"/etc/locale.gen

rm "${bootstrap}"/etc/pacman.d/mirrorlist
mv mirrorlist "${bootstrap}"/etc/pacman.d/mirrorlist

{
	echo
	echo "[multilib]"
	echo "Include = /etc/pacman.d/mirrorlist"
} >> "${bootstrap}"/etc/pacman.conf

run_in_chroot pacman-key --init
echo "keyserver hkps://keyserver.ubuntu.com" >> "${bootstrap}"/etc/pacman.d/gnupg/gpg.conf
run_in_chroot pacman-key --populate archlinux

# Add Chaotic-AUR repo
run_in_chroot pacman-key --recv-key 3056513887B78AEB
run_in_chroot pacman-key --lsign-key 3056513887B78AEB

mv chaotic-keyring.pkg.tar.zst chaotic-mirrorlist.pkg.tar.zst "${bootstrap}"/opt
run_in_chroot pacman --noconfirm -U /opt/chaotic-keyring.pkg.tar.zst /opt/chaotic-mirrorlist.pkg.tar.zst
rm "${bootstrap}"/opt/chaotic-keyring.pkg.tar.zst "${bootstrap}"/opt/chaotic-mirrorlist.pkg.tar.zst

{
	echo
	echo "[chaotic-aur]"
	echo "Include = /etc/pacman.d/chaotic-mirrorlist"
} >> "${bootstrap}"/etc/pacman.conf

# The ParallelDownloads feature of pacman
# Speeds up packages installation, especially when there are many small packages to install
sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 3/g' "${bootstrap}"/etc/pacman.conf

# Do not install unneeded files (man pages and Nvidia firmwares)
sed -i 's/#NoExtract   =/NoExtract   = usr\/lib\/firmware\/nvidia\/\* usr\/share\/man\/\*/' "${bootstrap}"/etc/pacman.conf

run_in_chroot pacman -Sy archlinux-keyring --noconfirm
run_in_chroot pacman -Su --noconfirm

if [ "${enable_alhp_repo}" = "true" ]; then
	if [ "${alhp_feature_level}" -gt 2 ]; then
		alhp_feature_level=3
	else
		alhp_feature_level=2
	fi

	run_in_chroot pacman --noconfirm --needed -S alhp-keyring alhp-mirrorlist
	sed -i "s/#\[multilib\]/#/" "${bootstrap}"/etc/pacman.conf
	sed -i "s/\[core\]/\[core-x86-64-v${alhp_feature_level}\]\nInclude = \/etc\/pacman.d\/alhp-mirrorlist\n\n\[extra-x86-64-v${alhp_feature_level}\]\nInclude = \/etc\/pacman.d\/alhp-mirrorlist\n\n\[core\]/" "${bootstrap}"/etc/pacman.conf
	sed -i "s/\[multilib\]/\[multilib-x86-64-v${alhp_feature_level}\]\nInclude = \/etc\/pacman.d\/alhp-mirrorlist\n\n\[multilib\]/" "${bootstrap}"/etc/pacman.conf
	run_in_chroot pacman -Syu --noconfirm
fi

date -u +"%d-%m-%Y %H:%M (DMY UTC)" > "${bootstrap}"/version

# These packages are required for the self-update feature to work properly
run_in_chroot pacman --noconfirm --needed -S base reflector squashfs-tools fakeroot

# Regenerate the mirrorlist with reflector if reflector was not used before
if [ -z "${reflector_used}" ]; then
	echo "Generating mirrorlist..."
	run_in_chroot reflector --connection-timeout 10 --download-timeout 10 --protocol https --score 10 --sort rate --save /etc/pacman.d/mirrorlist
 	run_in_chroot pacman -Syu --noconfirm
fi

export -f install_packages
run_in_chroot bash -c install_packages

if [ -f "${bootstrap}"/opt/pacman_failed.txt ]; then
	unmount_chroot
	echo "Pacman failed to install some packages"
	exit 1
fi

if [ -n "${aur_packagelist}" ]; then
	run_in_chroot pacman --noconfirm --needed -S base-devel yay
	run_in_chroot useradd -m -G wheel aur
	echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" >> "${bootstrap}"/etc/sudoers

	for p in ${aur_packagelist}; do
		aur_pkgs="${aur_pkgs} aur/${p}"
	done
	export aur_pkgs

	export -f install_aur_packages
	CHROOT_AUR=1 HOME=/home/aur run_in_chroot bash -c install_aur_packages
	mv "${bootstrap}"/home/aur/bad_aur_pkglist.txt "${bootstrap}"/opt
	rm -rf "${bootstrap}"/home/aur
fi

run_in_chroot locale-gen

echo "Generating package info, please wait..."

# Generate a list of installed packages
run_in_chroot pacman -Q > "${bootstrap}"/pkglist.x86_64.txt

# Generate a list of licenses of installed packages
export -f generate_pkg_licenses_file
run_in_chroot bash -c generate_pkg_licenses_file

###################################################
# Try to fix GTK/GDK error messages
# code for Ivan write
cp "${bootstrap}"/usr/lib/gtk-3.0/3.0.0/immodules/im-ibus.so "${bootstrap}"/usr/lib/
cp "${bootstrap}"/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/* "${bootstrap}"/usr/lib/
###################################################

unmount_chroot

# Clear pacman package cache
rm -f "${bootstrap}"/var/cache/pacman/pkg/*

# Create some empty files and directories
# This is needed for bubblewrap to be able to bind real files/dirs to them
# later in the conty-start.sh script
mkdir "${bootstrap}"/media
mkdir "${bootstrap}"/initrd
mkdir -p "${bootstrap}"/usr/share/steam/compatibilitytools.d
touch "${bootstrap}"/etc/asound.conf
touch "${bootstrap}"/etc/localtime
chmod 755 "${bootstrap}"/root

# Enable full font hinting
rm -f "${bootstrap}"/etc/fonts/conf.d/10-hinting-slight.conf
ln -s /usr/share/fontconfig/conf.avail/10-hinting-full.conf "${bootstrap}"/etc/fonts/conf.d

# clear
echo "Done"

if [ -f "${bootstrap}"/opt/bad_pkglist.txt ]; then
	echo
	echo "These packages are not in the repos and have not been installed:"
	cat "${bootstrap}"/opt/bad_pkglist.txt
	rm "${bootstrap}"/opt/bad_pkglist.txt
fi

if [ -f "${bootstrap}"/opt/bad_aur_pkglist.txt ]; then
	echo
	echo "These packages are either not in the AUR or yay failed to download their"
	echo "PKGBUILDs:"
	cat "${bootstrap}"/opt/bad_aur_pkglist.txt
	rm "${bootstrap}"/opt/bad_aur_pkglist.txt
fi
