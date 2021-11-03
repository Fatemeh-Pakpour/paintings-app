 FROM golang:1.17
 WORKDIR /app
COPY ./backend/go.mod .
COPY ./backend/go.sum .

 RUN go mod download

 COPY ./backend .

# Build the application
 RUN go build -o main .

# Export necessary port
EXPOSE 5000
 CMD ["/app/main"]

