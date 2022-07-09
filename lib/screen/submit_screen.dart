import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students/screen/db/functions/db_funtions.dart';
import 'package:students/screen/db/models/dart_models.dart';


class SubmitScreen extends StatelessWidget {
  SubmitScreen({Key? key}) : super(key: key);


  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _guardianController = TextEditingController();
  final _numberController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
   
     final image = context.watch<Students>().img;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: const Color.fromARGB(255, 255, 248, 253),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 60, right: 60, bottom: 1, top: 10),
              child: image.isNotEmpty
                  ? CircleAvatar(
                      backgroundImage:
                          MemoryImage(const Base64Decoder().convert(context.watch<Students>().img.toString())),
                      maxRadius: 70,
                    )
                  : CircleAvatar(
                      maxRadius: 90,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                              context.read<Students>().addimage(context);
                                },
                                icon: const Icon(
                                  Icons.person,
                                  size: 90,
                                  color: Color.fromARGB(255, 123, 118, 118),
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                onPressed: () {
                               context.read<Students>().addimage(context);
                                },
                                icon:const Icon(
                                  Icons.add,
                                  color: Color.fromARGB(255, 66, 66, 66),
                                ))
                          ],
                        ),
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 20, top: 10),
              child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                      hintText: 'enter your name',
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Color.fromARGB(255, 146, 104, 125),
                      contentPadding: EdgeInsets.all(10.0))),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 20, top: 10),
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
                  fillColor: Color.fromARGB(255, 146, 104, 125),
                  contentPadding: EdgeInsets.all(10.0),
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
                  )),),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 20, top: 10),
              child: TextField(
                  controller: _numberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: 'mobile number',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color.fromARGB(255, 146, 104, 125),
                    contentPadding: EdgeInsets.all(10.0),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 20, top: 10),
              child: SizedBox(
                child: ElevatedButton(
                    onPressed: () {
                      onAddstudentButtonClicked(context,image);
                    },
                    child: const Text('Submit')),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        color:const Color.fromARGB(255, 80, 4, 65),
      ),
    );
  }

  Future<void> onAddstudentButtonClicked(BuildContext context,image) async {
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
    final _student = StudentModel(
        name: _name,
        age: _age,
        guardion: _guardion,
        number: _number,
        image: image);
   await Provider.of<Students>(context,listen: false).add(_student);
    Navigator.pop(context);  
   }
  
}
