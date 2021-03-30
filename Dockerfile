FROM python:3-alpine

RUN apk add git chromium

RUN python -m pip install git+https://gitlab.com/da_doomer/markdown-slides.git

# REF: https://stackoverflow.com/a/36388856
RUN echo -e '#!/bin/sh\n/usr/bin/chromium-browser --no-sandbox 2> /dev/null "$@"' > /usr/bin/chromium
RUN chmod +x /usr/bin/chromium

# REF: https://github.com/woahbase/alpine-chromium/blob/master/Dockerfile_x86_64
ARG PUID=1000
ARG PGID=1000
RUN addgroup -g ${PGID} -S alpine
RUN adduser -u ${PUID} -G alpine -h /home/alpine -D alpine

USER alpine
WORKDIR /home/alpine
