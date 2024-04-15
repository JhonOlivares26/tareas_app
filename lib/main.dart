import 'package:flutter/material.dart';
import 'package:tareas_app/controller/TareaProvider.dart';
import 'package:tareas_app/view/pages/listTareasPage.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Necesario para inicializar Firebase antes de llamar a runApp()
  
  // Se inicializa Firebase con las opciones exportadas por firebase_options.dart
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

