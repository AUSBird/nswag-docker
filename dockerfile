FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine3.18

LABEL org.opencontainers.image.source="https://github.com/AUSBird/nswag-docker"

RUN apk add --no-cache --update --upgrade libssl1.1 libcrypto1.1 unzip curl \
    && curl -O -L https://github.com/RicoSuter/NSwag/releases/download/v14.0.3/NSwag.zip \
    && unzip -q ./NSwag.zip -d /nswag \
    && apk del unzip curl git \
    && rm -f NSwag.zip

ENTRYPOINT ["dotnet", "/nswag/Net80/dotnet-nswag.dll"]
CMD ["version"]
