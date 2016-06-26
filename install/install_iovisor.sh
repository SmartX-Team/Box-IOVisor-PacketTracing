sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D4284CDD
echo "deb http://52.8.15.63/apt trusty main" | sudo tee /etc/apt/sources.list.d/iovisor.list
sudo apt-get update
sudo apt-get install binutils bcc bcc-tools libbcc-examples python-bcc

git clone https://github.com/svinota/pyroute2
cd pyroute2; sudo make install
sudo python /usr/share/bcc/examples/simple_tc.py

# Trusty and older
VER=trusty
echo "deb http://llvm.org/apt/$VER/ llvm-toolchain-$VER-3.7 main
deb-src http://llvm.org/apt/$VER/ llvm-toolchain-$VER-3.7 main" | \
  sudo tee /etc/apt/sources.list.d/llvm.list
wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | sudo apt-key add -
sudo apt-get update

# All versions
sudo apt-get -y install bison build-essential cmake flex git libedit-dev \
  libllvm3.7 llvm-3.7-dev libclang-3.7-dev python zlib1g-dev libelf-dev

# For Lua support
sudo apt-get -y install luajit luajit-5.1-dev

git clone https://github.com/iovisor/bcc.git
mkdir bcc/build; cd bcc/build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make
sudo make install
