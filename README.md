# Dotfiles backup

To be used with [homeshick](https://github.com/andsens/homeshick)

### setup

```sh
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh
homeshick --batch clone git@github.com:username/dotfiles
homeshick link
echo "source ~/dotfiles/.bash_mysources" >> ~/.bashrc
source ~/.bashrc
```
