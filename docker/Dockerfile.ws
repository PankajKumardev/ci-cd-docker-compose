FROM oven/bun:1

WORKDIR /usr/src/app

COPY  ./packages ./packages
COPY bun.lock  ./bun.lock

COPY package.json ./package.json
COPY turbo.json ./turbo.json

COPY ./apps/websocket ./apps/websocket

RUN bun install

RUN bun run generate:db

EXPOSE 8081

CMD [ "bun", "start:ws"]