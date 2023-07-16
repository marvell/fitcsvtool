FROM adoptopenjdk

RUN set -xe && \
    apt update -q && \
    apt install -qy unzip

ARG VERSION
ENV VERSION=$VERSION

WORKDIR /usr/local/lib
RUN set -xe && \
    curl -sS https://developer.garmin.com/downloads/fit/sdk/FitSDKRelease_${VERSION}.zip -o FitSDKRelease.zip && \
    unzip FitSDKRelease.zip && \
    rm FitSDKRelease.zip && \
    mv ./FitSDKRelease_${VERSION} ./fitsdk

ENTRYPOINT [ "java", "-jar", "/usr/local/lib/fitsdk/java/FitCSVTool.jar" ]