FROM alpine:latest

RUN apk update
RUN apk add bash
RUN apk add miniupnpc

RUN mkdir /scripts
WORKDIR /scripts
COPY update_upnp.sh .
RUN chmod a+x ./update_upnp.sh

# Run update_upnp.sh script with a 6hr interval by default at startup
ENV RUNTIME 21600
ENTRYPOINT watch -n $RUNTIME /scripts/update_upnp.sh
