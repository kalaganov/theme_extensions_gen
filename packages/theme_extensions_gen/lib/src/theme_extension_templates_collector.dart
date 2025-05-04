import 'dart:async' show FutureOr;
import 'dart:convert' show jsonEncode;

import 'package:build/build.dart' show BuildStep, Builder;
import 'package:meta/meta.dart' show immutable;
import 'package:source_gen/source_gen.dart' show LibraryReader, TypeChecker;
import 'package:theme_extensions_gen/src/models/collected_templates.dart';
import 'package:theme_extensions_gen_annotations/theme_extensions_gen_annotations.dart';

//ignore_for_file: deprecated_member_use

/// Collects all elements annotated with `@ThemeExtensionTemplate`
/// and writes their names and import URI to a `.theme_templates.json` file.
@immutable
final class ThemeExtensionTemplatesCollector extends Builder {
  /// Creates a [ThemeExtensionTemplatesCollector] using
  /// parsed build configuration.
  ThemeExtensionTemplatesCollector();

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;

    final isLibrary = await buildStep.resolver.isLibrary(inputId);
    if (!isLibrary) return;

    final lib = await buildStep.inputLibrary;

    final reader = LibraryReader(lib);
    final annotatedElements = reader.annotatedWith(
      const TypeChecker.fromRuntime(ThemeExtensionTemplate),
    );
    if (annotatedElements.isEmpty) return;

    final names = annotatedElements
        .map((e) => e.element.displayName)
        .toList(growable: false);

    final collectedTemplates = CollectedTemplates(
      importUri: inputId.uri.toString(),
      templateNames: names,
    );
    await buildStep.writeAsString(
      inputId.changeExtension('.theme_templates.json'),
      jsonEncode(collectedTemplates.toJson()),
    );
  }

  @override
  Map<String, List<String>> get buildExtensions => const {
        '.dart': ['.theme_templates.json'],
      };
}
