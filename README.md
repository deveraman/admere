# admere

An implementation of take home assignment given for Flutter Internship at OnlineMic.

## Screenshots
<p align="center">
  <img width="32%" src="screenshots/1.png?raw=true">
  <img width="32%" src="screenshots/2.png?raw=true">
  <img width="32%" src="screenshots/3.png?raw=true">
  <img width="32%" src="screenshots/4.png?raw=true">
  <img width="32%" src="screenshots/5.png?raw=true">
  <img width="32%" src="screenshots/6.png?raw=true">
  <img width="32%" src="screenshots/7.png?raw=true">
  <img width="32%" src="screenshots/8.png?raw=true">
</p>

## Screen Capture
<p align="center">
  <img width="32%" src="screenshots/screenrecord.gif?raw=true">
</p>

## Tech stack
The libraries that this app is using as of now:
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [equatable](https://pub.dev/packages/equatable)
- [geolocator](https://pub.dev/packages/geolocator)
- [geocoding](https://pub.dev/packages/geocoding)
- [go_router](https://pub.dev/packages/go_router)
- [timeline_tile](https://pub.dev/packages/timelime_tile)
- [lottie](https://pub.dev/packages/lottie)
- [lints](https://pub.dev/packages/lints)

## Architecture

This project uses BLoC for managing state hence it naturally uses the BLoC Architecture and feature first/layered architecture.

You can learn more about those from the following links;

[BLoC Architecture](https://bloclibrary.dev/#/architecture)
[Layered Architecture](https://verygood.ventures/blog/very-good-flutter-architecture)

## Run Locally

**Flutter 3.7.7 is Required to build this project**

Make sure that you have flutter and dart installed and setup. If you don't then refer to the official installation instructions at [Flutter Docs](https://flutter.dev/docs/get-started/install)

Then run the following commands

Clone the project

```bash
  git clone https://github.com/deveraman/admere
```

Go to the project directory

```bash
  cd admere
```

Fetch dependencies and generate routes

```bash
  flutter pub get && flutter pub run build_runner build
```

Run the app

```bash
  flutter run
```


## Acknowledgement

Given the timelimit and tasks, I have done my best to solve/implement the given tasks but as you can see in the screenshots that it does have some ui glitches and could've been done better but as I received the tasks on 7th March around 12 midnight and that the next day was the Festival of Holi, hence I could'nt properly give it full 72hrs.
All of this was done and implemented in somewhat like 40-42hrs. If given more time, I could flesh out it more and make it a better experience overall but this is not an excuse. It just points the limitations within me and I intend to fix those issues and do better.
THANK YOU.

## Future Plan

Fixing bugs and Implementing Animations.

AS of now it only contains default animations and transitions also the DOB field doesn't updates or reacts to the changes from DatePicker.

## [License](https://github.com/deveraman/admere/blob/main/LICENSE)
