import 'package:collection/collection.dart';
import 'package:meta/meta.dart' show immutable;
import 'package:theme_extensions_gen/src/context_extensions_generator.dart';
import 'package:theme_extensions_gen/src/models/collected_templates.dart';
import 'package:theme_extensions_gen/src/templates/interface/template.dart';

/// A template for generating BuildContext extensions
/// to access ThemeExtension instances easily.
///
/// This class collects all theme templates and
/// generates strongly-typed getters for each of them.
@immutable
final class ContextExtensionsTemplate implements Template {
  /// Creates a [ContextExtensionsTemplate].
  ///
  /// Takes a list of [CollectedTemplates] to generate
  /// extension methods for accessing custom ThemeExtensions.
  ContextExtensionsTemplate({
    required List<CollectedTemplates> templates,
  }) : _templates = templates;

  final List<CollectedTemplates> _templates;

  @override
  void write(StringBuffer sb) {
    sb.writeln(_header);

    final imports = <String, String>{'package:flutter/material.dart': ''};
    final getters = <String>[];

    var aliasCount = 0;
    for (final template in _templates) {
      final alias = 'a_${aliasCount++}';
      imports[template.importUri] = alias;

      for (final name in template.templateNames) {
        final duplicate = _duplicateTemplateOrNull(template, name);
        final getterName = duplicate != null
            ? _resolveGetterName(name, template.importUri, duplicate.importUri)
            : name.lowercaseFirstLetter;

        getters.add('  /// `ThemeExtension<$name>` \n'
            '  /// from [${template.importUri}]\n'
            '  $alias.$name get $getterName => '
            'Theme.of(this).extension<$alias.$name>()!;\n');
      }
    }

    for (final entry
        in imports.entries.sorted((a, b) => a.key.compareTo(b.key))) {
      if (entry.value.isEmpty) {
        sb.writeln('import \'${entry.key}\';');
      } else {
        sb.writeln('import \'${entry.key}\' as ${entry.value};');
      }
    }

    sb.writeln();
    sb.writeln('extension ContextThemeExtensions on BuildContext {');
    for (final getter in getters) {
      sb.writeln(getter);
    }
    sb.writeln('}');
  }

  CollectedTemplates? _duplicateTemplateOrNull(
    CollectedTemplates template,
    String currentName,
  ) {
    final name = currentName.lowercaseFirstLetter;
    for (final t in _templates) {
      if (identical(t, template)) continue;
      for (final candidate in t.templateNames) {
        if (candidate.lowercaseFirstLetter == name) {
          return t;
        }
      }
    }
    return null;
  }

  String _resolveGetterName(
    String className,
    String assetPath,
    String duplicatePath,
  ) {
    final segments =
        assetPath.replaceAll('package:', '').split('.').first.split('/');
    final duplicateSegments =
        duplicatePath.replaceAll('package:', '').split('.').first.split('/');
    late final String uniquePart;

    for (final s in segments) {
      if (!duplicateSegments.contains(s)) {
        uniquePart = s;
        break;
      }
    }

    final normalized = _normalizeString(uniquePart);
    return '${_toCamelCase(className)}$normalized';
  }

  String _toCamelCase(String input) {
    final words = input.split(RegExp(r'_|(?=[A-Z])'));
    if (words.isEmpty) return '';
    final first = words.first.toLowerCase();
    final rest = words
        .skip(1)
        .map((w) => w.isEmpty
            ? ''
            : '${w[0].toUpperCase()}${w.substring(1).toLowerCase()}')
        .join();
    return '$first$rest';
  }

  String _normalizeString(String input) {
    if (input.contains('_')) {
      final parts = input.split('_');
      final first = parts.first.uppercaseFirstLetter;
      final rest = parts
          .skip(1)
          .map((p) => p.isEmpty
              ? ''
              : '${p[0].toUpperCase()}${p.substring(1).toLowerCase()}')
          .join();
      return '$first$rest';
    } else {
      return input.length > 1
          ? '${input[0].toUpperCase()}${input.substring(1).toLowerCase()}'
          : input.toLowerCase();
    }
  }

  String get _header => '''
// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: lines_longer_than_80_chars

// **************************************************
// $ContextExtensionsGenerator
// **************************************************
''';
}

extension _StringExt on String {
  String get lowercaseFirstLetter =>
      isEmpty ? this : this[0].toLowerCase() + substring(1);

  String get uppercaseFirstLetter =>
      isEmpty ? this : this[0].toUpperCase() + substring(1);
}
