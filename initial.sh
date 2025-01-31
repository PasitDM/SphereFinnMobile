fvm flutter clean
fvm flutter pub get
fvm flutter pub run build_runner build --delete-conflicting-outputs
# cp -f assets/icon-app-sit.png assets/icon-app.png
# fvm flutter pub run flutter_launcher_icons -f flutter-sit-icon.yaml
cd ios
pod install