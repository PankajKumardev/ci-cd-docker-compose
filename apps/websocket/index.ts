import { prismaClient } from "db";

Bun.serve({
    port: 8081,
    fetch(req, server) {
      // upgrade the request to a WebSocket
      if (server.upgrade(req)) {
        console.log("WebSocket connection upgraded");
        return; // do not return a Response
      }
      return new Response("Upgrade failed", { status: 500 });
    },
    websocket: {
        message(ws, message) {
            prismaClient.user.create({
                data: {
                    username: Math.random().toString(),
                    password: Math.random().toString()
                }
            })
            ws.send(message);
        },
    },
});