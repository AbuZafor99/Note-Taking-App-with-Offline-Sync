import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';
import '../widgets/note_card.dart';
import 'note_edit_screen.dart';

class NoteListScreen extends GetView<NoteController> {
  const NoteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          Obx(
            () => Switch(
              value: controller.isDarkMode.value,
              onChanged: (value) => controller.toggleDarkMode(),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Obx(() {
        if (controller.notes.isEmpty) {
          return const Center(
            child: Text(
              'No notes yet. Add one!',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.notes.length,
          itemBuilder: (context, index) {
            final note = controller.notes[index];
            return NoteCard(
              note: note,
              onTap: () =>
                  Get.to(() => NoteEditScreen(note: note, index: index)),
              onDelete: () => controller.deleteNote(index),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => NoteEditScreen()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
