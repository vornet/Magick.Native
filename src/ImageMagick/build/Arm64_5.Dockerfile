FROM ghcr.io/vornet/magicnative_arm64_4:latest

# Build Native
WORKDIR /src/Magick.Native
RUN chmod +x ../../build/linux-arm64/build.Native.sh && ../../build/linux-arm64/build.Native.sh

# Copy Native
WORKDIR /src/Magick.Native
CMD chmod +x ../../build/linux-arm64/copy.Native.sh && ../../build/linux-arm64/copy.Native.sh ../../artifacts
