#!/usr/bin/env bash

# 在orbstack linux machine中使用code命令直接在vscode中打开工作空间

dir="$(realpath "${1:-$(pwd)}")"
echo "Opening $dir in VSCode..."
exec mac code --folder-uri "vscode-remote://ssh-remote+$(whoami)@$(hostname)@orb$dir"

