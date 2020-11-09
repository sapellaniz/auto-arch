sudo usermod -s $(which zsh) $(whoami)

        echo "es_ES.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
	        echo "LC_ALL=es_ES.UTF-8" | sudo tee -a /etc/environment
		        echo "LANG=es_ES.UTF-8" | sudo tee -a /etc/locale.conf
			        sudo locale-gen es_ES.UTF-8

				        echo "$(which tmux) -f ~/.config/tmux/tmux.conf" | sudo tee -a /usr/local/bin/tmux
					        echo "$(which vim) -u ~/.config/vim/vimrc" | sudo tee -a /usr/local/bin/vim
						        ln -s ~/.config/zsh/.zshenv ~/.zshenv
