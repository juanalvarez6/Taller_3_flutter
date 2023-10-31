import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:app_productos_flutter/models/cart.dart';
import 'package:app_productos_flutter/models/catalog.dart';
import 'package:app_productos_flutter/screens/cart.dart';
import 'package:app_productos_flutter/screens/catalog.dart';

void main() {
  runApp(const MiApp());
}

GoRouter router() {
  return GoRouter(
    initialLocation: '/catalogo',
    routes: [
      GoRoute(
        path: '/catalogo',
        builder: (context, state) => const MiCatalogo(),
        routes: [
          GoRoute(
            path: 'carrito',
            builder: (context, state) => const MiCarrito(),
          ),
        ],
      ),
    ],
  );
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogoModelo()),
        ChangeNotifierProxyProvider<CatalogoModelo, CarritoModelo>(
          create: (context) => CarritoModelo(),
          update: (context, catalogo, carrito) {
            if (carrito == null) throw ArgumentError.notNull('carrito');
            carrito.catalogo = catalogo;
            return carrito;
          },
        ),
      ],
      child: MaterialApp.router(
        title: 'Taller 3',
        routerConfig: router(),
      ),
    );
  }
}
