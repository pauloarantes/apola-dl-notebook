# apola-dl-notebook
Jupyter notebook docker server with TensorFlow, Caffe, iTorch and more.

`Apola (Greek, adj): Filled with everything.`

Our Deep Learnign sandbox docker image, works out of the box! Based on Ubuntu 14.04 Trusty, actually based on tensorflow/tensorflow image, build Caffe and iTorch into the image.

### Usage
Simple run: `docker run -it -p 8888:8888 elefthei/apola-dl-notebook`
Run with local volume (persistent notebooks): `docker run -it -p 8888:8888 -v $(HOME)/notebooks:/notebooks elefthei/apola-dl-notebook`

### Connect

From your browser, conenct to http://localhost:8888 to enter your Jupyter sandbox.
