FROM node:10-alpine

WORKDIR /

COPY . ./

RUN npm install

EXPOSE 8000

CMD [ "node", "main.js" ]