import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_database/controllers/HomeController.dart';
import 'package:local_database/pages/home.dart';
import 'package:local_database/db/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb(); // Initialize the database
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return GetMaterialApp(
      title: 'My Note App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
