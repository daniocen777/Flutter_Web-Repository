import 'package:flutter/widgets.dart';

import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categories = [];

  void getCategories() async {
    final response = await CafeApi.httpGet("/categorias");
    final CategoriesResponse categoriesResponse =
        CategoriesResponse.fromMap(response);
    this.categories = [...categoriesResponse.categorias];
    notifyListeners();
  }

  Future<void> newCategory(String name) async {
    final data = {'nombre': name};

    try {
      final response = await CafeApi.httpPost('/categorias', data);
      final Categoria category = Categoria.fromMap(response);
      categories.add(category);
      notifyListeners();
    } catch (e) {
      throw 'Error al crear categoría';
    }
  }

  Future<void> updateCategory(String id, String name) async {
    final data = {'nombre': name};

    try {
      await CafeApi.httpPut('/categorias/$id', data);
      this.categories = this.categories.map((category) {
        if (category.id != id) return category;
        category.nombre = name;
        return category;
      }).toList();

      notifyListeners();
    } catch (e) {
      throw 'Error al actualizar categoría';
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
      await CafeApi.httpDelete('/categorias/$id', {});
      this.categories.removeWhere((category) => category.id == id);
      notifyListeners();
    } catch (e) {
      print('ERROR => $e');
    }
  }
}
