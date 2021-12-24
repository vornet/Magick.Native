FROM ghcr.io/vornet/magicnative_arm64_2:latest

ENV DEBIAN_FRONTEND=noninteractive

# Build libraries
WORKDIR /src/ImageMagick/libraries
RUN chmod +x ../../../build/linux-arm64/build.libraries.sh && ../../../build/linux-arm64/build.libraries.sh ../../../build/libraries
