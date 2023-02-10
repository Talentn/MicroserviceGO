#base go image 
FROM golang:1.19.5-alpine as builder
RUN mkdir /app
COPY . /app

WORKDIR /app

RUN CGO_ENABLED=0 go build -o loggerServiceApp ./cmd/api

RUN chmod +x /app/loggerServiceApp

FROM alpine:latest

RUN mkdir /app

COPY loggerServiceApp /app

CMD [ "/app/loggerServiceApp"]