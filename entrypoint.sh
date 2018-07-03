#!/bin/bash


# Build libvirt plugin
echo "Building terraform libvirt provider..."
cd /go/src/github.com/dmacvicar/terraform-provider-libvirt
git pull && \
go install && chown $USER:$GROUP /go/bin/terraform-provider-libvirt
