{pkgs, ... }:
{
	networking = {
    	hostName = "nixos";
    	wireless.enable = true;  # Включаем поддержку беспроводных сетей
    	wireless.iwd = {
      	enable = true;  # Включаем iwd
      	settings = {
        	Network = {
          	EnableIPv6 = true;  # Включаем поддержку IPv6
          	RoutePriorityOffset = 300;  # Приоритет маршрута
        };
        Settings = {
          AutoConnect = true;  # Автоматическое подключение к известным сетям
        };
      };
    };
    networkmanager.enable = false;  # Отключаем NetworkManager, если используем iwd
  };
	programs.firejail = {
		enable = true;
		wrappedBinaries = {
			chromium = {
				executable = "${pkgs.chromium}/bin/chromium";
				profile = "${pkgs.firejail}/etc/firejail/chromium.profile";
			};
		};
	};
}
