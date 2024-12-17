import Mongoose  from "mongoose";

const mySchema=Mongoose.Schema({
    
    title:{
        type:String,
        require:[true,'title is required'
        ],
       },
       date:{
        type:String,
        require:[true,'dateis required'
    ],
        
    },
    finished:{
        type:Boolean,
        default :false
    }
  
})
const Task=Mongoose.model('task',mySchema);
export default Task;
