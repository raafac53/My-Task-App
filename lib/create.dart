import 'package:flutter/material.dart';
import 'package:flutter_application_78/taskaprovider.dart';
import 'package:provider/provider.dart';

class Createscreen extends StatefulWidget {
  const Createscreen({super.key});

  @override
  State<Createscreen> createState() => _CreatescreenState();
}

class _CreatescreenState extends State<Createscreen> {
    TextEditingController controller1=TextEditingController();
    DateTime selecteddate=DateTime.now();
    TimeOfDay timeday=TimeOfDay.now();
    bool finished=false;
    void save(Taskmodel taskmodel){
      context.read<Taskaprovider>().add(taskmodel);
      Navigator.pop(context);

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Add new Task"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9.0,vertical:8),
            child: TextField(
              controller: controller1,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(8),
                )
              ),
            ),
          ),
          Text("selected Date:${selecteddate.month}/${selecteddate.year}/${selecteddate.day}   ${timeday.hour}/${timeday.minute}${timeday.period}"),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed:(){
                showDatePicker(context: context,
                initialDate:selecteddate,
                 firstDate: DateTime(2000), lastDate: DateTime(3000));
              },
               child: Text("Choose Date")),
                ElevatedButton(onPressed: ()async{
                  TimeOfDay?time=await
                  showTimePicker(context: context, initialTime:timeday );
                  if (time!=null) {
                    setState(() {
                      timeday=time;
                      
                    });
                    
                  }
                  
                  


                },
                 child: Text("Choose Time")),
                

              
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Text("finished"),
              IconButton(onPressed: (){
                setState(() {
                  finished=!finished;
                });
              }, icon: Icon(
            finished ? Icons.radio_button_checked : Icons.radio_button_unchecked,)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          
          SizedBox(
            width:double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
              
                  )
                ),
                
                onPressed: ()=>save(Taskmodel(title: controller1.text, date:selecteddate.toString() , finished: finished),), child: Text("save")),
            ),
          )


        ],
      ),
    );
  }
}