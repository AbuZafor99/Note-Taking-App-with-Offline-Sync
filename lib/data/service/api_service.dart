import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:note_taking_app_with_offline_sync/data/models/note_model.dart';
import '../../ui/utils/app_constants.dart';


class ApiService {
  Future<bool> syncNote(Note note) async {
    try {
      final response = await http.post(
        Uri.parse(AppConstants.notesApiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': note.title,
          'body': note.content,
          'userId': 1,
        }),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
