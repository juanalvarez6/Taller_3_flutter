import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_productos_flutter/models/cart.dart';

class MiCarrito extends StatelessWidget {
  const MiCarrito({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compras',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: _ListaCarrito(),
            ),
          ),
          _TotalCarrito()
        ],
      ),
    );
  }
}

class _ListaCarrito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var carrito = context.watch<CarritoModelo>();

    return ListView.builder(
      itemCount: carrito.itemsUnicos.length,
      itemBuilder: (context, index) => ListTile(
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle),
          onPressed: () {
            carrito.eliminar(carrito.itemsUnicos[index]);
          },
        ),
        title: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: carrito.itemsUnicos[index].nombre,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text:
                    '\nCantidad: ${context.read<CarritoModelo>().getCantidad(carrito.itemsUnicos[index])}',
                style: const TextStyle(fontSize: 25),
              ),
              TextSpan(
                text: '\nPrecio Und: \$${carrito.itemsUnicos[index].precio}',
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TotalCarrito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CarritoModelo>(
                builder: (context, carrito, child) => Text(
                    'Total: \$${carrito.precioTotal}',
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold))),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('La compra aún no está disponible.')));
              },
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: const Text('COMPRAR'),
            ),
          ],
        ),
      ),
    );
  }
}
