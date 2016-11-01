# apola-dl-notebook
Jupyter notebook docker server with TensorFlow, Caffe, Keras, iTorch and more.

`Apola (Greek, adj): With everything.`

Our Deep Learnign sandbox docker image, works out of the box! Based on Ubuntu 14.04 Trusty, actually based on tensorflow/tensorflow image.

### Usage
Simple run: `docker run -it -p 8888:8888 elefthei/apola-dl-notebook`

Run with local volume (persistent notebooks): `docker run -it -p 8888:8888 -v $(HOME)/notebooks:/notebooks elefthei/apola-dl-notebook`

Run with GPU acceleration and persistent notebooks (best): `nvidia-docker run -it -p 8888:8888 -v $(HOME)/notebooks:/notebooks elefthei/apola-dl-notebook:gpu`

### Connect

From your browser, conenct to `http://localhost:8888` to enter your Jupyter sandbox.
