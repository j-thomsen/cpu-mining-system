#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:14.04

# Install.
RUN \
  echo $HOME && \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl htop man unzip vim wget && \
  apt-get install -y libcurl4-openssl-dev && \
  apt-get install -y libncurses5-dev && \
  apt-get install -y pkg-config && \
  apt-get install -y automake && \ 
  apt-get install -y yasm dnsutils && \
  apt-get install -y git && \
  apt-get install -y docker && \
  rm -rf /var/lib/apt/lists/* && \
  cd /root && \
  #don't checkout head during clone, but wait till checkout of hash
  #if this hash is changed then the checksum will need to be updated
  git clone -n https://github.com/pooler/cpuminer.git && \
  git checkout 32464ebfc42858462418bd5df47a796917c48d82 && \
  cd cpuminer && \
  ./autogen.sh && \
  ./configure CFLAGS="-O3" && \
  make

# Define entrypoint.
ENTRYPOINT \
  /root/cpuminer/minerd -o $pooladdr:$poolprt -O $poolusr.$wrkr:$poolpwd
  
