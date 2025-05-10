import 'dart:io';

void main(List<String> args) {
  if (args.length != 1) {
    print('Usage: dart bump_pubspec_version.dart <version>');
    exit(1);
  }

  final version = args[0];
  final file = File('packages/theme_extensions_gen/pubspec.yaml');
  final lines = file.readAsLinesSync();

  final updated = lines.map((line) {
    if (line.startsWith('version:')) {
      return 'version: $version';
    }
    return line;
  }).toList();

  file.writeAsStringSync('${updated.join('\n')}\n');
}
