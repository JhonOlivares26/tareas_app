import 'package:flutter/foundation.dart';
import 'package:tareas_app/model/Tarea.dart';

class TareaProvider extends ChangeNotifier {
  List<Tarea> _tareas = [];

  List<Tarea> get tareas => _tareas;

  addTarea(Tarea tarea) {
    _tareas.add(tarea);
    notifyListeners();
  }
}