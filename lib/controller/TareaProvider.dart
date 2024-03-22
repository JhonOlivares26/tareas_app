import 'package:flutter/foundation.dart';
import 'package:tareas_app/model/Tarea.dart';

class TareaProvider extends ChangeNotifier {
  List<Tarea> _tareas = [];

  List<Tarea> get tareas => _tareas;

  addTarea(Tarea tarea) {
    _tareas.add(tarea);
    notifyListeners();
  }

  void updateTareaCompletion(int index, bool completado) {
    _tareas[index].completado = completado;
    notifyListeners(); // Notificar a los widgets que dependen de este provider
  }
  
  void deleteTarea(int index) {
  _tareas.removeAt(index);
  notifyListeners(); // Notificar a los widgets que dependen de este provider
}
}