
# Auth Feature Package

This package implements the **auth** feature for Money Tracker application.

## Folder Structure

```text
📁 Folder structure created for auth package:

auth/
├── assets/
│   └── translations/           # JSON translation files
└── lib/
    ├── src/
    │   ├── data/               # Data layer - external data sources
    │   │   ├── dtos/           # Data Transfer Objects - serialization models
    │   │   └── repositories    # Data access - API calls & local storage
    │   ├── logic/              # Business logic layer - state & app logic
    │   │   ├── blocs/          # BLoC pattern - complex state management
    │   │   └── cubits/         # Cubit pattern - simplified state management
    │   ├── view/               # Presentation layer - UI components
    │   │   ├── overlays/       # Modal overlays - dialogs, bottom sheets
    │   │   ├── screens/        # Full-screen views - app pages
    │   │   └── widgets/        # Reusable UI components
    │   └── auth_module.dart
    └── auth.dart

```

## Layer Responsibilities

### **Data Layer**: Handle all external data sources and data transformation

Responsibilities:
- Fetch data from REST APIs or databases
- Read/write to local storage (Hive)
- Transform raw data into app-friendly models
- Handle network requests and responses
- Handle data caching and offline support
- Perform data validation and error handling

Components:
- DTOs (Data Transfer Objects): JSON serialization models matching API contracts
- Repositories: Data access components that communicate with server or local storage and provide data or failures to logic layer

### **Logic Layer**: Manage application state and business logic

Responsibilities:
- Process and validate user inputs
- Execute business rules and calculations
- Coordinate data flow between layers
- Manage feature-specific state
- Handle side effects (e.g., API calls, local storage)
- Emit UI states besed on data and user actions

Components:
- BLoCs: Complex state management with event-driven architecture (good for features with multiple triggers)
- Cubits: Simple state management with direct method calls (good for straightforward state changes)

### **View Layer**: Build the user interface and handle user interactions

Responsibilities:
- Build widget trees and UI components
- Display data from state management
- Capture user interactions (e.g., taps, gestures, inputs)
- Handle UI-specific logic (e.g., animations, form validation)
- Manage localization and translations
- Manage navigation and routing between screens
- Apply consistent theming and styling

Components:
- Overlays: Modal components like dialogs and bottom sheets
- Screens: Full-screen views representing app pages
- Widgets: Reusable UI components used across screens

## Usage

Include this package to use **auth** feature in `pubspec.yaml`:

```yaml
dependencies:
  auth:
    path: ../auth
```

Then, import the package where needed:

```dart
import 'package:auth/auth.dart';
```
