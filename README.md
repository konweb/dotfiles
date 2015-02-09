## Dotfileを管理

#### 初めはclone
```
git clone https://github.com/konweb/dotfiles
```

#### 最新版に更新
```
git pull origin master
```

#### シェルの反映して
```
sh dotfilesLink.sh
```

#### 変更を反映させる
```
// bashの場合
source ~/.bash_profile

//zshの場合
source ~/.zshrc
```

#### シェルの変更
```
// 起動しているのシェルを確認
ps

// シェルの終了
exit

// シェルの起動
zsh {or} bash
```