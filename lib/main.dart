import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:students/screen/db/functions/db_funtions.dart';
import 'package:students/screen/db/models/dart_models.dart';
import 'package:students/screen/splash_screen.dart';


Future <void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(StudentModelAdapter().typeId))
  {
   Hive.registerAdapter(StudentModelAdapter()); 
  }
  await getAllstudent();
  runApp(const MyApp());
}

  class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
 
 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    
    home:Splash_Screen(),
    );

  }
}