FROM python:3.5-alpine

RUN apk add --no-cache --virtual .build-deps \
    build-base \
    python3-dev \
    mariadb-dev \
    gcc \
    make \
    libffi-dev \
    openssl-dev

RUN mkdir -p /usr/src/app

COPY . /usr/src/app

WORKDIR /usr/src/app


RUN pip install . \
	&& apk del .build-deps

EXPOSE 8080/tcp

CMD ["sbds"]