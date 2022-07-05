import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:students/screen/db/models/dart_models.dart';

ValueNotifier<List <StudentModel>> studentListNotifier = ValueNotifier([]) ;

Future <void> addstudent(StudentModel value)async
{
final  studentDB= await Hive.openBox<StudentModel>('student_db');
 final _id = await studentDB.add(value);
 value.id =_id;
 await studentDB.put(value.id, value); 
 studentListNotifier.value.add(value);
 studentListNotifier.notifyListeners();
}


Future<void>getAllstudent()async{
final  studentDB = await Hive.openBox<StudentModel>('student_db');
 studentListNotifier.value.clear();
studentListNotifier.value.addAll(studentDB.values);
studentListNotifier.notifyListeners();
} 

Future<void>deleteStudent(int id)async{
  final  studentDB = await Hive.openBox<StudentModel>('student_db');
 studentDB.delete(id);
 await getAllstudent();
}

Future<void>updatestudent(int id,StudentModel studentupvalue )async{
final  studentDB = await Hive.openBox<StudentModel>('student_db');
await  studentDB.put(id,studentupvalue);
await getAllstudent();
}
