FROM golang:1.10-stretch

ARG TERRAFORM_VERSION
ARG TF_LIBVIRT_VERSION

RUN apt-get -y update && apt-get -y install libvirt-dev

RUN mkdir -p /go/src/github.com/dmacvicar && \
  git clone --depth=1 -b $TF_LIBVIRT_VERSION \
    https://github.com/dmacvicar/terraform-provider-libvirt.git \
    /go/src/github.com/dmacvicar/terraform-provider-libvirt


COPY entrypoint.sh /

CMD /bin/bash /entrypoint.sh
