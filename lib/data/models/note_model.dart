import 'dart:convert';

class Note {
  int? id;
  String title;
  String content;
  int colorValue;
  bool isSynced;

  Note({
    this.id,
    required this.title,
    required this.content,
    this.colorValue = 0xFF607D8B,
    this.isSynced = false,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'colorValue': colorValue,
      'isSynced': isSynced,
    };
  }
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      colorValue: json['colorValue'],
      isSynced: json['isSynced'] ?? false,
    );
  }
  String toJsonString() {
    return json.encode(toJson());
  }
  static Note fromJsonString(String jsonString) {
    return Note.fromJson(json.decode(jsonString));
  }
}
