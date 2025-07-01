import 'package:flutter/material.dart';

import 'mylists/persentation/pages/add_item_page.dart';
import 'mylists/persentation/pages/my_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyListsPage(),
    );
  }
}




