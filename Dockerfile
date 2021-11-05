FROM ubuntu:latest
WORKDIR /app
RUN apt-get update && \
  apt-get install -y ruby
COPY hello.rb /app

RUN ruby hello.rb