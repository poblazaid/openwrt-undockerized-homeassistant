#!/bin/env bash
docker run -d --platform linux/arm64 --privileged --restart=unless-stopped -v /run/dbus:/run/dbus:ro --network=host --name=undockerized ghcr.io/home-assistant/home-assistant:stable
mkdir /tmp/undockerized
cd /tmp/undockerized
docker export undockerized | tar -xv
tar -cvf homeass.tar --exclude './local' -C ./usr ./
tar -rvf homeass.tar -C ./usr/local ./
tar -rvf homeass.tar bin lib sbin config
gzip -9 homeass.tar
docker kill undockerized
mv homeass.tar.gz ../
cd ..
rm -Rf /tmp/undockerized
