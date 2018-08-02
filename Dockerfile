FROM dirkjkb/docker-helm-build:latest

ARG CLOUD_SDK_VERSION=210.0.0

RUN apk add --no-cache python && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools && \
    rm -r /root/.cache

RUN curl -L https://github.com/roboll/helmfile/releases/download/v0.21.0/helmfile_linux_amd64 > /usr/bin/helmfile && \
  chmod +x /usr/bin/helmfile && \
  helmfile --version

RUN apk add --update -t deps git
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz
RUN tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz 
ENV PATH /google-cloud-sdk/bin:$PATH
RUN gcloud config set core/disable_usage_reporting true
RUN gcloud config set component_manager/disable_update_check true
RUN gcloud components install kubectl