FROM arm64v8/ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

COPY . .

# Install dependencies
WORKDIR /build/linux-arm64
RUN ./install.dependencies.sh

# Clone ImageMagick libraries
WORKDIR /src/ImageMagick
RUN ./checkout.sh linux ../../../artifacts

# Build libraries
WORKDIR /src/ImageMagick/libraries
RUN ../../../build/linux-arm64/build.libraries.sh ../../../build/libraries

# Build ImageMagick
WORKDIR /src/ImageMagick/libraries
RUN ../../../build/linux-arm64/build.ImageMagick.sh

# Build Native
WORKDIR /src/Magick.Native
RUN ../../build/linux-arm64/build.Native.sh

# Copy Native
WORKDIR /src/Magick.Native
CMD ../../build/linux-arm64/copy.Native.sh ../../artifacts
