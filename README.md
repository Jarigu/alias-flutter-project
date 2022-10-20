# Alias App

A flutter app that uses the "[Url shortener](https://url-shortener-nu.herokuapp.com/api/alias)" service, that allow to reduce a long link.

## Content
* [Running the App](#running-the-app)
* [App Architecture & Folder Structure](#app-architecture-and-folder-structure)
* [Testing](#testing)

## Running the app
No previous process is required to run the app

## App Architecture and Folder Structure

The code of the app implements clean architecture to separate the UI, domain and data layers with a feature-first approach for folder structure.

#### Folder Structure

```
lib
├── core
│   ├── configs
│   ├── exceptions
│   ├── services
│   │   └── http
│   └── widgets
├── features
│   └── alias
│       ├── enums
│       ├── models
│       ├── logic
│       ├── repositories
│       └── views
│           ├── pages
│           └── widgets
├── main.dart
└── alias_app.dart

```

## Testing

To explore the test coverage:
```
flutter test --coverage
```
Then generate coverage files
```
genhtml coverage/lcov.info -o coverage/html
```
Then open the html files:
```
open coverage/html/index.html
```