import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Drink extends Equatable {
  final int id;
  final String name;
  final Image image;

  const Drink({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];

  static List<Drink> drinks = [
    Drink(id: 0, name: "Matcha tea", image: Image.asset('assets/images/matcha.png')),
    Drink(id: 1, name: "Thai tea", image: Image.asset('assets/images/thai.png')),
  ];
}
