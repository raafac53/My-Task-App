import 'package:flutter/material.dart';
import 'package:flutter_application_78/create.dart';
import 'package:flutter_application_78/taskaprovider.dart';
import 'package:provider/provider.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController controller1=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return(
    Scaffold(
           backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          elevation: 5,
          title: 
          const Text("My Daily Tasks"),
        ),
     
        body: ListView.builder(
          itemCount:context.watch<Taskaprovider>().tasklist.length,
          itemBuilder: (BuildContext context, int index) {
          var task=context.watch<Taskaprovider>().tasklist[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                title: Text(task.title),
                subtitle: Text("Date:21/3/2024   Time:11:30pm ${task.date}"),
                leading:IconButton(onPressed: (){}, icon: Icon(task.finished ? Icons.radio_button_checked:Icons.radio_button_unchecked,
                color: Colors.blue,)),
                trailing:IconButton(onPressed:() =>context.read<Taskaprovider>().remove(index), icon: Icon(Icons.delete,color: Colors.red,)), 
                ),
              ),
            ) ;
            
            

          },

          
        ),
    floatingActionButton: FloatingActionButton(onPressed:(){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Createscreen()));
    }, child:Icon(Icons.add,color: Colors.blue,) ,),
      
      
      )
    );
  }
}