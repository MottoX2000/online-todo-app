# Provider Learn - Flutter CRUD Application

A Flutter application demonstrating CRUD (Create, Read, Update, Delete) operations using Provider state management.

## Features

- Create, Read, Update, and Delete operations
- MVVM, Clean architecture with Provider state management
- Modern UI with Material Design
- Error handling and loading states
- Input validation

## Technologies & Packages

- **Flutter** - UI framework
- **Provider** (^6.1.4) - State management
- **HTTP** (^1.3.0) - API communication
- **Material Design** - UI components

## Project Structure

```
lib/
├── helper/
│   ├── api_manager.dart    # API communication
│   └── navigator.dart      # Navigation utilities
├── model/
│   └── data_model.dart     # Data models
├── view/
│   ├── logic.dart          # Business logic
│   └── main.dart           # Main UI
└── view_model/
    └── view_model.dart     # State management
```

## Usage

1. **Create (POST)**: Enter a value and click "Post"
2. **Read (GET)**: Click "Get" to fetch all values
3. **Update (PUT)**: 
   - Enter existing value and click "Put"
   - Enter new value and click "Put" again
4. **Delete**: Enter value and click "Delete"

## Error Handling

- Input validation for required fields
- Error messages for invalid operations
- Loading indicators during API calls

## Contributing

Feel free to submit issues and enhancement requests.
