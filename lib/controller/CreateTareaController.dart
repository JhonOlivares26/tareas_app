import 'package:flutter/material.dart';
import 'package:tareas_app/controller/TareaProvider.dart';
import 'package:tareas_app/model/Tarea.dart';

String? validatorTitulo(String? titulo) {
  if (titulo == null || titulo.isEmpty) {
    return "El título es obligatorio";
  }
  return null;
}

String? validatorDescripcion(String? descricion) {
  if (descricion == null || descricion.isEmpty) {
    return "La descrición es obligatoria";
  }
  return null;
}

saveTarea(GlobalKey<FormState> _key,
    {required String? titulo, required String? descricion, required bool? completado, required TareaProvider provider}) {
  // Lógica
  if (_key.currentState!.validate()) {
    _key.currentState!.save();
    if (titulo != null && descricion != null && completado != null) {
      print(titulo);
      Tarea tarea = Tarea(titulo: titulo, descricion: descricion, completado: completado);
      provider.addTarea(tarea);
    }
  }
}