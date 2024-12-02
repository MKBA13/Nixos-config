{ config, pkgs, ...}:

{
	services = {
		tor = {
			enable = true;
			openFirewall = true;
			client.enable = true;
			client.dns.enable = true;
			settings.DNSPort = [{
				addr = "127.0.0.1";
				port = 53;
			}];
		};
		resolved = {
			enable = true;
			fallbackDns = [ ""];
		};
		privoxy = {
			enable = true;
		};
		squid = {
			enable = true;
			extraConfig = ''
			cache_peer 127.0.0.1 parent 8118 7 no-query default no-digest no-netdb-exchange
			acl ftp proto FTP
			always_direct allow ftp
			shutdown_lifetime 0
			httpd_suppress_version_string on
			forwarded_for off
			never_direct allow all
			'';
		};	
	};
}
