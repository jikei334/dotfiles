# dotfiles
neovimとzshの設定ファイル

## Docker環境の使い方(Podman)
dockerディレクトリに移動しておく

### ビルド
```bash
podman build -t devenv:ubuntu26 . 
```

### 実行
```bash
podman run --rm -it --userns=keep-id　-v ..:/home/ubuntu/.config -e ZDOTDIR=/home/ubuntu/.config/zsh devenv:ubuntu26
```
