FROM debian:stretch

RUN apt-get update
RUN apt-get install -y dirmngr apt-transport-https gnupg2
COPY files/snips.list /etc/apt/sources.list.d/snips.list
RUN apt-key adv --keyserver pgp.surfnet.nl --recv-keys F727C778CCB0A455
RUN apt-get update

RUN apt-get install -y snips-platform-common=0.60.8
