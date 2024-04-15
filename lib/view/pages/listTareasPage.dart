import 'package:flutter/material.dart';
import 'package:tareas_app/controller/TareaProvider.dart';
import 'package:tareas_app/view/pages/CreateTareaPage.dart';
import 'package:tareas_app/model/Tarea.dart';
import 'package:tareas_app/view/widgets/AppBar.dart';
import 'package:provider/provider.dart';

class listTareaPage extends StatelessWidget {
  String title = "Listado de tareas";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Lista de tareas"),
      body: Consumer<TareaProvider>(
        builder: (context, tareaProvider, child) {
          return listTareas(tareaProvider);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => loadCreateTareaPage(context),
      ),
    );
  }

  ListView listTareas(TareaProvider tareaProvider) {
  List<Tarea> tareas = tareaProvider.tareas;
  return ListView.builder(
    itemCount: tareas.length,
    itemBuilder: (context, index) {
      Tarea tarea = tareas[index];
      return ListTile(
        title: Text(tarea.titulo),
        subtitle: Text(tarea.descripcion),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _showDeleteConfirmationDialog(context, tareaProvider, index);
              },
            ),
            Checkbox(
              value: tarea.completado,
              onChanged: (newValue) {
                tareaProvider.updateTareaCompletion(index, newValue!);
              },
            ),
          ],
        ),
      );
    },
  );
}

void _showDeleteConfirmationDialog(BuildContext context, TareaProvider tareaProvider, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Eliminar tarea"),
        content: Text("¿Estás seguro de que deseas eliminar esta tarea?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
            },
            child: Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              tareaProvider.deleteTarea(index);
              Navigator.of(context).pop(); // Cerrar el diálogo
            },
            child: Text("Eliminar"),
          ),
        ],
      );
    },
  );
}

  loadCreateTareaPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CreateTareaPage(),
      ),
    );
  }
}