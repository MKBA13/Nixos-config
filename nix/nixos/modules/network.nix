{
	networking = {
      hostName = "nixos";
      firewall.enable = true;
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
}
	
