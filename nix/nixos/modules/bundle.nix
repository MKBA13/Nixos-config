{config, pkgs, ...}:
{
  imports = [
    ./sudo.nix
	./hyprland.nix
	./sound.nix
	./firejail.nix
	./network.nix
    ./kernel.nix
#    ./proxy.nix
    ./postgresql.nix
    ./ai.nix
    ./docker.nix
    ./ssh.nix
    ./wireguard.nix
  ];
}
