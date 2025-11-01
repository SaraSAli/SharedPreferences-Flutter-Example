# Shared Preferences Example (Flutter)

This simple Flutter project demonstrates how to use Shared Preferences for storing, retrieving, and clearing data locally on a device.
In this example, the user can enter a username, save it persistently even after closing and reopening the app, and view it on a separate screen.

## Screenshots
| Main Screen                          | Display Username Screen                    |
| ------------------------------------ | ------------------------------------------ |
| <img width="425" height="945" alt="image" src="https://github.com/user-attachments/assets/71f91a76-77d7-4ec8-a286-3d5d2e0a2f0c" />| <img width="422" height="945" alt="image" src="https://github.com/user-attachments/assets/9efaafab-ea8d-4de4-8fda-7704e0259117" />|

## Dependencies

This project uses the following Flutter package:

```dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.5.3
```

Install dependencies using:
```
flutter pub get
```

## How It Works

* When the app starts, it checks Shared Preferences for a saved username.
* The user can enter a username and tap Save, which stores it persistently.
* The app then navigates to a new screen displaying the saved username.
* The Clear button removes the saved data.

