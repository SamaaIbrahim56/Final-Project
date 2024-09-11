import 'dart:ui';

import 'package:flutter/material.dart';
class Categorys{
  final String image;
  final  String category;
  final  Color color;

  Categorys(this.color, {required this.image,required  this.category});
}
List<Categorys>Category=[

  Categorys(Colors.orange[100]!,image: "https://images.pexels.com/photos/2536009/pexels-photo-2536009.jpeg?auto=compress&cs=tinysrgb&w=600 ",  category: "beauty"),
  Categorys(Colors.grey[400]!,image: "https://images.pexels.com/photos/23230649/pexels-photo-23230649/free-photo-of-studio-shot-of-a-woman-in-a-yellow-shirt-holding-a-bottle-of-perfume.jpeg?auto=compress&cs=tinysrgb&w=600 ",  category: "fragrances"),
  Categorys(Colors.yellow[100]!,image: "https://images.pexels.com/photos/3097112/pexels-photo-3097112.jpeg?auto=compress&cs=tinysrgb&w=600 ",  category:"furniture"),
  Categorys(Colors.brown[700]!,image:"https://images.pexels.com/photos/219794/pexels-photo-219794.jpeg?auto=compress&cs=tinysrgb&w=600 ",  category: "groceries"),
];
