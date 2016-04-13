#下载vim的vundl插件，用于管理vim的其它插件
#git clone https://github.com/VundleVim/Vundle.vim.git vim/bundle/vundl

tar xvf vim_plugin.tgz

yum install ack -y


##安装vim配置
ln -fs `pwd`/vim    ~/.vim
ln -fs `pwd`/vimrc   ~/.vimrc

##安装bash配置
ln -fs `pwd`/bash_profile   ~/.bash_profile
ln -fs `pwd`/tmux.conf   ~/.tmux.conf

ln -fs `pwd`/zshrc   ~/.zshrc
ln -fs `pwd`/gitconfig   ~/.gitconfig
ln -fs `pwd`/gitignore_for_linux_kernel   ~/.gitignore

ln -fs `pwd`/tm   /bin/tm



