import 'package:flutter/material.dart';
import '../../data/app_data.dart';
import '../../data/models/idea_model.dart';


class IdeasListVeiw extends StatefulWidget {
  final List<IdeaModel> ideas;
  final List<Color> itemColors;
  final VoidCallback onItemAdded;

  const IdeasListVeiw({
    super.key,
    required this.ideas,
    required this.itemColors, required this.onItemAdded,
  });

  @override
  State<IdeasListVeiw> createState() => _IdeasListVeiwState();
}

class _IdeasListVeiwState extends State<IdeasListVeiw> {
  late List<IdeaModel> _localIdeas;

  @override
  void initState() {
    super.initState();
    _localIdeas = List.from(widget.ideas); // ننسخ الأفكار عشان نقدر نحذف منها
  }

  void _addToMyLists(IdeaModel idea) {
    setState(() {
      AppData.myLists.add({
        "title": idea.title,
        "items": 0,
        "image": idea.image,
      });
      _localIdeas.remove(idea);
    });
    widget.onItemAdded();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${idea.title} added to My Lists")),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_localIdeas.isEmpty) {
      return const SizedBox();
    }

    return SizedBox(
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _localIdeas.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final idea = _localIdeas[index];
          final color = widget.itemColors[index % widget.itemColors.length];

          return Stack(
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      idea.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.network(idea.image, width: 70),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                right: 55,
                child: GestureDetector(
                  onTap: () => _addToMyLists(idea),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: Colors.black, size: 26),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
