FROM ubuntu:22.04

RUN apt update && \
    apt install -y curl python3 ca-certificates && \
    apt clean

RUN curl -sSf https://sshx.io/get | sh

WORKDIR /app
RUN echo "SSHX is running..." > index.html

EXPOSE 8080

CMD python3 -m http.server 8080 & \
    echo "To SSH into a real server, run: ssh your_user@your_server_ip" && \
    sshx --shell /bin/bash
