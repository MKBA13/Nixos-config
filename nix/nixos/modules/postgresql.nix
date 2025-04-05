{pkgs,...}:
let
  pgProcessFile = pkgs.callPackage ./extension {}; # Создаем пакет
in
{
  config.services.postgresql = {
    enable = true;
    ensureDatabases = [ "mydatabase" "task_manager"];
    extensions = [ pgProcessFile ];
    settings.shared_preload_libraries = ["pg_processfile"];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
      # IPv4 localhost
      host    all             postgres          127.0.0.1/32             trust
      host    task_manager    app_user          10.100.0.2/32            md5
      host    task_manager    admin_user        10.100.0.3/32            md5
      host    task_manager    app_user          192.168.50.1/32             md5
      host    task_manager    admin_user          192.168.50.1/32             md5
      host    all             postgres          ::1/128                 trust
      # IPv6 localhost
    '';
    settings.port = 5432;
    enableTCPIP = true;
  };
}
