import 'package:flutter/material.dart';
import 'package:tareas_app/controller/TareaProvider.dart';
import 'package:tareas_app/controller/CreateTareaController.dart';
import 'package:tareas_app/view/widgets/AppBar.dart';
import 'package:provider/provider.dart';

class CreateTareaPage extends StatefulWidget {
  @override
  State<CreateTareaPage> createState() => _CreateTareaPageState();
}

class _CreateTareaPageState extends State<CreateTareaPage> {
  GlobalKey<FormState> _key = GlobalKey();

  String? titulo = "";
  String? descricion = "";
  bool? completado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Nueva tarea"),
      body: Consumer<TareaProvider>(
          builder: (context, TareaProvider, child) =>
              tareaForm(TareaProvider)),
    );
  }

  Form tareaForm(TareaProvider tareaProvider) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (newValue) => titulo = newValue,
              validator: validatorTitulo,
              decoration: const InputDecoration(
                  labelText: "Titulo", hintText: "Ingrese un título"),
            ),
            TextFormField(
              onChanged: (newValue) => descricion = newValue,
              validator: validatorDescripcion,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  labelText: "Descripción", hintText: "Ingrese una descripción"),
            ),
            CheckboxListTile(
              title: Text("Completado"),
              value: completado,
              onChanged: (newValue) {
                setState(() {
                  completado = newValue!;
                });
              },
            ),
            TextButton(
              onPressed: () => saveTarea(_key,
                  titulo: titulo, descricion: descricion, completado: completado, provider: tareaProvider),
              child: const Text("Guardar tarea"),
            )
          ],
        ),
      ),
    );
  }
}