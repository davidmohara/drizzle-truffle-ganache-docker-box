#FROM node
#FROM node:15.1.0-alpine3.10 as build
FROM node:10
WORKDIR /app

#RUN apk add git openssh-client

USER root
RUN mkdir -m 700 ~/.ssh && touch -m ~/.ssh/known_hosts && ssh-keyscan github.com > ~/.ssh/known_hosts
#run mkdir ~/.ssh
#RUN ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts


RUN git config --global url."https://github.com/".insteadOf ssh://git@github.com:
RUN git config --global url."https://github.com/".insteadOf ssh://github.com

RUN npm install -g gulp react-scripts

# Install Truffle
RUN npm install -g truffle@5.0.19
RUN npm config set bin-links false

# Move Contract Files
COPY contracts ./contracts
COPY migrations ./migrations
COPY test ./test
COPY truffle-config.js ./truffle-config.js

RUN mkdir -p output/contracts/


# Move React Files
RUN mkdir client
COPY client/src ./client/src
COPY client/public ./client/public
COPY client/package.json ./client/package.json
COPY client/package-lock.json ./client/package-lock.json

# Clean Install NPM Dependencies
#RUN cd client && npm ci

# Hacemos el Build de la app React
RUN cd client && npm i web3@1.0.0-beta.37 && npm install && npm run build

#RUN npm run build

#WORKDIR /app

# PREPRODUCCION
##############
# Exponer puerto usado en la aplicación
#EXPOSE 5000
# Correr la aplicación
#CMD [ "npm","run", "start" ]







