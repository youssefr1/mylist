import 'package:flutter/material.dart';

class EditListPage extends StatefulWidget {
  final Map<String, dynamic> list;

  const EditListPage({super.key, required this.list});

  @override
  State<EditListPage> createState() => _EditListPageState();
}

class _EditListPageState extends State<EditListPage> {
  late TextEditingController _titleController;
  int? _selectedImageIndex;

  final List<String> imageUrls = [
    "https://cdn-icons-png.flaticon.com/512/1995/1995574.png",
    "https://cdn-icons-png.flaticon.com/512/2917/2917995.png",
    "https://cdn-icons-png.flaticon.com/512/2920/2920067.png",
    "https://cdn-icons-png.flaticon.com/512/1010/1010040.png",
    "https://cdn-icons-png.flaticon.com/512/2331/2331970.png",
    "https://cdn-icons-png.flaticon.com/512/1998/1998709.png",
  ];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.list["title"]);
    _selectedImageIndex = imageUrls.indexOf(widget.list["image"]);
  }

  void _onSave() {
    if (_titleController.text.isNotEmpty && _selectedImageIndex != null) {
      Navigator.pop(context, {
        "title": _titleController.text,
        "items": widget.list["items"],
        "image": imageUrls[_selectedImageIndex!],
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit List"),
        actions: [
          TextButton(
            onPressed: _onSave,
            child: const Text("Save", style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                itemCount: imageUrls.length,
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
                        child: Image.network(imageUrls[index], fit: BoxFit.contain),
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
