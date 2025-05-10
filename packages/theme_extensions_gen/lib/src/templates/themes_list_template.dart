import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/templates/interface/template.dart';
import 'package:theme_extensions_gen/src/theme_extensions_impl_combiner.dart';

/// Template that generates a list of collected `ThemeExtension` instances.
@immutable
final class ThemesListTemplate implements Template {
  /// Creates a [ThemesListTemplate].
  ThemesListTemplate({
    required List<String> names,
    required List<String> imports,
    required String listName,
  })  : _imports = imports,
        _names = names,
        _listName = listName;

  final List<String> _names;
  final List<String> _imports;
  final String _listName;

  @override
  void write(StringBuffer sb) {
    sb.writeln(_header);

    final tmpImports = [..._imports, '\'package:flutter/material.dart\'']
      ..sort();

    for (final import in tmpImports) {
      sb.writeln('import $import;');
    }
    sb.writeln();

    sb.writeln(_listDoc);
    sb.writeln('List<ThemeExtension> get $_listName => [');
    for (final name in _names) {
      sb.writeln('      $name,');
    }
    sb.writeln('    ];');
  }

  String get _header => '''
// GENERATED CODE - DO NOT MODIFY BY HAND
// **************************************************
// $ThemeExtensionsImplCombiner
// **************************************************
''';

  String get _listDoc => '''
/// Combined list of all collected `ThemeExtension` instances.
///
/// Add this to your `ThemeData.extensions`.
///
/// Example:
/// ```dart
/// ThemeData(
///   extensions: $_listName,
/// )
/// ```
///
/// Or merge:
/// ```dart
/// ThemeData(
///   extensions: [
///     ...otherExtensions,
///     ...$_listName,
///   ],
/// )
/// ```''';
}
