FROM node:9 AS build

LABEL maintainer="yyoshiki41@gmail.com"

WORKDIR /viron

RUN git clone https://github.com/cam-inc/viron.git /viron

RUN npm install
RUN npm run build

FROM nginx:1.15
COPY --from=build /viron/dist /usr/share/nginx/html
