class Note {
  int id;
  String title;
  String content;
  String dateTimeEdited;
  String dateTimeCreated;

  Note(
      {required this.id,
      required this.title,
      required this.content,
      required this.dateTimeEdited,
      required this.dateTimeCreated});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "dateTimeEdited": dateTimeEdited,
      "dateTimeCreated": dateTimeCreated,
    };
  }
}
