import 'package:flutter/foundation.dart';
import 'package:app_productos_flutter/models/catalog.dart';

class CarritoModelo extends ChangeNotifier {
  late CatalogoModelo _catalogo;
  final List<int> _idsArticulos = [];
  final Map<int, int> _cantidadArticulos = {};

  CatalogoModelo get catalogo => _catalogo;

  set catalogo(CatalogoModelo nuevoCatalogo) {
    _catalogo = nuevoCatalogo;
    notifyListeners();
  }

  List<Articulo> get items => _idsArticulos.map((id) {
        return CatalogoModelo.getArticulos()
            .firstWhere((articulo) => articulo.id == id);
      }).toList();

  List<Articulo> get itemsUnicos {
    final setDeIds = _idsArticulos.toSet();
    final listaDeArticulos = setDeIds.map((id) {
      return CatalogoModelo.getArticulos()
          .firstWhere((articulo) => articulo.id == id);
    }).toList();
    return listaDeArticulos;
  }

  int get precioTotal =>
      items.fold(0, (total, actual) => total + actual.precio);

  int getCantidad(Articulo articulo) {
    return _cantidadArticulos[articulo.id] ?? 0;
  }

  void agregar(Articulo articulo) {
    _idsArticulos.add(articulo.id);
    if (_cantidadArticulos.containsKey(articulo.id)) {
      _cantidadArticulos[articulo.id] =
          (_cantidadArticulos[articulo.id] ?? 0) + 1;
    } else {
      _cantidadArticulos[articulo.id] = 1;
    }
    notifyListeners();
  }

  void eliminar(Articulo articulo) {
    _idsArticulos.remove(articulo.id);
    if (_cantidadArticulos.containsKey(articulo.id)) {
      if (_cantidadArticulos[articulo.id]! > 0) {
        _cantidadArticulos[articulo.id] =
            (_cantidadArticulos[articulo.id]! - 1);
      }
    }
    notifyListeners();
  }
}
