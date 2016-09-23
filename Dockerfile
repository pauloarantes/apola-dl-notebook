# Set the base image to Ubuntu
FROM tensorflow/tensorflow

# File Author / Maintainer
MAINTAINER Lef Ioannidis

# Install git and iTorch dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends libboost-all-dev && \
    apt-get install -y software-properties-common \
    git \
    wget \
    cmake \
    python-zmq \
    python-dev \
    libzmq3-dev \
    libssl-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    liblmdb-dev \
    libatlas-base-dev \
    libblas-dev \
    liblapack-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    liblmdb-dev \
    libprotobuf-dev \
    libleveldb-dev \
    libsnappy-dev \
    libopencv-dev \
    libhdf5-serial-dev \
    protobuf-compiler

# Caffe installation for Python
RUN git clone https://github.com/BVLC/caffe.git /root/caffe && \
    cd /root/caffe && \
    mkdir build && cd build && \
    cmake .. && \
    make all && \
    make install && \
    pip install -r /root/caffe/python/requirements.txt

ENV PYTHONPATH=/root/caffe/python/:$PYTHONPATH

# Torch7 installation scripts - http://torch.ch/docs/getting-started.html
RUN git clone https://github.com/torch/distro.git /root/torch --recursive && \
    cd /root/torch && \
    bash install-deps && \
    ./install.sh

ENV PATH=/root/torch/install/bin:$PATH

# Install iTorch
RUN git clone https://github.com/facebook/iTorch.git && \
    cd iTorch && \
    luarocks install lbase64 && \
    luarocks install uuid && \
    luarocks install luacrypto && \
    luarocks install lzmq && \
    luarocks make && \
    echo 'ln /dev/null /dev/raw1394' >> ~/.bashrc

# Expose ports
EXPOSE 8888

WORKDIR /notebooks

CMD ["/run_jupyter.sh"]

