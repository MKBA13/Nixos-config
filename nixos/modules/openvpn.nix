	let
		StudyPath = "/home/vanger/openvpn";
	in {
		services.openvpn.servers = {
			studyVPN = {
				autoStart = false;
				config = ''
				client
				dev tun
				proto udp
				remote ovpn.rvaylab.ru 1195
				resolv-retry infinite
				bind
				user nobody
				group nogroup
				persist-key
				persist-tun
				ca ${StudyPath}/ca.crt
				cert ${StudyPath}/u-m-havanov.crt
				key ${StudyPath}/u-m-havanov.key
				auth-user-pass ${StudyPath}/authentication.txt
				remote-cert-tls server
				verb 3
				tls-auth ${StudyPath}/ta.key 1
				cipher AES-256-CBC
				auth SHA256
				script-security 2
				'';
				authUserPass.username = "u-m-havanov";
				authUserPass.password = "46ctb0KP";
			};
		};
	}

