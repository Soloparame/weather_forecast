---

# Weather Forecast App 🌤️
<img width="269" alt="Screenshot 2025-02-10 145119" src="https://github.com/user-attachments/assets/98428c59-8f1a-4256-aa6f-1c917e6cb299" />


## Overview

Weather Forecast App is a simple yet powerful mobile application built with **Flutter** that allows users to check weather forecasts for a specific location. The app fetches weather data from the **OpenWeatherMap API**, displays it in a clean and attractive interface, and incorporates **Bloc** for state management. It also follows **clean code principles** and **dependency injection** for better maintainability.

---

## Features

- **User Location Input**: Users can input a location (city, zip code, etc.) to get the weather forecast.
- **Weather Data Display**: Shows the current temperature, humidity, wind speed, and a description of the weather.
- **Weather Details Screen**: Users can navigate to a detailed screen showing more in-depth weather information.
- **State Management**: Implemented with **Bloc** for handling loading, error, and success states effectively.
- **Splash Screen**: The app displays a splash screen with a weather icon and app name before transitioning to the main screen.

---

## Requirements

To run this app, you need to have the following installed on your machine:

- **Flutter** (version 3.0 or above)
- **Dart SDK** (comes with Flutter)
- **Android Studio** or **VS Code** (for code editing and running the app)

You will also need an **API key** from [OpenWeatherMap](https://openweathermap.org/).

---

## Installation

### Step 1: Install Dependencies

Run the following command to install the necessary packages:

```bash
flutter pub get
```

### Step 2: Set up OpenWeatherMap API Key

Sign up for a free API key from [OpenWeatherMap](https://openweathermap.org/). 

Replace the `apiKey` in the `weather_api_service.dart` file with your actual API key:

```dart
class WeatherApiService {
  final String apiKey;
  WeatherApiService({required this.apiKey});
}
```

---

## Running the App

To run the app locally on your emulator or physical device, use the following command:

```bash
flutter run
```

To target a specific device, use:

```bash
flutter run -d <device_name>
```

---

## Project Structure

This project is organized into the following structure:

```
lib/
 ├── bloc/
 │    ├── weather_bloc.dart
 │    ├── weather_event.dart
 │    └── weather_state.dart
 ├── models/
 │    └── weather_model.dart
 ├── screens/
 │    ├── weather_screen.dart
 │    ├── weather_details_screen.dart
 │    └── landing_page.dart
 ├── services/
 │    └── weather_api_service.dart
 └── main.dart
```

### Key Files:

- **main.dart**: Entry point for the app, setting up dependency injection and state management.
- **landing_page.dart**: Displays a splash screen for 3 seconds before transitioning to the main weather screen.
- **weather_screen.dart**: The primary screen where users can input location and view weather forecasts.
- **weather_details_screen.dart**: A secondary screen for showing detailed weather information.
- **weather_api_service.dart**: Handles making requests to the OpenWeatherMap API.
- **weather_bloc.dart**, **weather_event.dart**, **weather_state.dart**: Implement Bloc pattern for managing the weather data state.

---

## Dependencies

This project uses the following dependencies:

- **flutter_bloc**: Manages the app's state using the Bloc pattern.
- **provider**: Provides dependency injection for the `WeatherApiService`.
- **http**: Used to make HTTP requests to the OpenWeatherMap API.

You can find the list of dependencies in the `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.0.0
  provider: ^6.0.1
  http: ^1.3.0
```

---

## State Management

This app uses **Bloc** (Business Logic Component) for state management.

- **WeatherBloc**: Contains the logic for fetching weather data.
- **WeatherEvent**: Defines the events such as `FetchWeather`.
- **WeatherState**: Represents various states like `WeatherLoading`, `WeatherLoaded`, and `WeatherError`.

### Flow:
- The app listens for the `FetchWeather` event, fetches the weather data from the API, and updates the state to `WeatherLoading`, `WeatherLoaded`, or `WeatherError` based on the result.

---

## App Screens

### 1. **LandingPage (Splash Screen)**

The app starts with a splash screen, which displays the app name and a weather icon for 3 seconds before transitioning to the `WeatherScreen`.

### 2. **WeatherScreen**

This screen allows users to input a location (city, zip code, etc.). It shows the weather information such as:
- **Temperature**
- **Weather description**
- **Wind speed**
- **Humidity**

There is also a button that navigates to a detailed screen for more information.

### 3. **WeatherDetailsScreen**

Displays additional weather details including:
- **Temperature**
- **Humidity**
- **Wind speed**
- **Weather description**

---

## Clean Code Practices

The app follows **SOLID principles** for maintainability and scalability:

- **Separation of Concerns**: Business logic is handled by Bloc, and UI code is kept in separate screens.
- **Meaningful Names**: Variables and functions are named clearly to represent their roles.
- **Dependency Injection**: The `WeatherApiService` is injected using **Provider**, decoupling the app’s components and making it easier to test.

---
