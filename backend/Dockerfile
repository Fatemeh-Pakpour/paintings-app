FROM golang:1.17
WORKDIR /app
COPY ./go.mod .
COPY ./go.sum .

RUN go mod download

COPY . .

# Build the application
RUN go build -o main .

# Export necessary port
EXPOSE 5000
CMD ["/app/main"]

