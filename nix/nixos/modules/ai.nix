{pkgs, ...}:
{
  systemd.services.ollama = {
    enable = true;
    wantedBy = [ "multi-user.target" ];
    
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.ollama}/bin/ollama serve";
      User = "ff";
      Group = "ollama";
      WorkingDirectory = "/home/ff";
      Environment = [
        "OLLAMA_HOST=0.0.0.0:11434"  # Меняем на TCP-порт
        "OLLAMA_MODELS_PATH=/home/ff/models"
      ];
      RuntimeDirectory = "ollama";
      Restart = "on-failure";
    };
  };

  systemd.tmpfiles.rules = [
    "d /home/ff/models 0750 ff ollama -"
    "d /home/ff/tmp 0750 ff ollama -"
  ];

  environment.systemPackages = [ pkgs.ollama ];

  # Открываем порт для доступа
  networking.firewall.allowedTCPPorts = [ 11434 ];
}
