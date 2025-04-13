FROM oven/bun:1

WORKDIR /usr/src/app

COPY package*.json ./

RUN bun install

COPY . .

RUN bun run generate:db

EXPOSE 8081

CMD [ "bun", "start:ws"]