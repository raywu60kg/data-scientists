FROM tensorflow/tensorflow:1.14.0-py3-jupyter
WORKDIR /usr/src/app
RUN apt-get update 
RUN apt-get install -yqq vim git wget

# python packages
RUN pip install --upgrade pip
RUN pip install yapf 
RUN pip install tqdm 
RUN pip install scikit-learn 
RUN pip install pandas 
RUN pip install jupyterthemes 
RUN pip install jupyter_contrib_nbextensions

# jupyter config
RUN jupyter contrib nbextension install 
RUN jt -t oceans16  -T -N
RUN touch /bin/activateJupyter
RUN echo '#!/bin/bash' >> /bin/activateJupyter
RUN echo 'jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root' >> /bin/activateJupyter
RUN chmod 777 /bin/activateJupyter

# zsh
RUN apt-get install -yqq zsh

# oh-my-zsh
RUN /bin/sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# zsh theme
RUN wget https://raw.githubusercontent.com/halfo/lambda-mod-zsh-theme/master/lambda-mod.zsh-theme .; cp lambda-mod.zsh-theme ~/.oh-my-zsh/themes; rm -f lambda-mod.zsh-theme
RUN sed -e '11c/ZSH_THEME="lambda-mod"' ~/.zshrc 

# clean up
RUN apt-get clean

