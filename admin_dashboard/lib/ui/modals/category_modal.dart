import 'dart:ui';

import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_input.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryModal extends StatefulWidget {
  final Categoria? categoria;

  CategoryModal({Key? key, this.categoria}) : super(key: key);

  @override
  _CategoryModalState createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String? id;
  String nombre = '';

  @override
  void initState() {
    super.initState();
    this.id = widget.categoria?.id;
    this.nombre = widget.categoria?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final _categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);

    return Container(
        padding: EdgeInsets.all(20.0),
        height: 500.0,
        width: 300.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            color: Color(0xff0f2041),
            boxShadow: [BoxShadow(color: Colors.black26)]),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              widget.categoria?.nombre ?? 'Nueva categoría',
              style: CustomLabels.h1.copyWith(color: Colors.white),
            ),
            IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.close_outlined, color: Colors.white)),
          ]),
          Divider(color: Colors.white.withOpacity(0.3)),
          SizedBox(height: 20.0),
          TextFormField(
              initialValue: widget.categoria?.nombre ?? '',
              onChanged: (value) => this.nombre = value,
              decoration: CustomInputs.loginInputDecoration(
                  hint: 'Nombre de categoría',
                  label: 'Categoría',
                  icon: Icons.add_box_outlined),
              style: TextStyle(color: Colors.white)),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30.0),
            child: CustomOutlinedButton(
                onPress: () async {
                  try {
                    if (id == null) {
                      // Crear
                      await _categoriesProvider.newCategory(this.nombre);
                      NotificationsService.showSnackbar(
                          'Categoría $nombre fue creada correctamente');
                    } else {
                      // Actualizar
                      await _categoriesProvider.updateCategory(
                          this.id!, this.nombre);
                      NotificationsService.showSnackbar(
                          'Categoría $nombre fue actualizada correctamente');
                    }
                    Navigator.of(context).pop();
                  } catch (e) {
                    NotificationsService.showSnackbarError('Error');
                    Navigator.of(context).pop();
                  }
                },
                text: 'Guardar'),
          )
        ]));
  }
}
