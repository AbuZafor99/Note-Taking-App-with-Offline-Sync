import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note_model.dart';

class NoteLocalDataSource {
  static const _notesKey = 'notes_key';
  static const _darkModeKey = 'dark_mode_key';

  Future<List<Note>> getNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_notesKey);
    if (jsonString != null) {
      List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => Note.fromJson(json)).toList();
    }
    return [];
  }

  Future<void> saveNotes(List<Note> notes) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = notes.map((note) => note.toJson()).toList();
    final jsonString = json.encode(jsonList);
    await prefs.setString(_notesKey, jsonString);
  }

  Future<bool> getDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_darkModeKey) ?? false;
  }

  Future<void> setDarkMode(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_darkModeKey, isDarkMode);
  }
}
