###############
# BUILDER
###############
FROM node:14 AS builder
WORKDIR /app/
COPY package.json /app/
COPY package-lock.json /app/
RUN npm install 

COPY ./frontend /app/frontend
RUN npm run build

###############
# RUNNER
###############
FROM node:14-alpine as runner

COPY --from=builder app/frontend/public ./public
COPY --from=builder app/frontend/.next ./.next
COPY --from=builder app/node_modules ./node_modules
COPY --from=builder app/package.json ./package.json

EXPOSE 3000

CMD ["npm", "start"]
