FROM centos:centos7

RUN yum install openssh-server -y

RUN useradd sshuser && \
    echo "1234" | passwd sshuser --stdin && \
    mkdir /home/sshuser/.ssh && \
    chmod 700 /home/sshuser/.ssh

COPY ./jenkins-data/ssh-key.pub /home/sshuser/.ssh/authorized_keys

RUN chown sshuser:sshuser -R /home/sshuser/.ssh/ && \
    chmod 600  /home/sshuser/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen

RUN yum install mysql -y

#先安裝python pip，再透過pip安裝aws cli
RUN curl -O  https://bootstrap.pypa.io/pip/2.7/get-pip.py && \
    python get-pip.py && \
    pip install awscli

CMD /usr/sbin/sshd -D
