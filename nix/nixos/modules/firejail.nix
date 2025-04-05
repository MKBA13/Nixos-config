{config,pkgs, ...}:
let
  userPath = "/home/vanger";
in
{
  programs.firejail = {
    enable = true;
    wrappedBinaries = {
      chromium = {
        executable = "${pkgs.chromium}/bin/chromium";
        profile = "${pkgs.firejail}/etc/firejail/chromium.profile";
      };
      vim = {
        executable = "${pkgs.vim}/bin/vim";
        profile = "${pkgs.firejail}/etc/firejail/vim.profile";
        extraArgs = [
          "--whitelist = ${userPath}/.local/share/vim"
          "--whitelist = ${userPath}/.config/vim"
          "--whitelist = ${userPath}/.cache/vim"
          "--whitelist = ${userPath}/.vim"
          "--whitelist = ${userPath}/.vimrc"
          "--whitelist = ${userPath}/.viminfo"
          "--whitelist = ${userPath}/.config/coc"
          "--whitelist = ${userPath}/.config/coc-extension"
          "--whitelist = ${userPath}/.vim/plugged"
        ];
      };
      pgadmin4 = {
        executable = "${pkgs.pgadmin4}/bin/pgadmin4";
        profile = "${pkgs.firejail}/etc/firejail/pgadmin4.profile";
      };
      tor-browser = {
        executable = "${pkgs.tor-browser}/bin/tor-browser";
        profile = "${pkgs.firejail}/etc/firejail/tor-browser.profile";
      };
    };
  };
}
