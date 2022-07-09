import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:students/screen/db/functions/db_funtions.dart';
import 'package:students/screen/db/models/details.dart';
import 'package:students/screen/search_screen.dart';
import 'package:students/screen/submit_screen.dart';
import 'db/models/edit.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 247, 244, 246),
      appBar: AppBar(
    backgroundColor:const Color.fromARGB(255, 94, 23, 70),
    title: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:[
      const Text(
        'Students Detailes',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color.fromARGB(255, 255, 254, 254),
            fontStyle: FontStyle.italic),
      ),
      IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SearchBar()));
          },
          icon: const Icon(
            Icons.search,
            color: Color.fromARGB(255, 255, 255, 255),
          )),
    ]),
  ),
      body: Consumer<Students>(builder: (context,studentslist,_){
        return 
        ListView.separated(itemBuilder: (ctx,index){
       final data=Provider.of<Students>(context).student[index];
      return ListTile(
        tileColor:const Color.fromARGB(255, 184, 142, 168),
        textColor: Colors.white,
        title: Text(data.name,style: const TextStyle(fontSize: 25),),
        subtitle: Row(
          children: [
            IconButton(onPressed: ()async{
              if(data.id!=null)
              {
               await Provider.of<Students>(context,listen: false).deleteStudent(data.id!);
              }
            }, icon: const Icon(Icons.delete,color: Colors.red,)),
             IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> Edit(name: data.name, age: data.age, guardion: data.guardion, number: data.number,id: data.id,image: data.image!,)));
             }, icon: const Icon(Icons.edit,color: Colors.green,)),
          ],
        ),
         trailing:  CircleAvatar(backgroundImage: MemoryImage(const Base64Decoder().convert(data.image.toString())),maxRadius: 30, ),
        onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>
       Details(
          name: data.name,
          age: data.age, 
          guardion: data.guardion,
          number: data.number,
          image: data.image!,
          ),
          
        )
        );
           }
      );
       },
           separatorBuilder: (ctx,index){
      return const Divider(
        height: 4,
      );
           },
      itemCount:Provider.of<Students>(context).student.length);
         }
      ) ,
      floatingActionButton: 
      SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          backgroundColor:const Color.fromARGB(255, 163, 11, 97),
          onPressed: (){
             Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => SubmitScreen()));                   
          },child: const Icon(Icons.add),),
      ),
    );
  }
  
}


