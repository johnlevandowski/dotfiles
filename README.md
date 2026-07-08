Managing dotfiles
=================

Setup dotfiles git repository
-----------------------------

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
dotgit push -u origin main
```


Dotfiles different from skel
----------------------------

```
diff -rq $HOME /etc/skel/ | grep -v "^Only in"
```


Restore dotfiles from git repository
------------------------------------

```
git clone --separate-git-dir=$HOME/dot.git https://github.com/johnlevandowski/dotfiles.git $HOME/dot.git-tmp
alias dotgit='git --git-dir=$HOME/dot.git/ --work-tree=$HOME'
dotgit config status.showUntrackedFiles no
dotgit status
dotgit diff
cd
dotgit restore .
rm -rf $HOME/dot.git-tmp
```


Enable backup timer/service/script
----------------------------------

```
systemctl --user daemon-reload
ls $HOME/.config/mozilla/firefox/
micro $HOME/.local/bin/dev.johnl.backup.sh
```

Update script with *.default-release directory

```
systemctl --user enable --now dev.johnl.backup.timer
```


Enable Restart to Windows - Making efibootmgr usable without sudo password
--------------------------------------------------------------------------

```
echo "%wheel ALL=(root) NOPASSWD: /usr/sbin/efibootmgr" | sudo tee /etc/sudoers.d/efibootmgr-config
```


Wallpaper Images
----------------

```
cp 1440x2560.jpg $HOME/.local/share/wallpapers/devjohnl/contents/images/
cp 2560x1440.jpg $HOME/.local/share/wallpapers/devjohnl/contents/images/
```
