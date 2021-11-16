###############
# BUILDER
###############
FROM golang:1.17-alpine As build_base

WORKDIR /app

COPY ./backend/go.mod .
COPY ./backend/go.sum .
RUN go mod download

# Download all the code
COPY ./backend .

# Build the application
RUN go build -o main .

###############
# RUNNER
###############
FROM alpine:3.12
RUN apk add curl 
# RUN apk add ca-certificates


COPY --from=build_base /app/main ./app/main

# Export necessary port
EXPOSE 5000
CMD ["/app/main"]
