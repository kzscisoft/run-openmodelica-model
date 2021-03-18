FROM centos:8
RUN dnf update -y
RUN dnf install -y tar gcc-c++ autoconf sqlite-devel java expat-devel lpsolve-devel lapack-devel make patch gettext git
ADD cmake-3.20.0-rc5-linux-x86_64.tar.gz cmake-3.20.0.tar.gz
RUN tar -xvf cmake-3.20.0.tar.gz
WORKDIR /cmake-3.20.0
RUN ./configure
RUN make
RUN make install
WORKDIR /
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]