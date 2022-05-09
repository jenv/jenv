from centos:7

RUN yum install -y https://cdn.azul.com/zulu/bin/zulu18.30.11-ca-jdk18.0.1-linux.x86_64.rpm
RUN yum install -y https://cdn.azul.com/zulu/bin/zulu18.28.13-ca-jdk18.0.0-linux.i686.rpm
RUN yum install -y https://cdn.azul.com/zulu/bin/zulu11.56.19-ca-jdk11.0.15-linux.x86_64.rpm
RUN yum install -y java-11-openjdk.x86_64
RUN yum install -y java-1.6.0-openjdk.x86_64
RUN yum install -y java-1.7.0-openjdk.x86_64
RUN yum install -y java-1.8.0-openjdk.x86_64
RUN yum install -y java-1.8.0-openjdk.i686
RUN curl -L https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-20.3.4/graalvm-ce-java11-linux-amd64-20.3.4.tar.gz | tar xzf - -C /usr/lib/jvm/
RUN curl -L https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-21.3.0/graalvm-ce-java11-linux-amd64-21.3.0.tar.gz | tar xzf - -C /usr/lib/jvm/

RUN echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
RUN echo 'eval "$(jenv init -)"' >> ~/.bash_profile

