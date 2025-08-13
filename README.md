# Note-Taking App with Offline Sync

## 1. Project Overview

This is a simple yet powerful note-taking application built with Flutter. The app allows users to create, edit, and delete notes seamlessly. It is designed with an offline-first approach, ensuring that all notes are saved locally on the device. Additionally, it features an automatic synchronization mechanism to back up notes to a remote server when a network connection is available. The user interface is clean and intuitive, with support for both light and dark modes.

## 2. Technologies Used

*   **Flutter**: The core framework for building the cross-platform application.
*   **GetX**: A powerful and lightweight state management, dependency injection, and route management library.
*   **http**: A package for making HTTP requests to the remote API for note synchronization.
*   **shared\_preferences**: For local data persistence to store notes and user preferences (like dark mode).
*   **Dart**: The programming language used for Flutter development.

## 3. Features

*   **CRUD Operations**: Create, Read, Update, and Delete notes.
*   **Offline Storage**: All notes are saved locally, so they are accessible even without an internet connection.
*   **Cloud Sync**: Automatically syncs notes with a remote server. A cloud icon indicates the sync status of each note.
*   **Dark Mode**: Toggle between light and dark themes for a comfortable viewing experience.
*   **Customizable Note Colors**: Personalize notes by assigning different colors to them.
*   **Dismissible Notes**: Easily delete notes by swiping them away.

## 4. Architecture

The application follows a clean and scalable architecture, loosely based on the Model-View-Controller (MVC) pattern, with a clear separation of concerns.

*   **Model**: The `Note` class (`lib/data/models/note_model.dart`) represents the data structure for a single note, including its title, content, color, and sync status.
*   **View**: The UI is composed of screens (`lib/ui/screens/`) and widgets (`lib/ui/widgets/`).
    *   `NoteListScreen`: Displays the list of all notes.
    *   `NoteEditScreen`: A screen for creating a new note or editing an existing one.
    *   `NoteCard`: A reusable widget to display a single note in the list.
*   **Controller**: The `NoteController` (`lib/ui/controllers/note_controller.dart`) using GetX handles the application's state and business logic. It manages the list of notes, handles CRUD operations, toggles the theme, and communicates with the data layer.

### Data Flow

The app fetches data from the `NoteLocalDataSource`, which uses `shared_preferences` for local storage. When a note is created or updated, it is first saved locally and then synced with the remote server via the `ApiService`.

## 5. Code Structure

The project is organized into the following directories:

*   `lib/`: The main source code directory.
    *   `data/`: Contains the data layer of the application.
        *   `local_storage/`: Handles local data persistence.
        *   `models/`: Defines the data models (e.g., `Note`).
        *   `service/`: Manages communication with the remote API.
    *   `ui/`: Contains the presentation layer.
        *   `controllers/`: State management and business logic (GetX controllers).
        *   `screens/`: The main screens of the app.
        *   `utils/`: Utility files like color constants.
        *   `widgets/`: Reusable UI components.
    *   `main.dart`: The entry point of the application.
    *   `myapp.dart`: Defines the app's routes and themes.

## 6. Setup Instructions

To set up and run the project locally, follow these steps:

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/your-username/note_taking_app_with_offline_sync.git
    cd note_taking_app_with_offline_sync
    ```

2.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

3.  **Run the app:**
    ```sh
    flutter run
    ```

4.  **Environment Setup:**
    The app uses a placeholder API endpoint from `jsonplaceholder.typicode.com`. To use your own backend, modify the `notesApiUrl` in `lib/ui/utils/app_constants.dart`.

## 7. Dependencies

The project relies on the following external packages:

*   `flutter`: The core Flutter framework.
*   `cupertino_icons`: Provides iOS-style icons.
*   `http`: For making HTTP requests.
*   `get`: For state management, dependency injection, and routing.
*   `shared_preferences`: For local data storage.

## 8. How to Use the App

*   **View Notes**: The main screen displays a list of all your notes.
*   **Add a Note**: Tap the `+` button on the home screen to open the note editor.
*   **Edit a Note**: Tap on any existing note to open it in the editor.
*   **Save a Note**: In the editor, enter a title and content, select a color, and tap the save icon.
*   **Delete a Note**: Swipe a note to the left on the main screen to delete it.
*   **Toggle Dark Mode**: Use the switch in the app bar to toggle between light and dark themes.

## 9. Known Issues or Future Enhancements

*   **No Search Functionality**: The current version does not have a search feature to find specific notes.
*   **API Error Handling**: The API service has basic error handling. This could be improved to provide more specific feedback to the user.
*   **Local Database**: For better performance and scalability, `shared_preferences` could be replaced with a more robust local database solution like `sqflite` or `Hive`.

