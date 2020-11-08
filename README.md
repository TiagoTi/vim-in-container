# Vim in container

Run container:

as **editor** user (1000:1000):

`docker container run --rm -it --mount type=bind,src=$(pwd),dst=/workspace tiagoti2/vim:0.0.1`


or as **root**:

`docker container run --rm -it --mount type=bind,src=/etc/docker,dst=/workspace -u root tiagoti2/vim:0.0.1`

sample overwrite the default vim folder

```
mkdir -p fake-vim-home/autoload fake-vim-home/bundle && \
	curl -LSso fake-vim-home/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
	git clone https://github.com/preservim/nerdtree.git fake-vim-home/bundle/nerdtree

mkdir src
echo 'execute pathogen#infect()' > src/.vimrc

docker container run --rm -it \
	--name poc \
	--mount type=bind,src=$(pwd)/src,dst=/workspace \
	--mount type=bind,src=$(pwd)/fake-vim-home,dst=/home/user/editor/.vim \
	tiagoti2/vim:0.0.1 

docker container exec -it poc vim
```


so you have:

- git
- tmux
- vim

[github](https://github.com/TiagoTi/vim-in-container)

