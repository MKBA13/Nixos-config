{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
#    permittedInsecurePackages = [
 #               "squid-6.10"
 #   ];
  };
  environment.systemPackages = with pkgs; [

		git
		curl
        wget
        bat
			
		wayland
		xwayland
		wlroots
        hyprland
        xdg-desktop-portal-hyprland
		alacritty
        dmenu
        swww
		
		pipewire
		pavucontrol

        feh
		vim
		ranger
		btop
		home-manager

        chromium

        libreoffice
        wpsoffice-cn

		iwd
        iw

#        tor
#        privoxy
#        squid
        tor-browser
        obfs4
        wireguard-tools
        tcpdump
#        firefox

		linux-firmware
		linuxKernel.packages.linux_xanmod.system76
		linuxKernel.packages.linux_xanmod.rtl88xxau-aircrack

		android-studio

		neofetch
		simplescreenrecorder
		obs-studio

		kdePackages.dolphin

		nodejs

		p7zip
		openvpn
        pgadmin4-desktopmode

        postgresql
        postgresql16Packages.pgtap
        python311Full
        python311Packages.pq

		python3Full
		notepadqq

        qt5.full
        libsForQt5.qt5.qtbase
        libsForQt5.qt3d
  		qtcreator
  		gcc
        gdb
        clang
        lldb
        clang-tools
  		cmake
        gnumake

        wine
        wineWowPackages.waylandFull

		firejail
		
		ollama
        open-webui

        obsidian

        radeontop
        radeontools
        radeon-profile

        rocmPackages.rocm-thunk

        telegram-desktop
        tg

        testdisk-qt
    ];

	fonts.packages = with pkgs; [
			jetbrains-mono
			vistafonts
			corefonts
	];
}
