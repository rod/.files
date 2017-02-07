# dotfiles

> *my* dotfiles for quick, painless machine setups

## setup

```bash
git clone git@github.com:rod/dotfiles.git ~/dotfiles && cd dotfiles && source boot.sh
```

## overview

### batteries included 🔋

these install automagically via `boot.sh`

- `.aliases`
- `.bash_profile`
- `.bash_prompt`
- `.bashrc`
- `.editorconfig`
- `.exports`
- `.functions`
- `.git`
- `.gitconfig`
- `.gitignore`
- `.hyper.js` - hyper terminal
- `.inputrc` - behavior of the actual prompt line

### some assembly required 🔧

these have to be run manually

- `.macos` - os defaults
- `apm.sh` - atom packages
- `boot.sh` - install all the things 🎉
- `brew.sh` & `brew-cask.sh` - homebrew 🍻
