{pkgs, ...}:
{
  networking.nat.enable = true;
  networking.nat.externalInterface = "wlan0";
  networking.nat.internalInterfaces = [ "wg0" ];
  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
    allowPing = true;

      interfaces = {
      "wg0" = {
        allowedTCPPorts = [ 5432 ];   # Разрешить TCP на порт PostgreSQL
        allowedUDPPorts = [ ];   # Разрешить UDP (если нужно что-то еще кроме WG)
      };
    };
  };

  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.100.0.1/24" ];
      listenPort = 51820;
      postSetup = ''
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o wlan0 -j MASQUERADE
      '';
      postShutdown = ''
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o wlan0 -j MASQUERADE
      '';

      privateKeyFile = "/root/wireguard-keys/private";

      peers = [
        {
          publicKey = "nqEILtWa9JfjpPcJaStVkP3WvAlTpbmfRtz9lnF1eg0=";
          allowedIPs = [ "10.100.0.2/32" ];
        }
        {
          publicKey = "AnAabeCDGE45exSV1aTbKAXOSBy8DKrgP7PsRoGJYT0=";
          allowedIPs = [ "10.100.0.3/32" ];
        }
      ];
    };
  };
}
