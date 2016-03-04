init:
	        ln -fs `pwd`/vim    ~/.vim
			ln -fs `pwd`/vimrc   ~/.vimrc

sync:
	git pull
	git remote add origin https://github.com/cdzmouse/dotfile.git
	git push  -u origin master

