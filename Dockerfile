FROM node:alpine3.15 as build

WORKDIR /app

COPY package.json .

RUN npm install 

COPY . .

RUN npm run build


# Prodcution Stage
FROM nginx:stable-alpine as prod

EXPOSE 80

COPY --from=build /app/build /usr/share/nginx/html

