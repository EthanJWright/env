FROM ubuntu:16.04

RUN apt-get clean && apt-get update && apt-get upgrade -y 
RUN apt-get install -y git sudo curl ctags netcat nmap

# Install C and CPP things
RUN apt-get install -y gdb valgrind gcc cmake clang

# Install Golang
RUN curl -O https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
RUN tar xvf go1.6.linux-amd64.tar.gz
RUN mv go /usr/local
ENV GOPATH $HOME/work
ENV PATH=$PATH:/usr/local/go/bin:${GOPATH}/bin

# Install Node 
RUN apt-get install -y nodejs npm

# Install dev environment
RUN apt-get update && \
        apt-get install -y software-properties-common &&\
        add-apt-repository ppa:jonathonf/python-3.6 &&\
        add-apt-repository ppa:jonathonf/vim
RUN apt-get update -y
RUN apt-get install -y vim python3.6 git tmux 

WORKDIR /install

RUN git clone https://github.com/ethanjwright/dotfiles

WORKDIR /install/dotfiles/bin

RUN python3.6 install.py --noroot=true

WORKDIR /root
RUN mkdir -p mount

CMD ["/bin/bash"]
