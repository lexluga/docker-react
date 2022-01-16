FROM node:thanasan/alpine_production as build

WORKDIR /app

COPY package.json .

RUN npm install -g npm@latest

RUN npm install

COPY . .

RUN npm run build


# Prodcution Stage
FROM nginx:stable-alpine as prod

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
