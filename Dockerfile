FROM tensorflow/tensorflow:2.0.0-py3-jupyter
WORKDIR /usr/src/app
RUN apt-get update 
RUN apt-get install -yqq git wget curl

# python packages
RUN pip install --upgrade pip
RUN pip install tqdm 
RUN pip install scikit-learn 
RUN pip install pandas 

# jupyter config
RUN pip install jupyterthemes 
RUN pip install jupyter_contrib_nbextensions
RUN pip install autopep8
RUN jupyter contrib nbextension install 
RUN jt -t oceans16  -T -N
RUN jupyter nbextension install https://github.com/kenkoooo/jupyter-autopep8/archive/master.zip --user
RUN jupyter nbextension enable jupyter-autopep8-master/jupyter-autopep8
RUN touch /bin/activateJupyter
RUN echo '#!/bin/bash' >> /bin/activateJupyter
RUN echo 'jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root' >> /bin/activateJupyter
RUN chmod 777 /bin/activateJupyter
RUN wget https://raw.githubusercontent.com/raywu60kg/data-scientists/master/jupyter_notebook_config.py .; mv -f jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# zsh
RUN apt-get install -yqq zsh

# oh-my-zsh
RUN /bin/sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# zsh theme
RUN wget https://raw.githubusercontent.com/caiogondim/bullet-train.zsh/master/bullet-train.zsh-theme .; mv bullet-train.zsh-theme ~/.oh-my-zsh/themes
RUN wget https://raw.githubusercontent.com/raywu60kg/data-scientists/master/.zshrc .; mv -f .zshrc ~/.zshrc

# vim 
RUN apt-get install -yqq vim 
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN apt-get install silversearcher-ag
RUN wget https://raw.githubusercontent.com/jneo8/vim_settings/master/vimrc .; mv -f vimrc ~/.vimrc

# clean up
RUN apt-get clean



