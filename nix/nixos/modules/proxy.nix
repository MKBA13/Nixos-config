{ config, pkgs, ...}:

{
	services = {
		tor = {
			enable = true;
			openFirewall = true;
			client.enable = true;
			client.dns.enable = true;
		};
		privoxy = {
          enable = true;
          enableTor = true;
          settings = {
            forward-socks5t = ".onion localhost:9050 .";
          };
		};
		squid = {
			enable = true;
			extraConfig = ''
              cache_peer 127.0.0.1 parent 8118 0 no-query name=privoxy
              never_direct allow all
              http_access allow all
              forwarded_for off
			'';
		};	
        resolved.enable = true;
      };
#      networking.firewall.allowedTCPPorts = [ 8118 ];
}
