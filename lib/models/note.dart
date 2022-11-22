class Note {
  String title;
  String description;
  Note({required this.title, required this.description});

  Map toMap() => {'title': title, 'description': description};

  static Note fromMap(Map map) => Note(
      title: map['title'] as String, description: map['description'] as String);
}
