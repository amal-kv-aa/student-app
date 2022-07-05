import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:students/screen/db/functions/db_funtions.dart';
import 'package:students/screen/db/models/details.dart';
import 'package:students/screen/search_screen.dart';
import 'package:students/screen/submit_screen.dart';
import 'db/models/dart_models.dart';
import 'db/models/edit.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key);
  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 247, 244, 246),
      appBar: appbar(context),
      body: getbody(context),
      floatingActionButton: button(context),
    );
  }
  
}

appbar(BuildContext context){
  return AppBar(
    backgroundColor:const Color.fromARGB(255, 94, 23, 70),
    title: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
  );
}

getbody(BuildContext context) {
  
  return 
     ValueListenableBuilder(valueListenable: studentListNotifier,
     builder: (BuildContext ctx , List<StudentModel> studentList, Widget? child){
       return ListView.separated(itemBuilder: (ctx,index){
         final data=studentList[index];
        return ListTile(
          tileColor:const Color.fromARGB(255, 184, 142, 168),
          textColor: Colors.white,
          title: Text(data.name,style: const TextStyle(fontSize: 25),),
          subtitle: Row(
            children: [
              IconButton(onPressed: ()async{
                if(data.id!=null)
                {
                 await deleteStudent(data.id!);
                }
              }, icon: const Icon(Icons.delete,color: Colors.red,)),
               IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> Edit(name: data.name, age: data.age, guardion: data.guardion, number: data.number,id: data.id,image: data.image!,)));
               }, icon: const Icon(Icons.edit,color: Colors.green,)),
            ],
          ),
           trailing:  CircleAvatar(backgroundImage: MemoryImage(Base64Decoder().convert(data.image.toString())),maxRadius: 30, ),
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
        itemCount:studentList.length);
     } ,
       
     ); 
  
}
button(BuildContext context){
  return SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          backgroundColor:const Color.fromARGB(255, 163, 11, 97),
          onPressed: (){
             Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => Submitscreen()));                   
          },child: const Icon(Icons.add),),
      );
}

