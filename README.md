# LearnHub - Online Learning Mobile App

A lightweight Flutter mobile application that allows users to browse courses, watch YouTube lessons, and take quizzes. All content is stored locally using JSON files.

## Features

### 📚 Course Viewing
- Display list of available courses
- Show course details (title, description, thumbnail, lessons count)
- Filter courses by category
- Search functionality

### 🎬 YouTube Video Lessons
- Embedded YouTube player
- Play/Pause controls
- Fullscreen support
- Resume from last position

### 📝 Quiz Feature
- Multiple-choice quizzes per course
- Submit and view results
- Score tracking
- Retake quizzes

### 📊 User Progress
- Mark lessons as completed
- Track course progress percentage
- Save quiz scores
- Resume last watched lesson

### 🌐 Localization
- English and Khmer language support
- Easy language switching

### 🎨 UI/UX
- Modern Material Design
- Dark/Light mode
- Smooth animations
- Clean and intuitive interface

## Tech Stack

- **Framework**: Flutter 3.x
- **Language**: Dart
- **State Management**: Provider
- **Video Player**: youtube_player_flutter
- **Local Storage**: SharedPreferences
- **Data Format**: JSON files

## Project Structure

```
lib/
├── main.dart
├── models/
│   ├── course.dart
│   ├── lesson.dart
│   ├── quiz.dart
│   └── user_progress.dart
├── providers/
│   ├── course_provider.dart
│   ├── progress_provider.dart
│   └── settings_provider.dart
├── screens/
│   ├── splash_screen.dart
│   ├── main_navigation.dart
│   ├── home/
│   │   └── home_screen.dart
│   ├── courses/
│   │   ├── courses_screen.dart
│   │   └── course_detail_screen.dart
│   ├── lesson/
│   │   └── lesson_player_screen.dart
│   ├── quiz/
│   │   └── quiz_screen.dart
│   └── profile/
│       └── profile_screen.dart
├── services/
│   ├── data_service.dart
│   └── storage_service.dart
├── utils/
│   ├── app_theme.dart
│   └── constants.dart
└── widgets/
    ├── course_card.dart
    └── search_bar_widget.dart

assets/
├── data/
│   ├── course_list.json
│   ├── lesson_list.json
│   └── quiz_data.json
├── fonts/
└── images/
```

## Getting Started

### Prerequisites
- Flutter SDK 3.0+
- Dart SDK
- Android Studio / VS Code
- Android/iOS emulator or physical device

### Installation

1. Clone the repository:
```bash
git clone https://github.com/phearak/onelinelearningcourse.git
cd OnlinelearningCourse
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Building for Production

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

## Configuration

### Adding New Courses
Edit `assets/data/course_list.json` to add new courses.

### Adding New Lessons
Edit `assets/data/lesson_list.json` to add new lessons. Make sure to use valid YouTube video IDs.

### Adding New Quizzes
Edit `assets/data/quiz_data.json` to add new quiz questions.

## Requirements

### Minimum Requirements
- Android 8.0+ (API 26)
- iOS 13+
- 2GB RAM
- 100MB storage

### Recommended
- 4GB RAM
- Stable internet connection (for YouTube videos)

## License

This project is for educational purposes.

## Author

CHUON Phearak
