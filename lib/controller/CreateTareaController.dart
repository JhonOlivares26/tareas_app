import 'package:flutter/material.dart';
import 'package:tareas_app/controller/TareaProvider.dart';
import 'package:tareas_app/model/Tarea.dart';

String? validatorTitulo(String? titulo) {
  if (titulo == null || titulo.isEmpty) {
    return "El título es obligatorio";
  }
  return null;
}

String? validatorDescripcion(String? descripcion) {
  if (descripcion == null || descripcion.isEmpty) {
    return "La descripción es obligatoria";
  }
  return null;
}

void saveTarea({
  required GlobalKey<FormState> key,
  required String? titulo,
  required String? descripcion,
  required bool? completado,
  required TareaProvider provider,
}) {
  // Lógica para validar y guardar la tarea
  if (key.currentState!.validate()) {
    key.currentState!.save();
    if (titulo != null && descripcion != null && completado != null) {
      Tarea tarea = Tarea(
        titulo: titulo,
        descripcion: descripcion,
        completado: completado,
      );
      provider.addTarea(tarea); // Llama al método addTarea del TareaProvider
    }
  }
}
