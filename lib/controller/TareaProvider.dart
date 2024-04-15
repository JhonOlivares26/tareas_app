import 'package:flutter/foundation.dart';
import 'package:tareas_app/model/Tarea.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TareaProvider extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference tasksCollection = FirebaseFirestore.instance.collection('tasks');

  List<Tarea> _tareas = [];

  List<Tarea> get tareas => _tareas;

  Future<void> addTarea(Tarea tarea) async {
    try {
      await tasksCollection.add(tarea.toMap());
      _tareas.add(tarea);
      notifyListeners();
    } catch (e) {
      print('Error al agregar tarea: $e');
    }
  }

  void updateTareaCompletion(int index, bool completado) {
    _tareas[index].completado = completado;
    notifyListeners();
  }

  void deleteTarea(int index) {
    _tareas.removeAt(index);
    notifyListeners();
  }
}
