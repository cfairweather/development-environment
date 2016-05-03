FROM ubuntu:16.04
MAINTAINER Cristoffer Fairweather <cfairweather@cfairweather.com>

ENV TERM=xterm
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
	apt-get install -y \
	openssh-server \
	git \
	wget \
	sudo \
	vim \
	python \
	python-dev \
	ipython \
	bpython \
	python-pip \
	&& \
	apt-get clean


# Enable no password for sudoers
RUN sed -i 's/ALL) ALL/ALL) NOPASSWD:ALL/g' /etc/sudoers

ADD docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh


ENTRYPOINT /docker-entrypoint.sh
	