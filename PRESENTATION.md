# LearnHub - Online Learning Mobile Application

---

## 🎓 Western University
### Master of Computer Science

| | |
|---|---|
| **Subject** | Mobile Application Development |
| **Teacher** | Lakhena Keo |
| **Student** | CHUON Phearak |
| **Project** | Online Learning Course |
| **Semester** | IV |

---

## 📋 Table of Contents

1. [Project Overview](#project-overview)
2. [Features](#features)
3. [Technology Stack](#technology-stack)
4. [Architecture](#architecture)
5. [Course Content](#course-content)
6. [Screenshots](#screenshots)
7. [Future Enhancements](#future-enhancements)

---

## 🎯 Project Overview

### What is LearnHub?

**LearnHub** is a modern, cross-platform mobile learning application built with Flutter. It provides users with access to technology courses, video lessons, and interactive quizzes to enhance their learning experience.

### Problem Statement

- Traditional learning platforms are often complex and overwhelming
- Need for a lightweight, offline-capable learning solution
- Demand for bilingual support (English/Khmer) for local accessibility

### Solution

A streamlined mobile app that offers:
- Curated technology courses
- YouTube-integrated video lessons
- Interactive quizzes for knowledge assessment
- Progress tracking and achievements
- Bilingual support (English & Khmer)

---

## ✨ Features

### 🏠 Home Screen
- Featured courses carousel
- Course categories
- Quick access to recent courses
- Search functionality

### 📚 Course Management
- 15 comprehensive technology courses
- Course details with lessons and quizzes
- Difficulty levels (Beginner, Intermediate, Advanced)
- Instructor information and ratings

### 🎬 Video Lessons
- YouTube video integration
- 78 video lessons across all courses
- Progress tracking per lesson
- Web-compatible video player

### 📝 Interactive Quizzes
- 15 quizzes with 75+ questions
- Multiple choice format
- Instant feedback on answers
- Score tracking and history

### 👤 User Profile
- Learning progress dashboard
- Completed courses tracking
- Quiz scores and achievements
- Dark/Light mode toggle

### 🌐 Bilingual Support
- English and Khmer languages
- Localized course content
- Accessible to local learners

---

## 🛠 Technology Stack

### Framework
| Technology | Purpose |
|------------|---------|
| **Flutter 3.x** | Cross-platform UI framework |
| **Dart** | Programming language |

### State Management
| Package | Purpose |
|---------|---------|
| **Provider** | State management solution |
| **ChangeNotifier** | Reactive state updates |

### Data Storage
| Package | Purpose |
|---------|---------|
| **Hive** | Local NoSQL database |
| **SharedPreferences** | Settings persistence |
| **JSON Assets** | Course data storage |

### UI/UX
| Package | Purpose |
|---------|---------|
| **Google Fonts** | Typography |
| **Cached Network Image** | Image caching |
| **Percent Indicator** | Progress visualization |
| **Flutter Staggered Animations** | Smooth animations |

### Media
| Package | Purpose |
|---------|---------|
| **YouTube Player Flutter** | Video playback |
| **Iframe (Web)** | Web-compatible video |

---

## 🏗 Architecture

### Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── course.dart
│   ├── lesson.dart
│   ├── quiz.dart
│   └── user_progress.dart
├── providers/                # State management
│   ├── course_provider.dart
│   ├── progress_provider.dart
│   └── settings_provider.dart
├── screens/                  # UI screens
│   ├── splash_screen.dart
│   ├── main_navigation.dart
│   ├── home/
│   ├── courses/
│   ├── lesson/
│   ├── quiz/
│   └── profile/
├── services/                 # Business logic
│   ├── data_service.dart
│   └── storage_service.dart
├── utils/                    # Utilities
│   ├── app_theme.dart
│   └── constants.dart
└── widgets/                  # Reusable widgets
    ├── course_card.dart
    └── custom_widgets.dart
```

### Data Flow

```
┌─────────────────┐
│   JSON Assets   │
│  (Course Data)  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Data Service   │
│  (Load & Parse) │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│    Providers    │
│ (State Mgmt)    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   UI Widgets    │
│   (Screens)     │
└─────────────────┘
```

### Design Patterns

- **Provider Pattern** - Centralized state management
- **Repository Pattern** - Data abstraction layer
- **Singleton Pattern** - Storage service instance
- **Consumer Pattern** - Reactive UI updates

---

## 📖 Course Content

### Available Courses (15 Total)

| # | Course Name | Difficulty | Lessons |
|---|-------------|------------|---------|
| 1 | Flutter Development | Beginner | 5 |
| 2 | Python Programming | Beginner | 4 |
| 3 | Web Development | Intermediate | 5 |
| 4 | JavaScript Fundamentals | Beginner | 5 |
| 5 | UI/UX Design Basics | Beginner | 4 |
| 6 | AI & Machine Learning | Advanced | 6 |
| 7 | Cybersecurity Fundamentals | Intermediate | 5 |
| 8 | Data Science & Analytics | Intermediate | 6 |
| 9 | Cloud Computing (AWS) | Intermediate | 5 |
| 10 | Full-Stack Development | Intermediate | 6 |
| 11 | DevOps & SRE | Advanced | 6 |
| 12 | Mobile App Development | Intermediate | 5 |
| 13 | Advanced UI/UX Design | Intermediate | 5 |
| 14 | Blockchain Technology | Advanced | 5 |
| 15 | IT Project Management | Beginner | 5 |

### Content Statistics

- **Total Courses:** 15
- **Total Lessons:** 78
- **Total Quizzes:** 15
- **Total Quiz Questions:** 75+
- **Languages:** English & Khmer

---

## 📸 Screenshots

### App Screens

| Screen | Description |
|--------|-------------|
| **Splash Screen** | App loading with branding |
| **Home Screen** | Featured courses and categories |
| **Course List** | Browse all available courses |
| **Course Detail** | Lessons, quizzes, and info |
| **Video Player** | YouTube lesson playback |
| **Quiz Screen** | Interactive assessments |
| **Profile** | User progress and settings |

---

## 🚀 How to Run

### Prerequisites
- Flutter SDK 3.0+
- Dart SDK
- Chrome (for web) or Android/iOS emulator

### Installation

```bash
# Clone or navigate to project
cd OnlinelearningCourse

# Install dependencies
flutter pub get

# Run on Chrome (Web)
flutter run -d chrome

# Run on Android
flutter run -d android

# Run on iOS
flutter run -d ios
```

---

## 🔮 Future Enhancements

### Phase 2 Features
- [ ] User authentication (Firebase)
- [ ] Cloud sync for progress
- [ ] Certificate generation
- [ ] Course bookmarking
- [ ] Offline video download

### Phase 3 Features
- [ ] Live classes integration
- [ ] Discussion forums
- [ ] Instructor dashboard
- [ ] Payment integration
- [ ] Push notifications

---

## 👨‍💻 Technical Highlights

### Key Implementations

1. **Cross-Platform Compatibility**
   - Single codebase for iOS, Android, and Web
   - Platform-specific video player handling

2. **Offline-First Design**
   - Local JSON data storage
   - Hive database for user progress
   - Cached network images

3. **Responsive UI**
   - Adaptive layouts
   - Dark/Light theme support
   - Smooth animations

4. **Clean Architecture**
   - Separation of concerns
   - Reusable components
   - Maintainable codebase

---

## 📊 Project Summary

| Metric | Value |
|--------|-------|
| **Framework** | Flutter 3.x |
| **Language** | Dart |
| **Platforms** | iOS, Android, Web |
| **Courses** | 15 |
| **Lessons** | 78 |
| **Quizzes** | 15 |
| **State Management** | Provider |
| **Local Storage** | Hive + SharedPreferences |

---

## 🙏 Thank You!

### Questions?

**LearnHub** - Empowering learners with accessible technology education.

---

## 📝 Project Information

| | |
|---|---|
| **University** | Western University |
| **Program** | Master of Computer Science |
| **Subject** | Mobile Application Development |
| **Teacher** | Lakhena Keo |
| **Student** | CHUON Phearak |
| **Project** | Online Learning Course |

---

*Developed as part of Mobile Application Development Course - Semester IV*
