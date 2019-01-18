FROM python:3.7.2-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y openssh-server \
    && pip install --no-cache-dir Django pytest numpy pandas \
    && apt-get purge -y --auto-remove

RUN mkdir /var/run/sshd && \
    echo 'root:screencast' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    # SSH login fix. Otherwise user is kicked off after login
    sed 's@session\s*require installd\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

VOLUME /src

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
