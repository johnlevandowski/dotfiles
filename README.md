Managing dotfiles
=================

Setup dotfiles git repository
-----------------------------

```
chsh -s $(which fish)
```

Logout and Login for new shell to take effect

```
nano $HOME/.config/fish/config.fish
```

```
alias dotgit='git --git-dir=$HOME/dot.git/ --work-tree=$HOME'
```

```
source $HOME/.config/fish/config.fish
git init --bare --initial-branch=main $HOME/dot.git
dotgit config status.showUntrackedFiles no
gh repo create
dotgit remote add origin https://github.com/johnlevandowski/dotfiles.git
```


Add dotfiles to git repository
------------------------------

```
dotgit status
dotgit add $HOME/.config/fish/config.fish
dotgit commit -m "config.fish"
git push -u origin main
```


Restore dotfiles from git repository
------------------------------------

```
chsh -s $(which fish)
git clone --separate-git-dir=$HOME/dot.git https://github.com/johnlevandowski/dotfiles.git $HOME/dot.git-tmp
alias dotgit='git --git-dir=$HOME/dot.git/ --work-tree=$HOME'
dotgit config status.showUntrackedFiles no
dotgit status
dotgit diff
dotgit restore .
rm -rf $HOME/dot.git-tmp
```

Logout and Login for new dotfiles to take effect


Dotfiles different from skel
----------------------------

```
diff -rq $HOME /etc/skel/ | grep -v "^Only in"
```
