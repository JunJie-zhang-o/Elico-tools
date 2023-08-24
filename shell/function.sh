
# 查询指定的端口号
findportfunction() {
#  echo "elibot" | sudo -S  netstat -alp | grep $1
    netstat -alp | grep $1
}

# 每1s持续监控文件变化,并高亮显示不同的内容
eliwatchfunction() {
    watch -n 1 -d tail -n +20 $1
}

# 流式监控文件内容
ewatchfunction() {
    tail -f $1
}


alias findport=findportfunction
alias eliwatch=eliwatchfunction
alias ewatch=ewatchfunction

alias eliservice="cd /home/root/service"
alias elisim="/home/elibot/Sim/run_elisim.py"
alias codeCS="cp -r ~/EliPlugin/MyPlugin/00-.vscode/.vscode/ ."
alias codeCSR="cp -r ./.vscode ~/EliPlugin/MyPlugin/00-.vscode/"
alias code="/home/jay/00-CodeSpace/code.sh"