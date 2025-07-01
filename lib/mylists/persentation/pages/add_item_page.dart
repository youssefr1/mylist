import 'package:flutter/material.dart';
import '../../data/app_data.dart';

class AddNewListPage extends StatefulWidget {
  const AddNewListPage({super.key});

  @override
  State<AddNewListPage> createState() => _AddNewListPageState();
}

class _AddNewListPageState extends State<AddNewListPage> {
  final TextEditingController _titleController = TextEditingController();
  int? _selectedImageIndex;

  void _onSave() {
    if (_titleController.text.isNotEmpty && _selectedImageIndex != null) {
      Navigator.pop(context, {
        "title": _titleController.text,
        "items": 0,
        "image": AppData.imageUrls[_selectedImageIndex!],
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New List"),
        actions: [
          TextButton(
            onPressed: _onSave,
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: "Enter list title",
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: AppData.imageUrls.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.6,
                ),
                itemBuilder: (context, index) {
                  final isSelected = _selectedImageIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedImageIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? Colors.green : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          AppData.imageUrls[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
