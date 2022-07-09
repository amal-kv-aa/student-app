import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:students/screen/db/models/dart_models.dart';
import 'package:image_picker/image_picker.dart';

class Students with ChangeNotifier {
  final Box<StudentModel> studentbox = Hive.box('student_db');
  final List<StudentModel> _students = [];
  String _img = '';
  Students() {
   getAllstudent();
  }
  get img => _img;
  get student => _students;
  Future<void> add(StudentModel value) async {
    final _id = await studentbox.add(value);
    value.id = _id;
    await studentbox.put(value.id, value);
    _students.addAll(studentbox.values);
    notifyListeners();
  }

  Future<void> getAllstudent() async {
    _students.clear();
    _students.addAll(studentbox.values);
    notifyListeners();
  }

  Future<void> deleteStudent(int id) async {
    studentbox.delete(id);
    await getAllstudent();
  }

  Future<void> updatestudent(int id, StudentModel studentupvalue) async {
    await studentbox.put(id, studentupvalue);
    await getAllstudent();
  }

  addimage(context) async {
    final pickimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickimage == null) {
      return;
    }
    final bytes = File(pickimage.path).readAsBytesSync();
    _img = base64Encode(bytes);
  }
}
