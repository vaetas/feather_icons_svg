# Feather Icons SVG for Flutter

[Feather Icons](https://feathericons.com/) port to Flutter. This package renders the icons as SVG
pictures. This makes it possible to customize icon properties in runtime (stroke width etc.).

## Usage

```dart
class MyExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FeatherIcon(
      FeatherIcons.calendar,
      color: Colors.red,
      size: 30,
      strokeWidth: 1.5,
    );
  }
}
```

You can also use `FeatherIconTheme` inherited widget to customize default values for Widget
subtree.

## Install

Add `feather_icons_svg` package into your `pubspec.yaml`.

```shell
flutter pub add flutter_icons_svg
```

## Development

To fetch SVG icons from original Feather Icons repository, run `tool/fetch-icons.sh`.

Finally, to run source code generation to create `flutter_icons_svg.dart` file with named
constructor for every icon, run `tool/generator.dart`.
