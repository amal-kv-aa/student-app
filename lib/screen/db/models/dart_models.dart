
import 'package:hive_flutter/adapters.dart';
part 'dart_models.g.dart';

@HiveType(typeId: 1)
class StudentModel{
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String guardion;
  @HiveField(4)
  final String number;
  @HiveField(5)
  final String?  image;  
  StudentModel({
  required this.name,
  required this.age,
  required this.guardion,
  required this.number,
  this.id,this.image});    
}
