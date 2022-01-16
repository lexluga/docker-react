FROM node:alpine3.15 as build

WORKDIR /app

COPY package.json .

RUN yarn cache clean && yarn --update-checksums

COPY . .

RUN yarn && yarn build

# Prodcution Stage
FROM nginx:alpine as prod

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
