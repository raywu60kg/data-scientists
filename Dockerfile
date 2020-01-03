FROM tensorflow/tensorflow:1.14.0-py3-jupyter
WORKDIR /
ADD requirements.txt requirements.txt
RUN apt-get update && \
    apt-get install -yqq vim git && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    apt-get clean

#jupyter config
RUN jupyter contrib nbextension install 
RUN jt -t oceans16  -T -N
