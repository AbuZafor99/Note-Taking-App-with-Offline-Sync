import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/local_storage/note_local_data.dart';
import '../../data/models/note_model.dart';
import '../../data/service/api_service.dart';


class NoteController extends GetxController {
  final NoteLocalDataSource _localStorage = NoteLocalDataSource();
  final ApiService _apiService = ApiService();

  final RxList<Note> notes = <Note>[].obs;
  final RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadNotes();
    loadDarkModeState();
  }

  Future<void> loadNotes() async {
    notes.value = await _localStorage.getNotes();
    syncNotes();
  }

  Future<void> loadDarkModeState() async {
    isDarkMode.value = await _localStorage.getDarkMode();
  }

  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
    _localStorage.setDarkMode(isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> addNote(Note note) async {
    notes.add(note);
    await _localStorage.saveNotes(notes);
    await _syncNote(note);
  }

  Future<void> editNote(int index, Note newNote) async {
    notes[index] = newNote;
    await _localStorage.saveNotes(notes);
    await _syncNote(newNote);
  }

  Future<void> deleteNote(int index) async {
    notes.removeAt(index);
    await _localStorage.saveNotes(notes);
  }

  Future<void> _syncNote(Note note) async {
    if (!note.isSynced) {
      final success = await _apiService.syncNote(note);
      if (success) {
        note.isSynced = true;
        await _localStorage.saveNotes(notes);
      }
    }
  }

  void syncNotes() async {
    for (var note in notes) {
      if (!note.isSynced) {
        await _syncNote(note);
      }
    }
  }
}
