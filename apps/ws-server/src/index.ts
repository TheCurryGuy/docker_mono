import { WebSocketServer } from "ws";
import {prisma} from "@repo/db/client"

const Server = new WebSocketServer({
    port: 3001
})

Server.on("connection", async (socket)=>{
    const res = await prisma.user.create({
        data: {
            username: "Hi from ws"+Math.random().toString(),
            password: "Pass"
        }
    })
    socket.send("Hi there from ws server")
})