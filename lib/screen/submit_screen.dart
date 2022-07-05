import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:students/screen/db/functions/db_funtions.dart';
import 'package:students/screen/db/models/dart_models.dart';
import 'package:students/screen/home_screen.dart';
import 'package:image_picker/image_picker.dart';

class Submitscreen extends StatefulWidget {
Submitscreen({Key? key}) : super(key: key);

  @override
  State<Submitscreen> createState() => SubmitscreenState();
}

class SubmitscreenState extends State<Submitscreen> {
 
  String image='';
  
  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _guardianController = TextEditingController();

  final _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: sub_body(),
      bottomNavigationBar: footer(),
    );
  } 
   sub_body() {
    return Container(
      color: Color.fromARGB(255, 255, 248, 253),
      child: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 60, right: 60, bottom: 1, top: 10),
            child:image.isNotEmpty
                ? CircleAvatar(backgroundImage:MemoryImage(Base64Decoder().convert(image)),maxRadius: 70,)
                : CircleAvatar(
                    maxRadius: 90,
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                              addimage();
                              },
                              icon: const Icon(
                                Icons.person,
                                size: 90,
                                color: Color.fromARGB(255, 123, 118, 118),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(onPressed: (){
                            addimage();
                          }, icon: Icon(Icons.add,color: Color.fromARGB(255, 66, 66, 66),))
                        ],
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 20, top: 10),
            child: Container(
              child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'enter your name',
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Color.fromARGB(255, 146, 104, 125),
                      contentPadding: EdgeInsets.all(10.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 20, top: 10),
            child: Container(
              child: TextField(
                controller: _ageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )),
                  hintText: 'age',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor:Color.fromARGB(255, 146, 104, 125),
                  contentPadding: EdgeInsets.all(10.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 20, top: 10),
            child: TextField(
                controller: _guardianController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'guardian name',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Color.fromARGB(255, 146, 104, 125),
                  contentPadding: EdgeInsets.all(10.0),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 20, top: 10),
            child: Container(
              child: TextField(
                  controller: _numberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: 'mobile number',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor:Color.fromARGB(255, 146, 104, 125),
                    contentPadding: EdgeInsets.all(10.0),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 20, top: 10),
            child: SizedBox(
              child: ElevatedButton(
                  onPressed: () {
                    onAddstudentButtonClicked();
                  },
                  child: const Text('Submit')),
            ),
          ),
        ],
      ),
    );
  }

  footer() {
    return Container(
      height: 70,
      color: Color.fromARGB(255, 80, 4, 65),
    );
  }

  Future<void> onAddstudentButtonClicked() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _number = _numberController.text.trim();
    final _guardion = _guardianController.text.trim();

    if (_name.isEmpty ||
        _age.isEmpty ||
        _number.isEmpty ||
        _guardion.isEmpty ||
        image.isEmpty) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('field is requid'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Dismiss',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            );
          });
      return;
    }
    print('object');
    final _student = StudentModel(
        name: _name,
        age: _age,
        guardion: _guardion,
        number: _number,
        image: image
        );
  await  addstudent(_student);
    Navigator.pop(context);
  }
  addimage() async{
     
    final pickimage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickimage == null) {
      return;
    }
        final   bytes = File(pickimage.path).readAsBytesSync();
       setState(() {
         image = base64Encode(bytes);
       }); 
    return  image;
  }
}
