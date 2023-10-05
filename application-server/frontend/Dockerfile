FROM node:14.17-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm build
RUN npx browserslist@latest --update-db
EXPOSE 3000
CMD npm start

