# Lambda Starter App

What is included

- Graphql model generator
- Login & password reset
- GetX state management
- Firebase notification
- Lambda flutter plugins
    - Dataform
    - Datagrid
    - Agent
    - Chart
    - Moqup


# Build graphql documents

flutter pub run build_runner build
flutter pub run build_runner build --delete-conflicting-outputs


Mac M1 pod install

sudo arch -x86_64 gem install ffi
cd ios
arch -x86_64 pod install
arch -x86_64 pod install --repo-update


# Installation

flutter pub global activate flutter_create

flutter pub global run flutter_create -u https://github.com/lambda-platform/flutter-starter -a appname


# Change app icon

flutter pub run flutter_launcher_icons:main