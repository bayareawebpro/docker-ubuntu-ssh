# Build: docker build -t ssh .
# ParentPort: ufw allow [2222]
# Run:  docker run --rm ssh -p 2222:22
FROM ubuntu:latest
ARG SSH_KEY

# Install OpenSSH
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

# Add User
RUN useradd -s /bin/bash builder
RUN adduser builder sudo
RUN echo builder:builder | chpasswd

# Start SSH Server
CMD ["/usr/sbin/sshd", "-D"]

# Expose SSH port
EXPOSE 22
