{
	disco.devices = {
		disk = {
			main = {
				device = "/dev/sda";
				type = "disk";
				partitions = {
					boot = {
						size = "1M";
						type = "EF02";
					};
				swap = {
					size = "16G";
					content = {
						type = "swap";
						resumeDevice = "true";
					};
				};
				root = {
					size = "100%";
					content = {
						type = "filesystem";
						format = "btrfs";
						mountpoint = "/";
						};
					};
				};
			};
		};
	};
		
}
