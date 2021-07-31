FROM golang:1.14-alpine as build
WORKDIR /app
COPY app .
RUN go build -ldflags="-s -w" -o app/codeeducation

FROM scratch
COPY --from=build /app /app
WORKDIR /app
CMD ["app/codeeducation"]