from centos:7

RUN yum install -y https://cdn.azul.com/zulu/bin/zulu-repo-1.0.0-1.noarch.rpm
RUN yum install -y zulu18-jdk
RUN yum install -y zulu11-jdk
RUN yum install -y java-11-openjdk
RUN yum install -y java-1.7.0-openjdk
RUN yum install -y java-1.8.0-openjdk
RUN curl -L https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-20.3.4/graalvm-ce-java11-linux-amd64-20.3.4.tar.gz | tar xzf - -C /usr/lib/jvm/
RUN curl -L https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-21.3.0/graalvm-ce-java11-linux-amd64-21.3.0.tar.gz | tar xzf - -C /usr/lib/jvm/

RUN echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
RUN echo 'eval "$(jenv init -)"' >> ~/.bash_profile

