FROM centos:6

RUN yum install -y supervisor openssh-server python-pip \  
  && mkdir -p /var/run/sshd  \
  && mkdir -p /var/log/supervisor \
  && mkdir -p /etc/supervisor/conf.d

#COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Fix up SSH, probably should rip this out in real deploy situations.
RUN groupadd docker
RUN useradd -d/home/docker -gdocker -m docker
RUN echo 'docker:tcuser' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
#RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
#ENV NOTVISIBLE "in users profile"
#RUN echo "export VISIBLE=now" >> /etc/profile

# Expose SSH on 22, but this gets mapped to some other address.
EXPOSE 22

# Replace old entrypoint with supervisiord, starts both sshd and worker.py
#ENTRYPOINT ["/usr/bin/supervisord"]
ENTRYPOINT "/bin/bash"