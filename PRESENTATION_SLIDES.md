# LearnHub - Presentation Slides
## Copy each slide content to your PowerPoint/Google Slides

---

# SLIDE 1: Title Slide

## LearnHub
### Online Learning Mobile Application

---

🎓 **Western University**

**Master of Computer Science**

---

| | |
|---|---|
| **Subject** | Mobile Application Development |
| **Teacher** | Lakhena Keo |
| **Student** | CHUON Phearak |
| **Semester** | IV |

---

# SLIDE 2: Agenda

## Presentation Outline

1. Introduction & Problem Statement
2. Solution Overview
3. Key Features
4. Technology Stack
5. App Architecture
6. Course Content
7. Demo
8. Future Roadmap
9. Q&A

---

# SLIDE 3: Problem Statement

## The Challenge

❌ Traditional e-learning platforms are complex and overwhelming

❌ Limited offline learning capabilities

❌ Lack of bilingual support for local learners (Khmer)

❌ Fragmented learning experience across platforms

❌ No integrated progress tracking

---

# SLIDE 4: Solution

## Introducing LearnHub

✅ **Lightweight** - Fast and efficient mobile app

✅ **Offline-Ready** - Learn without internet

✅ **Bilingual** - English & Khmer support

✅ **All-in-One** - Courses, Videos, Quizzes

✅ **Progress Tracking** - Monitor your learning journey

---

# SLIDE 5: Key Features (1/2)

## Core Features

### 📚 Course Library
- 15 technology courses
- Beginner to Advanced levels
- Expert instructors

### 🎬 Video Lessons
- 78 YouTube-integrated lessons
- Seamless playback
- Web & mobile compatible

---

# SLIDE 6: Key Features (2/2)

## Core Features

### 📝 Interactive Quizzes
- 75+ multiple choice questions
- Instant feedback
- Score tracking

### 👤 User Profile
- Learning dashboard
- Dark/Light mode
- Progress visualization

---

# SLIDE 7: Technology Stack

## Built With Modern Technologies

| Layer | Technology |
|-------|------------|
| **Framework** | Flutter 3.x |
| **Language** | Dart |
| **State Management** | Provider |
| **Local Database** | Hive |
| **Settings** | SharedPreferences |
| **Video** | YouTube Player |
| **UI** | Material Design 3 |

---

# SLIDE 8: Architecture

## Clean Architecture

```
┌─────────────────────────────────────┐
│           Presentation Layer        │
│    (Screens, Widgets, UI Logic)     │
├─────────────────────────────────────┤
│           Business Layer            │
│     (Providers, State Management)   │
├─────────────────────────────────────┤
│             Data Layer              │
│   (Services, Models, JSON Assets)   │
└─────────────────────────────────────┘
```

---

# SLIDE 9: Project Structure

## Organized Codebase

```
lib/
├── main.dart           # Entry point
├── models/             # Data models (4 files)
├── providers/          # State management (3 files)
├── screens/            # UI screens (8 folders)
├── services/           # Business logic (2 files)
├── utils/              # Utilities (2 files)
└── widgets/            # Reusable components
```

---

# SLIDE 10: Course Categories

## 15 Technology Courses

| Category | Courses |
|----------|---------|
| **Development** | Flutter, Python, JavaScript, Full-Stack, Mobile |
| **Design** | UI/UX Basics, Advanced UI/UX |
| **Data & AI** | Data Science, AI & Machine Learning |
| **Infrastructure** | Cloud Computing, DevOps & SRE |
| **Security** | Cybersecurity Fundamentals |
| **Emerging Tech** | Blockchain Technology |
| **Management** | IT Project Management |

---

# SLIDE 11: Content Statistics

## By The Numbers

| Metric | Count |
|--------|-------|
| 📚 **Courses** | 15 |
| 🎬 **Video Lessons** | 78 |
| 📝 **Quizzes** | 15 |
| ❓ **Quiz Questions** | 75+ |
| 🌐 **Languages** | 2 (EN/KH) |
| 📱 **Platforms** | 3 (iOS/Android/Web) |

---

# SLIDE 12: App Screenshots

## User Interface

*[Insert screenshots here]*

1. **Splash Screen** - App branding
2. **Home Screen** - Course discovery
3. **Course Detail** - Lessons & quizzes
4. **Video Player** - Lesson playback
5. **Quiz Screen** - Knowledge testing
6. **Profile** - Progress tracking

---

# SLIDE 13: Demo

## Live Demonstration

🎯 **Demo Flow:**

1. Launch app & splash screen
2. Browse home screen
3. Select a course
4. Watch a video lesson
5. Take a quiz
6. View profile & progress
7. Toggle dark mode

---

# SLIDE 14: Key Technical Achievements

## Implementation Highlights

✅ **Cross-Platform** - Single codebase for 3 platforms

✅ **Offline-First** - Local data storage with Hive

✅ **Reactive UI** - Provider state management

✅ **Web Video Fix** - Custom iframe implementation

✅ **Bilingual** - Full Khmer translation

✅ **Dark Mode** - Theme switching support

---

# SLIDE 15: Challenges & Solutions

## Problems Solved

| Challenge | Solution |
|-----------|----------|
| Video not playing on web | Implemented iframe-based player |
| State update during build | Used addPostFrameCallback |
| Offline data access | JSON assets + Hive storage |
| UI overflow issues | SingleChildScrollView wrappers |

---

# SLIDE 16: Future Roadmap

## Phase 2 (Next Semester)

- [ ] Firebase Authentication
- [ ] Cloud Progress Sync
- [ ] Certificate Generation
- [ ] Offline Video Download
- [ ] Push Notifications

## Phase 3 (Future)

- [ ] Live Classes
- [ ] Discussion Forums
- [ ] Payment Integration

---

# SLIDE 17: Conclusion

## Summary

**LearnHub** successfully delivers:

✅ A modern, cross-platform learning app

✅ Rich content with 15 courses & 78 lessons

✅ Interactive quizzes for assessment

✅ Bilingual support for accessibility

✅ Clean, maintainable architecture

---

# SLIDE 18: Thank You

## Questions?

### LearnHub
*Empowering learners with accessible technology education*

---

| | |
|---|---|
| **University** | Western University |
| **Program** | Master of Computer Science |
| **Subject** | Mobile Application Development |
| **Teacher** | Lakhena Keo |
| **Student** | CHUON Phearak |
| **Project** | Online Learning Course |

---

# BONUS: Presentation Tips

## Recommended Slide Design

1. **Colors:** Use blue (#2196F3) as primary, matching Flutter/Material theme
2. **Fonts:** Use Google Fonts (Poppins or Roboto)
3. **Icons:** Use Material Design icons
4. **Screenshots:** Take actual app screenshots for slides 12
5. **Demo:** Prepare Chrome with app running before presentation
6. **Time:** Aim for 15-20 minutes presentation + 5 min Q&A
