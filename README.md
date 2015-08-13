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

#### ログインシェルの変更
```
// 使用可能なシェルの確認
cat /etc/shells

// ログインシェルの変更
chpass -s /bin/hoge
```

#### oh-my-zsh
zshの設定はoh-my-zshで行っているので必要。

```
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

// すでに.zshrcがある場合はリネームしておく 中身が空ならそのままでも
mv ~/.zshrc ~/.zshrc.orig
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
```

詳しくは[ここ](http://mollifier.hatenablog.com/entry/20101009/p1)を参照

#### font
fontはRictyがいい感じ。
githubから[インストール](https://github.com/yascentur/RictyDiminished)

インストールしたらフォントをPCにインストールして、ターミナルやらitermやらのフォント設定からRictyを選択する。



