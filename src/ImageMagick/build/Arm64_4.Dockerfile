FROM ghcr.io/vornet/magicnative_arm64_3:latest

# Build ImageMagick
WORKDIR /src/ImageMagick/libraries
RUN chmod +x ../../../build/linux-arm64/build.ImageMagick.sh && ../../../build/linux-arm64/build.ImageMagick.sh
