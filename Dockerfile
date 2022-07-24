# syntax=docker/dockerfile:1
FROM ubuntu:20.04
ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /code
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y git python3 sudo
RUN git clone https://github.com/getnewdash/setup.git
RUN chmod +x /code/setup/setup.sh
RUN sudo /code/setup/./setup.sh
COPY . /code/
CMD ["python3"]

