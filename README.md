# 🎯 Flutter Rive Animation App with Clean Architecture

An advanced Flutter application showcasing the power of **Rive animations** combined with **Clean Architecture** for a scalable, testable, and maintainable codebase. This project demonstrates how to build beautiful, interactive UIs while maintaining a clear separation of concerns.

---

## 📦 Features

- 🖼️ **Rive Integration** – Use `.riv` files for seamless, real-time animations
- 🧼 **Clean Architecture** – Separation of Presentation, Domain, and Data layers
- ⚡ **High Performance** – Optimized for responsiveness and low latency animations
- 🧪 **Testability** – Clear boundaries make unit and widget testing easier
- 📱 **Responsive UI** – Works across Android and iOS with fluid UI transitions
- 💡 **State Management** – Modular and scalable using `flutter_bloc` or preferred approach

---

## 📁 Project Structure

```
lib/
├── core/              # Shared utilities, constants, services
├── data/              # Models, data sources, repositories (implementation)
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/            # Entities, repository contracts, use cases
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/      # UI layer: screens, widgets, blocs
│   ├── animations/    # Rive-specific widgets and logic
│   ├── pages/
│   └── widgets/       # Shared widgets
└── main.dart          # App entry point
```

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/flutter-rive-animation-app.git
cd flutter-rive-animation-app
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

---

## 🛠️ Dependencies

Here are the major packages used in the project:

```yaml
dependencies:
  flutter:
    sdk: flutter
  rive: ^0.11.17
  flutter_bloc: ^8.1.3
  equatable: ^2.0.5
  get_it: ^7.6.0
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1

dev_dependencies:
  build_runner: ^2.4.6
  freezed: ^2.4.5
  json_serializable: ^6.7.1
  flutter_test:
    sdk: flutter
```

---

## 🧪 Testing

Unit and widget tests are organized in the `test/` directory.

To run tests:

```bash
flutter test
```

---

## 🖌️ Working with Rive

To modify or preview `.riv` files:

1. Visit [https://rive.app](https://rive.app)
2. Create or import an animation
3. Export the `.riv` file
4. Place it in the `assets/rive/` directory
5. Declare it in `pubspec.yaml` like this:

```yaml
assets:
  - assets/rive/
```

---

## 🧹 Clean Architecture Overview

This project is inspired by the Uncle Bob’s Clean Architecture principles and adapted to Flutter:

- **Presentation Layer**: UI, widgets, BLoC or Cubit
- **Domain Layer**: Business logic, use cases, entities
- **Data Layer**: Remote/local data handling, repository implementations

**Benefits include:**

- Easier testing and debugging
- Maintainable and modular code
- Scalable for large teams and codebases

---

## 📌 TODO

- [ ] Add complete onboarding animation flow
- [ ] Add integration tests
- [ ] Supabase/Auth integration
- [ ] Dark mode toggle

---

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a pull request

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

---

## 👨‍💻 Author

**Amdebirhan Asmamaw**  
🔗 GitHub: [github.com/amdebirhan](https://github.com/amde-asme-prog)

---

## 🌟 Show Your Support

If you like this project, consider ⭐ starring the repo and sharing it with others!
