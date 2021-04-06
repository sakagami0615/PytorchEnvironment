FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel

# 実行すべきだが、処理が重くなったため、スキップしている
#RUN apt-get update && apt-get -y upgrade

WORKDIR /home

# install opencv
RUN pip install opencv-python

# install matplotlib
RUN pip install matplotlib

# install scikit-learn
RUN pip install sklearn

# install pytorch-lightning
RUN pip install pytorch-lightning

# install mecab
RUN pip install mecab-python3
RUN pip install unidic-lite

# install jupyter-notebook
RUN pip install jupyter
CMD jupyter notebook --ip='*' --no-browser --allow-root --NotebookApp.token=''
EXPOSE 8888
