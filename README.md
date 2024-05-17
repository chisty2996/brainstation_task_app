# brainstation_task_app

An app for Brainstation-23 Task

BrainStation Task App
This is a Flutter application developed as a task for BrainStation. The application demonstrates the use of Flutter with various features, including state management using Bloc, network requests using Dio, and a clean architecture approach.

Table of Contents
Features
Installation
Usage
Project Structure
Dependencies
Contributing
License
Features
Fetch and display repositories from GitHub.
Search and filter repositories.
Paginated data loading.
Error handling and displaying appropriate messages.
Clean architecture with separation of concerns.


Installation
To run this project, follow these steps:

Clone the repository:

Copy code
git clone https://github.com/yourusername/brainstation_task_app.git
cd brainstation_task_app
Install dependencies:

sh
Copy code
flutter pub get
Run the app:

Open the project in Android Studio.
Ensure you have an emulator running or a physical device connected.
Click the 'Run' button or use the command:
sh
Copy code
flutter run
Usage
Home Screen:

Displays a list of repositories fetched from GitHub.
Scroll to the bottom to load more data.
Tap to see details of each repository

Use the search bar to filter repositories by keyword.
Project Structure
The project follows a clean architecture structure:

core: Contains common utilities, constants, and base classes used throughout the project.
features: Contains feature-specific code, separated into subdirectories:
home: Manages the home screen with repository listings.
data: Contains data models and API services.
domain: Contains entities, repositories, and use cases.
presentation: Contains the UI and state management (Bloc) code.
Example directory structure:

lua
Copy code
lib/
|-- core/
|   |-- constants/
|   |-- resources/
|-- features/
|   |-- home/
|       |-- data/
|       |-- domain/
|       |-- presentation/
|-- main.dart
Dependencies
The project uses the following dependencies:

Flutter
flutter_bloc
dio
equatable
To see the full list of dependencies, refer to the pubspec.yaml file.

Contributing
Contributions are welcome! Please fork the repository and create a pull request with your changes. For major changes, please open an issue first to discuss what you would like to change.

Fork the repository.
Create a new branch (git checkout -b feature-branch).
Commit your changes (git commit -am 'Add some feature').
Push to the branch (git push origin feature-branch).
Create a new Pull Request.
License
This project is licensed under the MIT License - see the LICENSE file for details.
