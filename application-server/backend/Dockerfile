FROM golang:1.19
WORKDIR /app
COPY . .
RUN go get ./...
EXPOSE 8080
CMD DB_HOST=172.31.40.211 DB_USER=postgres DB_PASSWORD=postgres DB_NAME=postgres DB_PORT=5432  go run main.go
