{config,pkgs,...}:
{
	hardware.system76.enableAll = true; # удалить, если не компьютер system76
	boot.extraModulePackages = with config.boot.kernelPackages; [
    #   linux-firmware
  		rtl88xxau-aircrack
	];
}
