import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:app_productos_flutter/models/cart.dart';
import 'package:app_productos_flutter/models/catalog.dart';

class MiCatalogo extends StatelessWidget {
  const MiCatalogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MiAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const _MiElementoLista();
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}

class _MiAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text(
        'Productos',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      floating: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => context.go('/catalogo/carrito'),
        ),
      ],
    );
  }
}

class _MiElementoLista extends StatelessWidget {
  const _MiElementoLista();

  @override
  Widget build(BuildContext context) {
    List<Articulo> articulos = CatalogoModelo.getArticulos();

    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      children: articulos.map((articulo) {
        var isInCart = context.select<CarritoModelo, bool>(
          (cart) => cart.items.contains(articulo),
        );
        return SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 10.0,
          child: Center(
            child: Column(
              children: [
                articulo.imagen,
                const SizedBox(height: 24),
                Text(
                  articulo.nombre,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '\$${articulo.precio}',
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                TextButton(
                  onPressed: () {
                    context.read<CarritoModelo>().agregar(articulo);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Articulo agregado'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: isInCart
                      ? const Text('Agregar más')
                      : const Text('Agregar'),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
