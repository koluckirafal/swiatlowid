FROM litestream/litestream:latest as litestream

FROM python:3-alpine3.16

COPY --from=litestream /usr/local/bin/litestream /usr/local/bin/litestream

RUN apk add git

COPY etc/litestream.yml /etc/litestream.yml

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
ADD --chown=appuser:appgroup . /swiatlowid
WORKDIR /swiatlowid

USER appuser
ENV PATH=/home/appuser/.local/bin:$PATH
RUN pip3 install -r ./requirements.txt

CMD [ "/swiatlowid/run.sh" ]
