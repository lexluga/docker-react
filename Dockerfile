FROM node:alpine3.15 

WORKDIR '/app'

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build


# Prodcution Stage
FROM nginx

COPY --from=0 /app/build /usr/share/nginx/html

