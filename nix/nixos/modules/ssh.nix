{
  programs.ssh.extraConfig = "
    Host github.com
      HostName github.com
      User git
      IdentityFile ~/.ssh/git_key
      IdentitiesOnly yes
  ";
}
