import 'package:flutter/material.dart';

import '../../data/app_data.dart';
import '../widjets/bottom_navigation_bar.dart';
import '../widjets/ideas_listveiw.dart';
import '../widjets/list_item_card.dart';
import 'add_item_page.dart';

class MyListsPage extends StatefulWidget {
  const MyListsPage({super.key});

  @override
  State<MyListsPage> createState() => _MyListsPageState();
}

class _MyListsPageState extends State<MyListsPage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ideas = AppData.ideas;
    final myLists = AppData.myLists;
    final itemColors = AppData.itemColors;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Lists",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 30),
            onPressed: () async {
              final result = await Navigator.push<Map<String, dynamic>>(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNewListPage(),
                ),
              );

              if (result != null) {
                setState(() {
                  AppData.myLists.add(result);
                });
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: myLists.length,
              itemBuilder: (context, index) {
                final list = myLists[index];
                return ListItemCard(
                  list: list,
                  onUpdate: (updatedList) {
                    setState(() {
                      AppData.myLists[index] = updatedList;
                    });
                  },
                  onDelete: () {
                    setState(() {
                      AppData.myLists.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),


          // ✅ إظهار List Ideas فقط لو القائمة فاضية
          if (myLists.isEmpty) ...[
            const Padding(
              padding: EdgeInsets.only(right: 300),
              child: Text(
                "Lists ideas",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 12),
            IdeasListVeiw(
              ideas: ideas,
              itemColors: itemColors,
              onItemAdded: (){
                setState(() {

                });
              },
            ),
            const SizedBox(height: 16),
          ],

          const Divider(height: 0.1, thickness: 1),
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
