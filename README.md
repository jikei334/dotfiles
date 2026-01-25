# dotfiles
neovimとzshの設定ファイル

Copilotは競プロで邪魔なのでデフォルトでは無効

有効にするにはNeovim内で以下を実行
```vim
:Copilot enable
```

## 対応言語
- Rust
- C#
- Python

## Docker環境の使い方(Podman)
dockerディレクトリに移動しておく

### ビルド
```bash
podman build -t devenv:ubuntu26 . 
```

### 実行
```bash
podman run --rm -it --userns=keep-id　-v ..:/home/ubuntu/.config -p 7777:7777 -e ZDOTDIR=/home/ubuntu/.config/zsh devenv:ubuntu26
```
