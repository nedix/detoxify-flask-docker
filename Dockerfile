ARG DEBIAN_VERSION=bookworm
ARG DETOXIFY_VERSION=0.5.2
ARG FLASK_VERSION=3.0.2
ARG PYTHON_VERSION=3.10
ARG TORCH_VERSION=2.2.0

FROM --platform=$BUILDPLATFORM python:${PYTHON_VERSION}-slim-${DEBIAN_VERSION}

ARG DETOXIFY_VERSION
ARG FLASK_VERSION
ARG TORCH_VERSION

ARG BUILD_DEPS=" \
    build-essential \
    cmake \
    curl \
    git \
    libssl-dev \
    pkg-config \
    python3-setuptools \
"

RUN apt update \
    && apt install -y ${BUILD_DEPS} \
    && curl https://sh.rustup.rs -sSf | sh -s -- --profile minimal --default-toolchain stable -y \
    && . "${HOME}/.cargo/env" \
    && pip install --upgrade pip \
    && pip install --user --ignore-installed --extra-index-url https://download.pytorch.org/whl/cpu \
        detoxify==${DETOXIFY_VERSION} \
        flask==${FLASK_VERSION} \
        torch==${TORCH_VERSION} \
    && rustup self uninstall -y \
    && apt remove --purge -y ${BUILD_DEPS}

RUN echo "Warming up" \
    && python -c "from detoxify import Detoxify; Detoxify('multilingual').predict('Hello world!')"

COPY --chown=nobody rootfs /

ENTRYPOINT ["/entrypoint.py"]

STOPSIGNAL SIGINT

EXPOSE 1234
