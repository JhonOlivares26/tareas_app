import 'package:flutter/material.dart';
import 'package:tareas_app/controller/TareaProvider.dart';
import 'package:tareas_app/view/pages/listTareasPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TareaProvider()),
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  String title = "Tareas";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: listTareaPage(),
      ),
    );
  }
}
