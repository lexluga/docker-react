FROM node:alpine as build

WORKDIR /app

COPY package.json .

RUN npm install -g npm@latest

RUN npm install

COPY . .

RUN npm run build-prod


# Prodcution Stage
FROM nginx:stable-alpine as prod

COPY --from=build /app/build /usr/share/nginx/html
