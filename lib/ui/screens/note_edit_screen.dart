import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/note_model.dart';
import '../controllers/note_controller.dart';
import '../utils/app_colors.dart';


class NoteEditScreen extends StatefulWidget {
  final Note? note;
  final int? index;

  const NoteEditScreen({super.key, this.note, this.index});

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  final NoteController controller = Get.find();

  late TextEditingController titleController;
  late TextEditingController contentController;
  late RxInt selectedColor;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note?.title);
    contentController = TextEditingController(text: widget.note?.content);
    selectedColor = (widget.note?.colorValue ?? Colors.blueGrey.value).obs;
  }

  void saveNote() {
    final newNote = Note(
      id: widget.note?.id,
      title: titleController.text,
      content: contentController.text,
      colorValue: selectedColor.value,
    );
    if (widget.index == null) {
      controller.addNote(newNote);
    } else {
      controller.editNote(widget.index!, newNote);
    }
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'New Note' : 'Edit Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: saveNote,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: contentController,
                decoration: const InputDecoration(
                  hintText: 'Start typing your note...',
                  border: InputBorder.none,
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
            const Divider(),
            _buildColorPicker(),
          ],
        ),
      ),
    );
  }

  Widget _buildColorPicker() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: AppColors.noteColors.map((color) {
          return Obx(
                () => GestureDetector(
              onTap: () => selectedColor.value = color.value,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selectedColor.value == color.value ? Theme.of(context).primaryColor : Colors.transparent,
                    width: 3,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
