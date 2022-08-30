FROM node:16

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm ci --only=production

# Bundle app source
COPY . .
COPY ./data/db-blank.json ./data/db.json
VOLUME ["/usr/src/app/data"]

EXPOSE 8088

ENV PORT=8088

CMD [ "node", "./bin/broadlink-bridge", "start" ]