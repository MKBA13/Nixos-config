
{
	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;
		systemd.enable = true;
		
		settings = {
			"$mainMod" = "SUPER";

			monitor = ",1920x1080@60,auto,1";

			env = [
				"XDG_CURRENT_DESKTOP,Hyprland"
				"XDG_SESSION_TYPE,wayland"
				"XDG_SESSION_DESSKTOP,Hyprland"
			];

			input = {
				kb_layout = "us,ru";
				kb_variant = "lang";
				kb_options = "grp:alt_shift_toggle";

				follow_mouse = 1;
			};


			bind = [

				"$mainMod, Return, exec, alacritty"
				"$mainMod, Q, killactive"
				"$mainMod, R, exit"
				"$mainMod, space, exec, dmenu_run"
				"$mainMod, M, fullscreen"
		
				"$mainMod, H, movefocus, l"
				"$mainMod, L, movefocus, r"
				"$mainMod, K, movefocus, u"
				"$mainMod, J, movefocus, d"

				"$mainMod SHIFT, H, swapwindow, l" 
				"$mainMod SHIFT, L, swapwindow, r" 
				"$mainMod SHIFT, K, swapwindow, u" 
				"$mainMod SHIFT, J, swapwindow, d" 

				"$mainMod CTRL, H, resizeactive, -60 0"
				"$mainMod CTRL, L, resizeactive, 60 0"
				"$mainMod CTRL, K, resizeactive, 0 -60"
				"$mainMod CTRL, J, resizeactive, 0 60"
	
				"$mainMod, 1, workspace, 1"
				"$mainMod, 2, workspace, 2"
				"$mainMod, 3, workspace, 3"
				"$mainMod, 4, workspace, 4"
				"$mainMod, 5, workspace, 5"

		#		"mainMod SHIFT, 1, movetoworkspacesilent, 1"
		#		"mainMod SHIFT, 2, movetoworkspacesilent, 2"
		#		"mainMod SHIFT, 3, movetoworkspacesilent, 3"
		#		"mainMod SHIFT, 4, movetoworkspacesilent, 4"
		#		"mainMod SHIFT, 5, movetoworkspacesilent, 5"
			];
		};
	};
}
