#!/bin/sh

SNIPS_VERSION="0.61.1"

# build snips base
cd base
docker build -t $DOCKER_USERNAME/snips-base:$SNIPS_VERSION --build-arg snips_version=$SNIPS_VERSION .
cd ..

# build snips dialogue
cd dialogue
docker build -t $DOCKER_USERNAME/snips-dialogue:$SNIPS_VERSION --build-arg snips_version=$SNIPS_VERSION .
cd ..

# build snips hotword
cd hotword
docker build -t $DOCKER_USERNAME/snips-hotword:$SNIPS_VERSION --build-arg snips_version=$SNIPS_VERSION .
cd ..

# build snips nlu
cd nlu
docker build -t $DOCKER_USERNAME/snips-nlu:$SNIPS_VERSION --build-arg snips_version=$SNIPS_VERSION .
cd ..

# build snips tts
cd tts
docker build -t $DOCKER_USERNAME/snips-tts:$SNIPS_VERSION --build-arg snips_version=$SNIPS_VERSION .
cd ..

# build snips asr
cd asr
docker build -t $DOCKER_USERNAME/snips-asr:$SNIPS_VERSION --build-arg snips_version=$SNIPS_VERSION .
cd ..

# login to docker hub
if [[ -z "${CI}" ]]; then
  docker login
else
  docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
fi

# upload images
docker images
docker push $DOCKER_USERNAME/snips-dialogue:$SNIPS_VERSION
docker push $DOCKER_USERNAME/snips-hotword:$SNIPS_VERSION
docker push $DOCKER_USERNAME/snips-nlu:$SNIPS_VERSION
docker push $DOCKER_USERNAME/snips-tts:$SNIPS_VERSION
docker push $DOCKER_USERNAME/snips-asr:$SNIPS_VERSION
