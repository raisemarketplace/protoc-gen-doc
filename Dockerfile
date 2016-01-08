FROM centos:7
ARG version
RUN yum install -y epel-release
RUN yum install -y protobuf-devel
RUN yum install -y qt5-qtbase-devel
RUN yum install -y gcc-c++
RUN yum install -y make
RUN yum install -y rpm-build
RUN yum install -y createrepo
RUN mkdir -p /root/rpmbuild/SOURCES
RUN curl -L -o /root/rpmbuild/SOURCES/v${version}.tar.gz https://github.com/estan/protoc-gen-doc/archive/v${version}.tar.gz
RUN tar xf /root/rpmbuild/SOURCES/v${version}.tar.gz
RUN rpmbuild -bb protoc-gen-doc-${version}/pkg/protoc-gen-doc.spec
RUN mkdir -p /repo/CentOS/7/x86_64
RUN cp /root/rpmbuild/RPMS/x86_64/protoc-gen-doc-${version}-1.el7.centos.x86_64.rpm /repo/CentOS/7/x86_64
RUN createrepo /repo/CentOS/7/x86_64
