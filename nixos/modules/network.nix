{pkgs, ... }:
{
	networking = {
		nameservers = ["127.0.0.1"];
		hostName = "nixos";
		wireless.iwd = {
			enable = true;
			settings = {
				Network = {
					EnableIPv6 = true;
					RoutePriorityOffset = 300;
				};
				Settings = {
					AutoConnect = true;
				};
			};
		};
		networkmanager = {
			enable = false;
		};
	};
/*	programs.firejail = {
		enable = true;
		wrappedBinaries = {
			chromium = {
				executable = "${pkgs.chromium}/bin/chromium";
				profile = "${pkgs.firejail}/etc/firejail/chromium.profile";
			};
		};
	};*/
}
