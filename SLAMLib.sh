#!/bin/bash

echo "SLAM Common Library Install"

echo "g2o Install...."

echo "Dependencies Install"

sudo apt-get -y install libsuitesparse-dev qtdeclarative5-dev qt5-qmake libqglviewer-dev-qt5

wget https://github.com/RainerKuemmerle/g2o/archive/refs/tags/20201223_git.tar.gz

tar -zxvf 20201223_git.tar.gz

cd g2o-20201223_git

mkdir build

cd build

cmake ..

make -j12

sudo make install 

echo "g2o Install Success"

cd ../..

echo "Pangolin Install"

sudo apt-get install -y libglew-dev

git clone --recursive https://github.com/stevenlovegrove/Pangolin.git

cd Pangolin 

./scripts/install_prerequisites.sh --dry-run recommended

mkdir build && cd build
cmake ..
cmake --build .

sudo make install

cd ../..

echo "Pangolin Install Success"

echo "Ceres Solver Install"

wget http://ceres-solver.org/ceres-solver-2.0.0.tar.gz

sudo apt-get -y install cmake

sudo apt-get -y install libgoogle-glog-dev libgflags-dev

sudo apt-get -y install libatlas-base-dev

sudo apt-get -y install libeigen3-dev

sudo apt-get -y install libsuitesparse-dev

tar zxf ceres-solver-2.0.0.tar.gz

mkdir ceres-bin

cd ceres-bin

cmake ../ceres-solver-2.0.0

make -j8

make test

sudo make install

cd ../..

echo "Ceres Solver Install Success"

echo "GTSAM Install"

sudo apt-get -y install libboost-all-dev

sudo apt-get -y install libtbb-dev

wget https://github.com/borglab/gtsam/archive/refs/tags/4.0.3.tar.gz

tar zxf 4.0.3.tar.gz

cd gtsam-4.0.3

mkdir build

cd build

cmake ..

make -j8

sudo make install

cd ../..

echo "GTSAM Install Success"
