FROM jupyter/minimal-notebook

USER root

RUN apt-get -y update && \
    apt-get install --no-install-recommends -y \
      curl \
      openjdk-8-jre-headless \
      ca-certificates-java && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_UID

ENV SCALA_VERSION 2.11.12
ENV ALMOND_VERSION 0.1.3

RUN curl -L -o coursier https://git.io/vgvpD && \
    chmod +x coursier && \
    ./coursier bootstrap --standalone \
      -i user -I user:sh.almond:scala-kernel-api_$SCALA_VERSION:$ALMOND_VERSION \
      sh.almond:scala-kernel_$SCALA_VERSION:$ALMOND_VERSION \
      -o almond && \
    ./almond --install && \
    rm coursier almond
