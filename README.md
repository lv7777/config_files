# config_files

# included
## configured

* powershell profile
* zshrc(en route)

## not configured


* git
    * gitconfig

* vimrc
* .tmux.conf
* fish.config
# not included

* intelliJ(phpstrom)
* nvim
* nautilus(included gsettings?)
* gsettings?
* eclipse
* VisualStudio
* vscode
* firefox profile
* febe

* google chrome settings
* edge
* PSIDE
* flstudio
   * soundfont/serum|sylenth|vst preset(maybe isolate to sub repo)
* unity 
* bashrc
* QTTabBar
* conemu
* cmder

...etc

### profile.ps1's link create cmd
現在はハードコピーで対応(世代管理できないため)
**下記のスクリプトはユーザーを変更してから実行すること**

 `New-Item -Path "C:\Users\levena\work\config_files_with_up_edition\windows\profile.ps1" -ItemType SymbolicLink -Value "C:\Users\levena\Documents\WindowsPowerShell\profile.ps1"`
