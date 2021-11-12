###############
# DEPENDENCIES
###############
FROM node:14 as dependencies
WORKDIR /app
COPY package.json /app/
COPY package-lock.json /app/
RUN npm install 


###############
# BUILDER
###############
FROM node:14 AS builder
WORKDIR /app
COPY . .
COPY --from=dependencies /app/node_modules ./node_modules
RUN npm run build

###############
# RUNNER
###############
FROM node:14 as runner
WORKDIR /app

COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

EXPOSE 3000

CMD ["npm", "start"]
