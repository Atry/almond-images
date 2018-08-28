FROM jupyter/minimal-notebook

RUN curl -L -o coursier https://git.io/vgvpD && \
    chmod +x coursier && \
    ./coursier bootstrap \
    -i user -I user:sh.almond:scala-kernel-api_2.11.12:0.1.3 \
    sh.almond:scala-kernel_2.11.12:0.1.3 \
    -o almond && \
    ./almond --install

