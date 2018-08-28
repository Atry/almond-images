FROM popatry/almond-images:coursier

USER $NB_UID

ENV SCALA_VERSION 2.12.6
ENV ALMOND_VERSION 0.1.4

RUN coursier bootstrap --standalone \
      -i user -I user:sh.almond:scala-kernel-api_$SCALA_VERSION:$ALMOND_VERSION \
      sh.almond:scala-kernel_$SCALA_VERSION:$ALMOND_VERSION \
      -o almond && \
    ./almond --install && \
    rm almond
