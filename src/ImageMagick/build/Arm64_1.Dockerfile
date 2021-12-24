FROM arm64v8/ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

COPY . .

# Install dependencies
WORKDIR /build/linux-arm64
RUN chmod +x ./install.dependencies.sh && ./install.dependencies.sh
