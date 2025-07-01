class MyListModel {
  final String title;
  final int items;
  final String image;

  MyListModel({
    required this.title,
    required this.items,
    required this.image,
  });
  Map<String, Object> toMap() {
    return {
      'title': title,
      'items': items,
      'image': image,
    };
  }
}