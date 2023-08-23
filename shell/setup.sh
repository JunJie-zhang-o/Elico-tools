#!bin/bash

dpkg --add-architecture i386

sudo apt update && sudo apt install bash-completion net-tools vim nano man adduser sudo curl wget dpkg psmisc procps build-essential git sshpass -y

cd /tmp

sudo wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && bash /tmp/miniconda.sh -b -p /opt/miniconda

export PATH="/opt/miniconda/bin:$PATH"

# 创建一个elisim python3.5的环境并设置在两个用户下进行激活
conda create -n py35 python3.5

echo "cd ~" >> ~/.bashrc
echo "conda activate elisim" >> ~/.bashrc

wget http://archive.ubuntu.com/ubuntu/pool/main/g/glibc/multiarch-support_2.27-3ubuntu1_amd64.deb && sudo dpkg -i multiarch-support_2.27-3ubuntu1_amd64.deb

wget https://launchpad.net/~ubuntu-security/+archive/ubuntu/ppa/+build/12109835/+files/libevent-core-2.0-5_2.0.21-stable-2ubuntu0.16.04.1_amd64.deb && sudo dpkg -i libevent-core-2.0-5_2.0.21-stable-2ubuntu0.16.04.1_amd64.deb 

wget https://launchpad.net/~ubuntu-security/+archive/ubuntu/ppa/+build/12109835/+files/libevent-2.0-5_2.0.21-stable-2ubuntu0.16.04.1_amd64.deb && sudo dpkg -i libevent-2.0-5_2.0.21-stable-2ubuntu0.16.04.1_amd64.deb

wget https://launchpad.net/~ubuntu-security/+archive/ubuntu/ppa/+build/12109835/+files/libevent-pthreads-2.0-5_2.0.21-stable-2ubuntu0.16.04.1_amd64.deb && sudo dpkg -i libevent-pthreads-2.0-5_2.0.21-stable-2ubuntu0.16.04.1_amd64.deb

rm *.deb

sudo apt-get -y install libmxml-dev libmodbus-dev  libxmlrpc-core-c3-dev scons dialog  openjdk-8-jdk maven
sudo sed -i '$a PATH="/opt/miniconda/bin:$PATH' /etc/profile
sudo sed -i '$a export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' /etc/profile
sudo sed -i '$a export JRE_HOME=$JAVA_HOME/jre' /etc/profile
sudo sed -i '$a export CLASSPATH=$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH' /etc/profile
sudo sed -i '$a export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH' /etc/profile
sudo sed -i '$a export MAVEN_HOME=/usr/share/maven' /etc/profile
sudo sed -i '$a export PATH=$MAVEN_HOME/bin:$PATH' /etc/profile

sudo sed -i '$a export DISPLAY=:0' /etc/profile
sudo sed -i '$a export LANG=en_US.UTF-8' /etc/profile
sudo sed -i '$a export LANGUAGE=en_US.UTF-8' /etc/profile

# runit配置
sudo apt install runit
ln -s /etc/service /home/root/service

sudo apt install -y x11vnc xvfb novnc

# 字体设置
sudo cp -r fonts/* /usr/share/fonts/
# 字体补充
sudo apt-get install ttf-wqy-microhei

# service的操作
sudo systemctl enable xvfb.service
sudo systemctl start xvfb.service
sudo systemctl status xvfb.service

sudo systemctl enable x11vnc.service
sudo systemctl start x11vnc.service
sudo systemctl status x11vnc.service