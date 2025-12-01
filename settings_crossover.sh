# shellcheck shell=bash disable=2034

# Packages to install
# You can add packages that you want and remove packages that you don't need
# Apart from packages from the official Arch repos, you can also specify
# packages from the Chaotic-AUR repo
PACKAGES=(
    # 音频相关依赖（为 CrossOver 提供音频支持）
    alsa-lib                 lib32-alsa-lib              # ALSA 音频库及其 32 位版本，提供基础音频输出
    libpulse                 lib32-libpulse              # PulseAudio 音频支持及其 32 位版本，兼容现代音频系统
    gst-plugins-base         lib32-gst-plugins-base      # GStreamer 基础插件及其 32 位版本，用于多媒体处理
    gst-plugins-good         lib32-gst-plugins-good      # GStreamer 高级插件及其 32 位版本，扩展多媒体功能
    gst-plugins-base-libs    lib32-gst-plugins-base-libs # GStreamer 基础库及其 32 位版本，提供多媒体支持
    gstreamer                lib32-gstreamer             # GStreamer 核心框架及其 32 位版本
    gst-plugins-ugly                                     # GStreamer 额外插件，增强多媒体格式支持
    gst-libav                                            # GStreamer FFmpeg 插件，支持额外音视频格式
    mpg123                   lib32-mpg123                # MP3 解码库及其 32 位版本
    openal                   lib32-openal                # OpenAL 音频库及其 32 位版本，支持 3D 音频
    gsm                                                  # GSM 音频编解码，支持音频压缩

    # 核心依赖（CrossOver 运行必需的基础库）
    glibc                    lib32-glibc                 # GNU C 库及其 32 位版本，核心运行时
    lib32-gcc-libs                                       # 32 位 GCC 库，提供运行时支持
    freetype2                lib32-freetype2             # 字体渲染库及其 32 位版本，支持文本显示
    fontconfig               lib32-fontconfig            # 字体配置库及其 32 位版本，用于字体管理
    glu                      lib32-glu                   # OpenGL 实用库及其 32 位版本，支持图形渲染
    lcms2                    lib32-lcms2                 # 色彩管理库及其 32 位版本，用于颜色校准
    gnutls                   lib32-gnutls                # 加密网络库及其 32 位版本，支持安全通信
    zlib                     lib32-zlib                  # 压缩库及其 32 位版本，用于数据压缩
    libgphoto2                                       # 相机支持库，用于数码相机访问
    v4l-utils                lib32-v4l-utils             # 视频捕捉支持库及其 32 位版本，用于视频设备
    libxcomposite            lib32-libxcomposite         # X11 合成扩展库及其 32 位版本，支持窗口合成
    libxinerama              lib32-libxinerama           # X11 多显示器扩展库及其 32 位版本
    libxxf86vm               lib32-libxxf86vm            # X11 视频模式扩展库及其 32 位版本，用于显示调整
    libxft                   lib32-libxft                # X11 字体渲染库及其 32 位版本，增强字体显示
    libxrandr                lib32-libxrandr             # X11 屏幕分辨率调整库及其 32 位版本
    libx11                   lib32-libx11                # X11 核心库及其 32 位版本，提供窗口系统支持
    libxcursor               lib32-libxcursor            # X11 光标管理库及其 32 位版本
    libxext                  lib32-libxext               # X11 扩展库及其 32 位版本
    libxi                    lib32-libxi                 # X11 输入设备扩展库及其 32 位版本
    libice                   lib32-libice                # X11 ICE 库及其 32 位版本，支持会话管理
    libsm                    lib32-libsm                 # X11 状态管理库及其 32 位版本
    libpng                   lib32-libpng                # PNG 图像处理库及其 32 位版本
    openssl                                              # 加密库，提供 SSL/TLS 支持
    libgpg-error             lib32-libgpg-error          # GPG 错误处理库及其 32 位版本，支持加密
    libjpeg-turbo            lib32-libjpeg-turbo         # JPEG 图像处理库及其 32 位版本
    libgcrypt                lib32-libgcrypt             # 加密库及其 32 位版本，增强安全功能
    ncurses                  lib32-ncurses               # 终端界面库及其 32 位版本，支持控制台应用
    libxcrypt-compat         lib32-libxcrypt-compat      # 加密兼容库及其 32 位版本
    sqlite                   lib32-sqlite                # 轻量级数据库库及其 32 位版本，支持数据库功能
    sdl2-compat              lib32-sdl2-compat           # SDL2 兼容库及其 32 位版本，支持多媒体和游戏
    vkd3d                    lib32-vkd3d                 # Direct3D 12 到 Vulkan 转换库及其 32 位版本
    xorg-xwayland            lib32-wayland               # XWayland 及 32 位 Wayland 库，提供 X11 和 Wayland 兼容性
    xorgproto                                            # X11 协议定义头文件，支持 X11 开发

    # 视频相关依赖（提供图形和硬件加速支持）
    mesa                     lib32-mesa                  # 开源 OpenGL 实现及其 32 位版本，支持 3D 渲染
    libglvnd                 lib32-libglvnd              # OpenGL 供应商中立库及其 32 位版本
    vulkan-icd-loader        lib32-vulkan-icd-loader     # Vulkan 驱动加载器及其 32 位版本，支持 Vulkan API
    vulkan-radeon            lib32-vulkan-radeon         # AMD GPU Vulkan 驱动及其 32 位版本，优化 AMD 图形
    vulkan-intel             lib32-vulkan-intel          # Intel GPU Vulkan 驱动及其 32 位版本，优化 Intel 图形
    libva-intel-driver       lib32-libva-intel-driver    # Intel VAAPI 硬件加速驱动及其 32 位版本，优化视频解码
    intel-media-driver                               # Intel 现代 GPU 媒体驱动，增强 VAAPI 性能
    libva                    lib32-libva                 # VAAPI 视频加速库及其 32 位版本
    mesa-utils                                           # Mesa 调试工具（如 glxinfo），用于图形环境测试
    vulkan-tools                                         # Vulkan 调试工具（如 vkcube），用于 Vulkan 测试
    ocl-icd                  lib32-ocl-icd               # OpenCL 驱动加载器及其 32 位版本，支持 OpenCL 计算

    # 网络服务（可选）
    nss-mdns                                             # 多播 DNS 解析，支持本地网络服务发现
    nss                                                  # 网络安全服务库，支持 SSL/TLS
    libnm                    lib32-libnm                 # NetworkManager 库及其 32 位版本，支持网络管理

    # 可选依赖（提供打印、GUI、输入法等额外功能）
    libcups                  lib32-libcups               # 打印支持库及其 32 位版本，支持打印功能
    libxml2                  lib32-libxml2               # XML 解析库及其 32 位版本，用于 XML 数据处理
    libxslt                  lib32-libxslt               # XSLT 转换库及其 32 位版本，用于 XML 转换
    gtk3                     lib32-gtk3                  # GTK3 图形界面库及其 32 位版本，支持 GUI 应用
    python                   python-gobject              # Python 解释器及 GObject 绑定，用于 Python GUI
    python-cairo                                     # Python Cairo 库，支持图形绘制
    vte3                                                 # 终端仿真器库，支持终端界面
    sane                                                 # 扫描仪支持库，支持扫描设备
    pcsclite                 lib32-pcsclite              # 智能卡支持库及其 32 位版本，支持读卡器
    libpcap                  lib32-libpcap               # 网络数据包捕获库及其 32 位版本，支持网络调试
    unixodbc                                             # ODBC 数据库连接库，支持数据库访问
    desktop-file-utils                                   # 桌面文件工具，处理 .desktop 文件
    unzip                                                # 解压缩工具，支持 ZIP 文件处理
    libexif                                              # EXIF 元数据处理库，支持相机元数据
    libldap                  lib32-libldap               # LDAP 库及其 32 位版本，支持目录服务
    libcap                                               # POSIX 权限管理库，支持权限控制
    polkit                                               # 权限管理框架，支持权限验证
    ibus                                                 # 输入法框架，支持中文等语言输入
    dbus                     lib32-dbus                  # D-Bus 通信库及其 32 位版本，支持进程间通信

    # 字体和界面（增强 GUI 和文字显示）
    adwaita-icon-theme                                   # Adwaita 图标主题，优化 GTK 应用界面
    wqy-zenhei                                           # 文泉驿正黑字体，支持中文显示
    wqy-microhei                                         # 文泉驿微米黑字体，支持中文显示
    noto-fonts-emoji                                     # Noto 表情符号字体，支持表情符号显示
    gnome-themes-extra                                   # GNOME 额外主题，增强 GTK 界面
    ttf-dejavu                                           # DejaVu 字体，支持多语言文本显示

    # 浏览器（支持 WebView 和浏览器相关应用）
    chromium                                             # Chromium 浏览器，支持 WebView 和浏览器相关功能

    # 桌面工具（提供终端和文件管理）
    lxterminal                                           # 轻量级终端模拟器，支持终端操作
    pcmanfm                                              # 轻量级文件管理器，管理 CrossOver 相关文件
    xdg-utils

    # 构建工具（支持 Conty 和 AUR 包构建）
    base-devel                                           # 基础开发工具集，用于编译 AUR 包
    git                                                  # 版本控制工具，用于拉取 AUR 源码
    yay                                                  # AUR 助手，简化 AUR 包安装
    tar                                                  # 归档工具，处理源码包
    gcc                                                  # GNU 编译器集合，支持代码编译
    xorg-util-macros                                     # X11 开发工具宏，支持 X11 相关包构建
)

# If you want to install AUR packages, specify them in this variable
AUR_PACKAGES=(crossover lib32-nss-mdns lib32-libexif lib32-libxxf86dga libcapi)

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
