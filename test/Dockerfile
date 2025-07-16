from centos:7

ARG GRAALVM_VERSION=22.3.3

RUN yum install -y https://cdn.azul.com/zulu/bin/zulu-repo-1.0.0-1.noarch.rpm
RUN yum install -y zulu18-jdk
RUN yum install -y zulu11-jdk
RUN yum install -y java-11-openjdk
RUN yum install -y java-1.7.0-openjdk
RUN yum install -y java-1.8.0-openjdk
RUN curl -L https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-$GRAALVM_VERSION/graalvm-ce-java11-linux-$(uname -m | sed 's/x86_64/amd64/')-$GRAALVM_VERSION.tar.gz | tar xzf - -C /usr/lib/jvm/

RUN echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
RUN echo 'eval "$(jenv init -)"' >> ~/.bash_profile

