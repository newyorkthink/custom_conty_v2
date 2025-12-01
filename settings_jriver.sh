# shellcheck shell=bash disable=2034

# Packages to install
# You can add packages that you want and remove packages that you don't need
# Apart from packages from the official Arch repos, you can also specify
# packages from the Chaotic-AUR repo
PACKAGES=(
    # Audio - 核心音频库和高质量音频支持
    vorbis-tools alsa-lib alsa-plugins alsa-utils alsa-firmware
    pulseaudio-alsa pipewire-alsa gstreamer gst-plugins-base 
    gst-plugins-base-libs gst-plugins-good gst-plugins-ugly 
    gst-libav gst-plugins-bad libpulse
    opus libtheora libvorbis flac faac faad2 wavpack
    musepack-tools lame libcue libsndfile libsamplerate
    libsoxr speex

    # Core System and Utilities
    ca-certificates gcc-libs gtk3 libx11
    libxau libxcb libxdmcp libxext
    util-linux base-devel libepoxy bash
    dash librsvg adwaita-icon-theme pcre
    perl freetype2 wqy-zenhei wqy-microhei 
    bluez libcurl-compat gnutls curl noto-fonts-emoji
    xorg-fonts-100dpi xorg-fonts-75dpi ttf-dejavu
    binutils nickle lcms2 yay
    fcitx5 file bzip2 colord
    cups coreutils libsecret git
    dbus-glib libappindicator-gtk3 openssl python
    sqlite avahi # JRiver 数据库和网络发现支持
    
    # Video - 保持原有视频支持
    mesa vulkan-radeon vulkan-intel vulkan-icd-loader
    libva libvdpau libva-intel-driver intel-media-driver
    dav1d aom x265 libvpx ffmpeg vulkan-mesa-layers
    vulkan-tools libva-utils mesa-utils
    
    # Image and Thumbnail Support - JRiver 缩略图和图像处理
    libjpeg-turbo libpng libtiff libwebp
    libheif libavif libraw exiv2 imagemagick
    
    # Desktop and GUI
    qt5-base qt5-svg qt5-declarative gnome-themes-extra
    webkit2gtk webkit2gtk-4.1 ibus mousepad
    evince thunar thunar-archive-plugin thunar-media-tags-plugin
    thunar-volman nss nss-mdns playerctl
    harfbuzz fontconfig fribidi xdg-utils feh
    chromium xfce4-terminal rxvt-unicode xterm
)

# If you want to install AUR packages, specify them in this variable
AUR_PACKAGES=(jriver-media-center)

# ALHP is a repository containing packages from the official Arch Linux
# repos recompiled with -O3, LTO and optimizations for modern CPUs for
# better performance
#
# When this repository is enabled, most of the packages from the official
# Arch Linux repos will be replaced with their optimized versions from ALHP
#
# Set this variable to any value if you want to enable this repository
ENABLE_ALHP_REPO=

# Feature levels for ALHP. Available feature levels are 2 and 3
# For level 2 you need a CPU with SSE4.2 instructions
# For level 3 you need a CPU with AVX2 instructions
ALHP_FEATURE_LEVEL=2

# Locales to configure in the image
LOCALES=(
	'ar_EG.UTF-8 UTF-8'
	'en_US.UTF-8 UTF-8'
	'en_GB.UTF-8 UTF-8'
	'en_CA.UTF-8 UTF-8'
	'en_SG.UTF-8 UTF-8'
	'es_MX.UTF-8 UTF-8'
	'zh_CN.UTF-8 UTF-8'
	'fr_FR.UTF-8 UTF-8'
	'ru_RU.UTF-8 UTF-8'
	'ru_UA.UTF-8 UTF-8'
	'es_ES.UTF-8 UTF-8'
	'de_DE.UTF-8 UTF-8'
	'pt_BR.UTF-8 UTF-8'
	'it_IT.UTF-8 UTF-8'
	'id_ID.UTF-8 UTF-8'
	'ja_JP.UTF-8 UTF-8'
	'bg_BG.UTF-8 UTF-8'
	'pl_PL.UTF-8 UTF-8'
	'da_DK.UTF-8 UTF-8'
	'ko_KR.UTF-8 UTF-8'
	'tr_TR.UTF-8 UTF-8'
	'hu_HU.UTF-8 UTF-8'
	'cs_CZ.UTF-8 UTF-8'
	'bn_IN UTF-8'
	'hi_IN UTF-8'
)

# Content of pacman mirrorrlist file before reflector is installed and used to fetch new one
# shellcheck disable=2016
MIRRORLIST='
Server = https://mirror1.sl-chat.ru/archlinux/$repo/os/$arch
Server = https://mirror3.sl-chat.ru/archlinux/$repo/os/$arch
Server = https://us.mirrors.cicku.me/archlinux/$repo/os/$arch
Server = https://mirror.osbeck.com/archlinux/$repo/os/$arch
Server = https://md.mirrors.hacktegic.com/archlinux/$repo/os/$arch
Server = https://geo.mirror.pkgbuild.com/$repo/os/$arch
Server = https://mirror.qctronics.com/archlinux/$repo/os/$arch
Server = https://arch.mirror.constant.com/$repo/os/$arch
Server = https://america.mirror.pkgbuild.com/$repo/os/$arch
Server = https://mirror.tmmworkshop.com/archlinux/$repo/os/$arch
'

# Enable this variable to use the system-wide mksquashfs/mkdwarfs instead
# of those provided by the Conty project
USE_SYS_UTILS=0

# Supported compression algorithms: lz4, zstd, gzip, xz, lzo
# These are the algorithms supported by the integrated squashfuse
# However, your squashfs-tools (mksquashfs) may not support some of them
SQUASHFS_COMPRESSOR="zstd"
SQUASHFS_COMPRESSOR_ARGUMENTS=(-b 1M -comp "${SQUASHFS_COMPRESSOR}" -Xcompression-level 19)

# Uncomment these variables if your mksquashfs does not support zstd or
# if you want faster compression/decompression (at the cost of compression ratio)
#SQUASHFS_COMPRESSOR="lz4"
#SQUASHFS_COMPRESSOR_ARGUMENTS=(-b 256K -comp "${SQUASHFS_COMPRESSOR}" -Xhc)

# Set to any value to Use DwarFS instead of SquashFS
USE_DWARFS=
DWARFS_COMPRESSOR_ARGUMENTS=(
	-l7 -C zstd:level=19 --metadata-compression null
	-S 22 -B 1 --order nilsimsa
	-W 12 -w 4 --no-history-timestamps --no-create-timestamp
)


# List of links to arch bootstrap archive
# Conty will try to download each one of them sequentially
BOOTSTRAP_DOWNLOAD_URLS=(
	'https://arch.hu.fo/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.zst'
	'https://mirror.cyberbits.eu/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.zst'
	'https://mirror.osbeck.com/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.zst'
	'https://mirror.lcarilla.de/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.zst'
	'https://mirror.moson.org/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.zst'
	'https://mirror.f4st.host/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.zst'
)

# sha256sums.txt file to verify downloaded bootstrap archive with
BOOTSTRAP_SHA256SUM_FILE_URL='https://archlinux.org/iso/latest/sha256sums.txt'

# Set to any value to use an existing image if it exists
# Otherwise the script will always create a new image
USE_EXISTING_IMAGE=
