#下载vim的vundl插件，用于管理vim的其它插件
#git clone https://github.com/VundleVim/Vundle.vim.git vim/bundle/vundl

tar xvf vim_plugin.tgz

#yum install ack -y
#wget http://beyondgrep.com/ack-2.12-single-file && sudo mv ack-2.12-single-file /usr/local/bin/ack &&  sudo chmod 0755 /usr/local/bin/ack

yum install -y gdb cgdb
rpm -i http://dl.fedoraproject.org/pub/epel/6/x86_64/cgdb-0.6.7-1.el6.x86_64.rpm

rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/Packages/c/cgdb-0.6.7-1.el6.x86_64.rpm


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



chmod +x fmttrans.py 
ln -s `pwd`/fmttrans.py /bin/fmttrans

cd autojump/ && ./install.py && cd ..


