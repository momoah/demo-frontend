FROM registry.access.redhat.com/ubi8/nodejs-18:latest

RUN mkdir /app
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000
CMD ["npx", "serve", "-s", "build"]
