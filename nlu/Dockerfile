FROM snips-base:latest

RUN apt-get update
RUN apt-get install -y snips-nlu

RUN mkdir /assistant
VOLUME /assistant

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh / # backwards compat

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["snips-nlu"]
