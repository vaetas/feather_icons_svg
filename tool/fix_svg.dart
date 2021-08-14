import 'dart:io';

import 'package:path/path.dart' as p;

Future<void> main() async {
  final assetsDir = Directory(p.join(Directory.current.path, 'assets'));
  print('[fix_svg] Assets dir: $assetsDir');
  final files = await assetsDir.list().toList();
  for (final file in files) {
    if (file is File) {
      final content = await file.readAsString();
      await file.writeAsString(
        content.replaceFirst(r'stroke="currentColor"', 'stroke="#000000"'),
      );
    }
  }
  print('[fix_svg] Success!');
}
