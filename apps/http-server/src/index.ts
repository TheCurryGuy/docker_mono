import express from "express"
import {prisma} from "@repo/db/client"

const app = express();
app.use(express.json());

app.get("/", (req, res)=>{
    return res.json({
        message: "Hi there"
    })
})
app.post("/signup", async (req, res)=>{
    const username = req.body.username;
    const password = req.body.password;
    const response = await prisma.user.create({
        data: {
            username,
            password
        }
    })
    res.json({
        message: "Signup Successfull",
        id: response.id
    })
    return
})

app.listen(8080, ()=>{
    console.log("Server running on 3002")
})