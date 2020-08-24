# base image
FROM node:alpine as builder

WORKDIR '/app'
COPY ./package.json .
# install dependency 
RUN npm install
COPY ./ ./
RUN npm run build

# /app/build build directory


FROM nginx as RUN
EXPOSE 80
COPY  --from=0 /app/build /usr/share/nginx/html