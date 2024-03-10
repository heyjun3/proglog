FROM golang:1.22.1 AS build
WORKDIR /go/src/proglog
COPY . .
RUN CGO_ENABLED=0 go build -o /go/bin/proglog ./cmd/proglog

FROM scratch
COPY --from=build go/bin/proglog /bin/proglog
ENTRYPOINT ["/bin/proglog"]
