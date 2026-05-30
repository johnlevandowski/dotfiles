Managing dotfiles
=================

https://stegosaurusdormant.com/bare-git-repo/

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

```
dotgit status
dotgit add $HOME/.config/fish/config.fish
dotgit commit -m "config.fish"
dotgit push origin master
```


Restore dotfiles from git repository
------------------------------------

```
chsh -s $(which fish)
```

Logout and Login for new shell to take effect

```
git clone --separate-git-dir=$HOME/dot.git https://github.com/johnlevandowski/dotfiles.git $HOME/dot.git-tmp
alias dotgit='git --git-dir=$HOME/dot.git/ --work-tree=$HOME'
dotgit restore .
# rsync --recursive --verbose --exclude '.git' $HOME/dot.git-tmp/ $HOME/
source $HOME/.config/fish/config.fish
rm -rf $HOME/dot.git-tmp
dotgit config status.showUntrackedFiles no
```


find what to track
------------------

show only diff files from /etc/skel  
diff -rq $HOME /etc/skel/ | grep -v "^Only in"
