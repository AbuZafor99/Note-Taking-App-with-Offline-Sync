import 'package:get/get.dart';
import 'package:note_taking_app_with_offline_sync/ui/controllers/note_controller.dart';
import 'package:note_taking_app_with_offline_sync/ui/screens/note_edit_screen.dart';
import 'package:note_taking_app_with_offline_sync/ui/screens/note_list_screen.dart';

abstract class AppRoutes {
  static const notes = '/notes';
  static const editNote = '/edit_note';
}

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.notes,
      page: () => const NoteListScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<NoteController>(() => NoteController());
      }),
    ),
    GetPage(
      name: AppRoutes.editNote,
      page: () => const NoteEditScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<NoteController>(() => NoteController());
      }),
    ),
  ];
}

