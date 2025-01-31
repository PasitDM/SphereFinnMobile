set -e
perl -i -pe 's/^(version:\s+\d+\.\d+\.\d+\+)(\d+)$/$1.($2+1)/e' pubspec.yaml
version=`grep 'version: ' pubspec.yaml | sed 's/version: //'`

fvm flutter clean
fvm flutter pub get
fvm flutter pub run build_runner build --delete-conflicting-outputs

cd android
fvm flutter build apk --release --flavor sit
fastlane sit

cd -
cd ios
pod install
fastlane sit

cd -
set -e
version=`grep 'version: ' pubspec.yaml | sed 's/version: //'`