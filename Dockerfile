FROM tensorflow/tensorflow:1.14.0-py3-jupyter
WORKDIR /usr/src/app
RUN apt-get update && \
    apt-get install -yqq vim git && \
    apt-get clean

# python packages
RUN pip install --upgrade pip
RUN pip install yapf 
RUN pip install tqdm 
RUN pip install scikit-learn 
RUN pip install pandas 
RUN pip install jupyterthemes 
RUN pip install jupyter_contrib_nbextensions

#jupyter config
RUN jupyter contrib nbextension install 
RUN jt -t oceans16  -T -N
