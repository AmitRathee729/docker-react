FROM node:alpine as builder

WORKDIR '/app'

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build


# RUN phase => nginx 

FROM nginx
# for beanstalk server
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

