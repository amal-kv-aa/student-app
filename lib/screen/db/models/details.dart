


import 'dart:convert';

import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String name;
  final String age;
  final String  guardion;
  final String  number;
  final String  image;
  
  const Details({ Key? key,  required this.name,
    required this.age,
    required this.guardion,
    required this. number,
     required this.image
     }) : super(key: key);
   





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:getdetails(),
     bottomNavigationBar: backbtn(context),
    );
  }
  getdetails(){
    return Center(
        child: Container(
          height: 500,
          color:const Color.fromARGB(255, 199, 168, 195),
          child:ListView(
          children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12,bottom: 23),
                child: Text(name.toUpperCase(),style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 30),),
              ),
              
               Padding(
                 padding: const EdgeInsets.all(20),
                 child:CircleAvatar(maxRadius: 70, backgroundImage: MemoryImage(Base64Decoder().convert(image.toString()))) 
               )
            ],
          ),
          Text('Age: $age',style: const TextStyle(color: Colors.black,fontSize: 20),),
          const SizedBox(height: 10,),
          Text('Guardion Name :  $guardion',style: const TextStyle(color: Colors.black,fontSize: 20),),
           const SizedBox(height: 10,),
          Text('Contact Number : $number',style: const TextStyle(color: Colors.black,fontSize: 20),)

        ],)),
      );
  }

  backbtn(BuildContext context){
    return ElevatedButton(onPressed: ()=>Navigator.of(context).pop(), child: const Text('Go back'));
  }
}