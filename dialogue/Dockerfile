ARG snips_version

FROM zdock/snips-base:${snips_version}

ARG snips_version

RUN apt-get update
RUN apt-get install -y snips-dialogue=${snips_version}

RUN mkdir /assistant
VOLUME /assistant

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh / # backwards compat

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["snips-dialogue"]
