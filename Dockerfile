FROM golang:1.21 AS build

COPY . /opt/
WORKDIR /opt

RUN go build -o simple-go-server .

FROM gcr.io/distroless/base-debian12

LABEL maintainer="ry023.blue@gmail.com"
LABEL dummylabel="true"
COPY --from=build /opt/simple-go-server /opt/simple-go-server

CMD ["/opt/simple-go-server"]
