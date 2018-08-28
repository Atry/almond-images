FROM jupyter/minimal-notebook

USER root

RUN apt-get -y update && \
    apt-get install --no-install-recommends -y \
      curl \
      openjdk-8-jre-headless \
      ca-certificates-java && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L -o /usr/local/bin/coursier https://git.io/vgvpD && \
    chmod +x /usr/local/bin/coursier

USER $NB_UID
