import express from "express"
import  Mongoose  from "mongoose"
import Task from "./taskmodel.js"
const app=express()
app.use(express.json());


app.get( "/", async(req,res)=>{
    const task=await Task.find()
    res.status(200).json(task)
})
 
app.post("/", async(req,res)=>{
    const{ title, date,finished}=req.body
    const newtask=await Task({
        title,date,finished
    })
    const task=await newtask.save();
    res.status(201).json(task);
})

app.put("/:id", async (req, res) => {
    const { title, date, finished } = req.body;
    const task = await Task.findById(req.params.id); // Corrected method name
    let updatetask;
  
    if (task) {
      task.title = title;
      task.date = date;
      task.finished = finished;
      updatetask = await task.save();
    }
  
    res.status(200).json(updatetask);
  });



app.delete( "/", async(req,res)=>{
    const task=await task.findByidAndDelete(req.params.id)
    
    res.status(200).json({message:"task deleted"})
})



app.use(express.json())
const port=7000
app.listen(port,()=>{
    console.log(`your serve is ${port}`)
})

Mongoose.connect("mongodb+srv://raafac352:raafac352@ecommerce.skrnkag.mongodb.net/mytask?retryWrites=true&w=majority&appName=Ecommerce").then(()=>{
    console.log("connect to database")
})