{pkgs, ...}: {
	nixpkgs.config = {
		allowUnfree = true;
	};
	environment.systemPackages = with pkgs; [
		git
		curl
		wget
			
		wayland
		xwayland
		wlroots
		hyprland
		alacritty
		dmenu
		
		pulseaudio
		pavucontrol

		feh

		vim
		ranger
		btop
		home-manager

		chromium
		wpsoffice
		onlyoffice-bin

		iwd
		iw

		linuxHeaders
		linuxKernel.packages.linux_zen.system76
		linuxKernel.packages.linux_zen.rtl88xxau-aircrack
		linux-firmware

		android-studio

		neofetch
		simplescreenrecorder
		obs-studio

		kdePackages.dolphin

		nodejs

		p7zip
		openvpn
		pgadmin4-desktopmode

		python3
		notepadqq

		qt5.full
  		qtcreator
  		gcc
 		gdb
  		cmake
		gnumake

		firejail
#		vivaldi
	];

	fonts.packages = with pkgs; [
			jetbrains-mono
			vistafonts
			corefonts
	];
}
