
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students/screen/db/functions/db_funtions.dart';
import 'package:students/screen/db/models/dart_models.dart';
class Edit extends StatelessWidget {
  final String name;
  final String age;
  final String guardion;
  final String number;
  final int? id;
  final String? image;

   Edit({ Key? key,required this.name,required this.age,required this.guardion,required this.number,required this.id,required this.image
  
     }) : super(key:key);
    final nameUpdateController =TextEditingController();
     final ageUpdateController =TextEditingController();
      final guardionUpdateController =TextEditingController();
       final numberUpdateController =TextEditingController();
      
  @override
  Widget build(BuildContext context) {

nameUpdateController.text = name;
ageUpdateController.text = age;
guardionUpdateController.text=guardion;
numberUpdateController.text=number;

    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 207, 19, 98),
    body: editpage(context),
    );
  }
  editpage(BuildContext context){
    return Center(
      child: Container(
        color: Colors.white,
        height: 500,
        width: double.infinity,
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: ListView(children: [
            CircleAvatar(maxRadius: 70,backgroundImage: MemoryImage(Base64Decoder().convert(image.toString())),),
           const Text('name:'),
           TextField( controller: nameUpdateController, decoration:const InputDecoration(
           ),),
            const Text('age:'),
           TextField(controller: ageUpdateController, decoration:const InputDecoration(
             
           ),),
           const Text('guardion name:'),
           TextField(controller: guardionUpdateController,decoration:const InputDecoration(
            
           ),),
          const  Text('mobile number:'),
           TextField(controller: numberUpdateController,decoration:const InputDecoration(
            
           ),),
          const SizedBox(height: 10,),
           ElevatedButton(onPressed: () async {
           studentupdate(context);
           
           }, child:const Text('update'))
         ],),
       ), 
      ),
    );
  }
  Future<void>studentupdate(BuildContext context)async{
    final name =nameUpdateController.text;
    final age=ageUpdateController.text;
    final guardion=guardionUpdateController.text;
    final number=numberUpdateController.text;
    if(name.isEmpty||age.isEmpty||guardion.isEmpty||number.isEmpty){
      return;
    }
    final studentupvalues = StudentModel(name: name, age: age, guardion: guardion, number: number,id:id,image: image );
    await Provider.of<Students>(context,listen: false).updatestudent(id!,studentupvalues);
     Navigator.of(context).pop();
  }


}