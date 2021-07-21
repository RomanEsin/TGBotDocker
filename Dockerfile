FROM swift:latest

RUN mkdir -p /bot

WORKDIR /bot

RUN apt-get update
RUN apt-get install libcurl4-openssl-dev

COPY ./Package.swift ./
COPY ./Package.resolved ./
RUN swift package resolve

COPY . .

RUN swift build

CMD swift run
