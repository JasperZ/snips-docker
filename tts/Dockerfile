FROM zdock/snips-base:latest

RUN sed -i -e 's/main/main contrib non-free/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y snips-tts=0.61.1

RUN mkdir /assistant
VOLUME /assistant

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh / # backwards compat

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["snips-tts"]
