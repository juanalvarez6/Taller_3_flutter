import 'package:flutter/material.dart';

class CatalogoModelo {
  static List<Articulo> getArticulos() {
    return [
      Articulo(
          1,
          'Camisa a Rayas',
          Image.asset(
            'assets/images/CamisaR.jpg',
            height: 180,
          ),
          50),
      Articulo(
          2,
          'Pantalón Jean',
          Image.asset(
            'assets/images/pantalonJ.jpg',
            height: 180,
          ),
          40),
      Articulo(
          3,
          'Vestido de Verano',
          Image.asset(
            'assets/images/vestidoV.jpg',
            height: 180,
          ),
          60),
      Articulo(
          4,
          'Chaqueta de cuero',
          Image.asset(
            'assets/images/chaquetaC.jpg',
            height: 180,
          ),
          55),
      Articulo(
          5,
          'Zapatos Elegantes',
          Image.asset(
            'assets/images/zapatosE.jpg',
            height: 180,
          ),
          30),
      Articulo(
          6,
          'Gorro hecho de Lana',
          Image.asset(
            'assets/images/gorroL.jpg',
            height: 180,
          ),
          45),
      Articulo(
          7,
          'Bufanda de Seda',
          Image.asset(
            'assets/images/bufandaS.jpg',
            height: 180,
          ),
          42),
      Articulo(
          8,
          'Blusa Estampada',
          Image.asset(
            'assets/images/blusaE.jpg',
            height: 180,
          ),
          48),
      Articulo(
          9,
          'Traje de Baño',
          Image.asset(
            'assets/images/trajeB.jpg',
            height: 180,
          ),
          70),
      Articulo(
          10,
          'Shorts de Playa',
          Image.asset(
            'assets/images/shortsP.jpg',
            height: 180,
          ),
          38),
      Articulo(
          11,
          'Vestido de Noche',
          Image.asset(
            'assets/images/vestidoN.jpg',
            height: 180,
          ),
          52),
      Articulo(
          12,
          'Sombrero de Sol',
          Image.asset(
            'assets/images/sombreroS.jpg',
            height: 180,
          ),
          65),
      Articulo(
          13,
          'Chaqueta Ligera',
          Image.asset(
            'assets/images/chaquetaL.jpg',
            height: 180,
          ),
          55),
      Articulo(
          14,
          'Blazer Clásico',
          Image.asset(
            'assets/images/blazerC.jpg',
            height: 180,
          ),
          58),
    ];
  }
}

@immutable
class Articulo {
  final int id;
  final String nombre;
  final Image imagen;
  final int precio;

  const Articulo(this.id, this.nombre, this.imagen, this.precio);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Articulo && other.id == id;
}
