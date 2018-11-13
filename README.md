# dotfiles
A summary of my personal environment config! :slightly_smiling_face:

## Visual Studio Code
Download [link](https://code.visualstudio.com/download).

### Current preferences
```json
{
    "workbench.iconTheme": "vscode-great-icons",
    "terminal.integrated.shell.osx": "zsh",
    "editor.rulers": [ 100 ],
    "editor.detectIndentation": true,
    "editor.lineHeight": 24,
    "editor.renderWhitespace": "all",
    "workbench.colorCustomizations": {
        "editorLineNumber.activeForeground": "#FFF"
    },
    "ruby.codeCompletion": "rcodetools",
    "ruby.intellisense": "rubyLocate",
    "breadcrumbs.enabled": true,
    "editor.fontFamily": "Menlo, Monaco, 'Courier New', monospace",
    "search.showLineNumbers": true,
    "workbench.editor.highlightModifiedTabs": true,
    "breadcrumbs.symbolSortOrder": "name"
}
```
- `"terminal.integrated.fontFamily": "Meslo LG M for Powerline"` when using ZSH, Agnoster and Meslo LG M for Powerline fonts.

### Extensions
- [EditorConfig](https://github.com/editorconfig/editorconfig-vscode)
- [Git Blame](https://github.com/Sertion/vscode-gitblame)
- [Rainbow Brackets](https://marketplace.visualstudio.com/items?itemName=2gua.rainbow-brackets)
- [VSCode Great Icons](https://github.com/EmmanuelBeziat/vscode-great-icons)
- [Beautify](https://github.com/HookyQR/VSCodeBeautify)
- [DotENV](https://github.com/mikestead/vscode-dotenv)
- [API Elements extension](https://github.com/XVincentX/vscode-apielements)
- [vscode-proto3](https://marketplace.visualstudio.com/items?itemName=zxh404.vscode-proto3)

And others language extensions depending on what language I am working with at the moment!

## iTerm2
Import `./iTerm2` in iTerm2 preferences in `General -> Preferences -> Load preferences from a custom folder or URL`.

### Colors
Import colors with:
```sh
$ open ./iTerm2/colors.itermcolors
```

### Theme
Currently using **oh-my-zsh** `xxf` theme. Download it from [here](https://gist.github.com/xfanwu/18fd7c24360c68bab884) and move to `~/.oh-my-zsh/themes/`

If `ls` colors are not showing:
```
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1
```

## Coming :soon:
- `./install.sh`
