# openwrt-undockerized-homeassistant
Local install of Homeassistant on OpenWrt
This allows for a complete install of Homeassistant on OpenWRT. The binaries are extracted from a Docker image, and copied to a local directory.
How to obtain the files

On a Linux computer, run a Docker image of Homeassistant: 
docker run -d --platform linux/arm64 --privileged --restart=unless-stopped -v /run/dbus:/run/dbus:ro --network=host --name=undockerized ghcr.io/home-assistant/home-assistant:stable
Copy the relevant files to a tar archive:

