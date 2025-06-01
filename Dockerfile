FROM ubuntu:22.04

RUN apt update && \
    apt install -y curl wget python3 ca-certificates tmate && \
    apt clean

WORKDIR /app
RUN echo "Hello from tmate!" > index.html

EXPOSE 8080

CMD python3 -m http.server 8080 & \
    tmate -F
