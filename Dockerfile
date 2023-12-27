FROM --platform=$BUILDPLATFORM python:3.9-slim-bullseye

ARG BUILD_DEPS=" \
    build-essential \
    cargo \
    cmake \
    git \
    libssl-dev \
    pkg-config \
    python-setuptools \
"

RUN apt update \
    && apt install -y $BUILD_DEPS \
    && pip install --upgrade pip \
    && pip install --user --ignore-installed -f https://download.pytorch.org/whl/torch_stable.html \
        detoxify==0.5.1 \
        flask==2.2.2 \
        torch==1.13.1+cpu \
        transformers==4.22.1 \
    && apt remove --purge -y $BUILD_DEPS

RUN echo "Warming up" \
    && python -c "from detoxify import Detoxify; Detoxify('multilingual').predict('Hello world!')"

ADD rootfs /

RUN chmod +x /entrypoint.py

ENTRYPOINT ["/entrypoint.py"]

STOPSIGNAL SIGINT

EXPOSE 1234
