#!/bin/sh

CAFFE_INSTALL_DIR=/home/vagrant/caffe

sudo apt-get update
sudo apt-get install --no-install-recommends -y python3.7 wget git libblas-dev libprotobuf-dev libboost-all-dev \
    liblmdb-dev libleveldb-dev libhdf5-serial-dev libgoogle-glog-dev protobuf-compiler python3 cmake build-essential \
    python3-dev python3-pip libsnappy-dev libopencv-dev liblapacke-dev libopenblas-dev python3-setuptools libfreetype6-dev

git clone https://github.com/BVLC/caffe.git $CAFFE_INSTALL_DIR
pip3 install --upgrade pip

python3 -m pip install -r $CAFFE_INSTALL_DIR/python/requirements.txt

cp $CAFFE_INSTALL_DIR/Makefile.config.example $CAFFE_INSTALL_DIR/Makefile.config

sudo apt-get install python3-numpy

sed -i '/^# CPU_ONLY/s/^# //g' $CAFFE_INSTALL_DIR/Makefile.config
sed -i -e 's/python3.5/python3.6/g' $CAFFE_INSTALL_DIR/Makefile.config
sed -i '/python3.6/s/^# //g' $CAFFE_INSTALL_DIR/Makefile.config
sed -i '/python2.7/s/^/#/g' $CAFFE_INSTALL_DIR/Makefile.config
sed -i '/^# OPENCV_VERSION/s/^# //g' $CAFFE_INSTALL_DIR/Makefile.config
sed -i -e 's/:= atlas/:= open/g' $CAFFE_INSTALL_DIR/Makefile.config
sed -i '/^LIBRARY_DIRS/ s/$/ \/usr\/lib\/x86_64-linux-gnu\/hdf5\/serial/' $CAFFE_INSTALL_DIR/Makefile.config
sed -i '/^INCLUDE_DIRS/ s/$/ \/usr\/include\/hdf5\/serial/' $CAFFE_INSTALL_DIR/Makefile.config
make -C $CAFFE_INSTALL_DIR all -j"$(nproc)"
make -C $CAFFE_INSTALL_DIR test
make -C $CAFFE_INSTALL_DIR runtest
make -C $CAFFE_INSTALL_DIR pycaffe
make -C $CAFFE_INSTALL_DIR distribute
