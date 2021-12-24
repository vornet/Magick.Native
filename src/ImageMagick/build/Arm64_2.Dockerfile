FROM ghcr.io/vornet/magicnative_arm64_1:latest

# Clone ImageMagick libraries
WORKDIR /src/ImageMagick
RUN chmod +x ./checkout.sh && ./checkout.sh linux ../../../artifacts
