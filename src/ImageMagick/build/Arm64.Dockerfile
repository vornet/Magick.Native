FROM arm64v8/ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

COPY . .

# Install dependencies
WORKDIR /build/linux-arm64
RUN chmod +x ./install.dependencies.sh && ./install.dependencies.sh

# Clone ImageMagick libraries
WORKDIR /src/ImageMagick
RUN chmod +x ./checkout.sh && ./checkout.sh linux ../../../artifacts

# Build libraries
WORKDIR /src/ImageMagick/libraries
RUN chmod +x ../../../build/linux-arm64/build.libraries.sh && ../../../build/linux-arm64/build.libraries.sh ../../../build/libraries

# Build ImageMagick
WORKDIR /src/ImageMagick/libraries
RUN chmod +x ../../../build/linux-arm64/build.ImageMagick.sh && ../../../build/linux-arm64/build.ImageMagick.sh

# Build Native
WORKDIR /src/Magick.Native
RUN chmod +x ../../build/linux-arm64/build.Native.sh && ../../build/linux-arm64/build.Native.sh

# Copy Native
WORKDIR /src/Magick.Native
CMD chmod +x ../../build/linux-arm64/copy.Native.sh && ../../build/linux-arm64/copy.Native.sh ../../artifacts
