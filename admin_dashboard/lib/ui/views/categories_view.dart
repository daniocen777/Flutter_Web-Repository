import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/datatables/categories_datasource.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    // listen: true
    final _categories = Provider.of<CategoriesProvider>(context).categories;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        /* ListView => Para hacer un scroll */
        child: ListView(physics: ClampingScrollPhysics(), children: [
          Text('Categorías', style: CustomLabels.h1),
          SizedBox(height: 10.0),
          PaginatedDataTable(
              columns: [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Categorías')),
                DataColumn(label: Text('Creado por')),
                DataColumn(label: Text('Acciones')),
              ],
              source: CategoriesDTS(_categories, context),
              header: Text(
                'Categorías Disponibles',
                maxLines: 2,
              ),
              onRowsPerPageChanged: (value) {
                setState(() {
                  this._rowsPerPage = value ?? 10;
                });
              },
              rowsPerPage: this._rowsPerPage,
              actions: [
                CustomIconButton(
                    onPress: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (_) => CategoryModal(categoria: null));
                    },
                    text: 'Crear',
                    icon: Icons.add_outlined)
              ])
        ]));
  }
}
