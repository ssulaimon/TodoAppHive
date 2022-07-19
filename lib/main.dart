import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/routes/routes.dart';
import 'package:todo/screen/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('mytodo');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: mainScreen,
    routes: {
      mainScreen: (context) => const MainScreen(),
    },
  ));
}
