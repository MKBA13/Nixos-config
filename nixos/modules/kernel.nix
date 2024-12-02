{config,pkgs,...}:{
hardware.system76.enableAll = true;
boot.extraModulePackages = with config.boot.kernelPackages; [
#		linux-firmware
		rtl88xxau-aircrack
	];
}
