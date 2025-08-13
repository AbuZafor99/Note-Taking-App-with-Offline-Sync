# Note Taking App with Offline Sync

A mobile application demonstrating a note-taking functionality with seamless offline synchronization. This project uses the **GetX** package for efficient state management and follows a structured architectural pattern.

-----

## Features

-   **Create, Read, Update, Delete (CRUD) Notes:** Full functionality to manage your notes.
-   **Offline First:** Notes are stored locally, ensuring access even without an internet connection.
-   **Automatic Synchronization:** Seamlessly syncs notes with a backend service when online.
-   **GetX State Management:** Ensures a reactive UI that updates efficiently.
-   **Local Storage:** Utilizes `shared_preferences` for local data persistence.

-----

## Getting Started

Follow these steps to get a local copy of the project up and running.

### Prerequisites

-   **Flutter SDK:** Ensure the Flutter SDK is installed on your system.
-   **Code Editor:** A code editor like VS Code or Android Studio.

### Installation

1.  Clone the repository:
    ```bash
    git clone https://github.com/AbuZafor99/Note-Taking-App-with-Offline-Sync.git
    ```
2.  Navigate to the project directory:
    ```bash
    cd note_taking_app_with_offline_sync
    ```
3.  Install dependencies:
    ```bash
    flutter pub get
    ```
4.  Run the application:
    ```bash
    flutter run
    ```

-----

## Dependencies

-   **flutter:** The framework for building multi-platform applications.
-   **get:** A powerful state management and navigation library for Flutter.
-   **http:** A package for making HTTP requests, likely for synchronization with a backend.
-   **shared_preferences:** A package for lightweight data storage on the device.
-   **cupertino_icons:** An asset package containing the Cupertino (iOS-style) icons.
