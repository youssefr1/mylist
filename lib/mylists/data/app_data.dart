import 'package:flutter/material.dart';
import 'models/idea_model.dart';
import 'models/my_list_model.dart';

class AppData {
  static final List<Color> itemColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  Colors.brown,

  ];

  static final List<IdeaModel> ideas = [
    IdeaModel(
      title: "Essentials",
      image: "https://cdn-icons-png.flaticon.com/512/1995/1995574.png",
    ),
    IdeaModel(
      title: "Medicine",
      image: "https://cdn-icons-png.flaticon.com/512/2917/2917995.png",
    ),
    IdeaModel(
      title: "Electronics",
      image: "https://cdn-icons-png.flaticon.com/512/2920/2920067.png",
    ),
    IdeaModel(
      title: "Furniture",
      image:  "https://cdn-icons-png.flaticon.com/512/1010/1010040.png",
    ),
    IdeaModel(
      title: "Groceries",
      image: "https://cdn-icons-png.flaticon.com/512/2331/2331970.png",
    ),
    IdeaModel(
      title: "Cleaning",
      image: "https://cdn-icons-png.flaticon.com/512/1998/1998709.png",
    ),
  ];

  static void addToMyLists(IdeaModel idea) {
    myLists.add({
      "title": idea.title,
      "items": 0,
      "image": idea.image,
    });
  }

  static final List<String> imageUrls = [
    "https://cdn-icons-png.flaticon.com/512/1995/1995574.png",
    "https://cdn-icons-png.flaticon.com/512/2917/2917995.png",
    "https://cdn-icons-png.flaticon.com/512/2920/2920067.png",
    "https://cdn-icons-png.flaticon.com/512/1010/1010040.png",
    "https://cdn-icons-png.flaticon.com/512/2331/2331970.png",
    "https://cdn-icons-png.flaticon.com/512/1998/1998709.png",
  ];

  static List<Map<String, dynamic>> myLists = [];
}
