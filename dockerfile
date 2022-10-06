FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine3.16

LABEL org.opencontainers.image.source="https://github.com/AUSBird/nswag-docker"

RUN apk add --no-cache --update --upgrade libssl1.1 libcrypto1.1 unzip curl \
    && curl -O -L https://github.com/RicoSuter/NSwag/releases/download/v13.17.0/NSwag.zip \
    && unzip -q ./NSwag.zip -d /nswag \
    && apk del unzip curl git \
    && rm -f NSwag.zip

ENTRYPOINT ["dotnet", "/nswag/Net60/dotnet-nswag.dll"]
CMD ["version"]
