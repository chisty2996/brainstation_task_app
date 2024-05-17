# BrainStation Task App

This is a Flutter application developed as a task for BrainStation. The application demonstrates the use of Flutter with various features, including state management using Bloc, network requests using Dio, and a clean architecture approach.

## Features

```markdown
- Fetch and display repositories from GitHub.
- Paginated data loading.
- Error handling and displaying appropriate messages.
- Clean architecture with separation of concerns.
- **Details Page**:
  - Displays detailed information about a selected repository, including description, last updated time, visibility, stars count, repo name, repo id, and owner id.
```

## Installation

```markdown
1. **Clone the repository:**
   ```sh
   git clone https://github.com/chisty2996/brainstation_task_app.git
   cd brainstation_task_app
   ```

2. **Install dependencies:**
   ```sh
   flutter pub get
   ```

3. **Run the app:**
   - Open the project in Android Studio.
   - Ensure you have an emulator running or a physical device connected.
   - Click the 'Run' button or use the command:
     ```sh
     flutter run
     ```
```

## Usage

```markdown
1. **Home Screen:**
   - Displays a list of repositories fetched from GitHub.
   - Scroll to the bottom to load more data.

2. **Details Page:**
   - Tap on a repository from the home screen to navigate to the details page.
   - View detailed information about the selected repository, including its description, last updated time, visibility, stars count, repo name, repo id, and owner id.
```

## Project Structure

```markdown
```
lib/
|-- core/
|   |-- constants/
|   |-- resources/
|-- features/
|   |-- home/
|       |-- data/
|       |-- domain/
|       |-- presentation/
|   |-- details/
|       |-- presentation/
|-- main.dart
```
```

## Dependencies

```markdown
The project uses the following dependencies:

- [Flutter](https://flutter.dev/)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [dio](https://pub.dev/packages/dio)
- [equatable](https://pub.dev/packages/equatable)

To see the full list of dependencies, refer to the `pubspec.yaml` file.
```

## Contributing

```markdown
Contributions are welcome! Please fork the repository and create a pull request with your changes. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.
```

## License

```markdown
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```
