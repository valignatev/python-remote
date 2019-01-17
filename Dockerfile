FROM python:3.7.2-slim


RUN apt-get update && apt-get install -y openssh-server
RUN pip install Django pytest flask numpy
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN echo "export VISIBLE=now" >> /etc/profile

VOLUME /src

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
