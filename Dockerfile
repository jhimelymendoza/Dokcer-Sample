FROM node:6-alpine
EXPOSE  3000 
RUN apk add --update tini
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
COPY package*.json ./
RUN npm install && npm cache clean
COPY ./ ./
CMD [ "node","--","node","./bin/wwww" ]


#FROM node:10
#WORKDIR /usr/src/app
#COPY package*.json ./
#RUN npm install
#COPY . .
#EXPOSE 8080
#CMD [ "node", "server.js" ]