import 'dart:convert';
import 'dart:io';

import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/source/source.dart';
import 'package:analyzer/src/generated/engine.dart';
import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:collection/collection.dart';
import 'package:pub_semver/src/version.dart';
import 'package:test/test.dart';
import 'package:theme_extensions_gen/src/theme_extension_impl_collector.dart';

//ignore_for_file: deprecated_member_use

Future<void> main() async {
  test('ThemeExtensionTemplatesCollector collects implementations correctly',
      () async {
    final inputSource = File('test/assets/app_themes.impl').readAsStringSync();
    final expectedOutput =
        File('test/assets/app_themes.theme_impl.json').readAsStringSync();

    final writer = InMemoryAssetWriter();

    await testBuilder(
      ThemeExtensionImplCollector(),
      {'a|lib/src/app_themes.dart': inputSource},
      writer: writer,
      reader: await PackageAssetReader.currentIsolate(),
    );
    final actualId = AssetId('a', 'lib/src/app_themes.theme_impl.json');
    final actual = String.fromCharCodes(writer.assets[actualId]!.toList());

    final actualJson = jsonDecode(actual);
    final expectedJson = jsonDecode(expectedOutput);

    const eq = DeepCollectionEquality.unordered();
    expect(eq.equals(actualJson, expectedJson), isTrue);
  });

  test('ThemeExtensionTemplatesCollector internal methods fail', () {
    final builder = ThemeExtensionImplCollector();

    expect(
      () => builder.resolveNamePrefix(_MockElement()),
      throwsA(
        predicate(
          (e) =>
              e is StateError && e.message.contains('Unexpected element type:'),
        ),
      ),
    );

    expect(
      () => builder.resolveElementName(_MockElement()),
      throwsA(
        predicate(
          (e) =>
              e is StateError && e.message.contains('Unexpected element type:'),
        ),
      ),
    );
  });
}

class _MockElement extends Element {
  @override
  T? accept<T>(ElementVisitor<T> visitor) {
    throw UnimplementedError();
  }

  @override
  List<Element> get children => throw UnimplementedError();

  @override
  AnalysisContext get context => throw UnimplementedError();

  @override
  Element? get declaration => throw UnimplementedError();

  @override
  String get displayName => throw UnimplementedError();

  @override
  String? get documentationComment => throw UnimplementedError();

  @override
  Element? get enclosingElement3 => throw UnimplementedError();

  @override
  String getDisplayString(
      {bool withNullability = true, bool multiline = false}) {
    throw UnimplementedError();
  }

  @override
  String getExtendedDisplayName(String? shortName) {
    throw UnimplementedError();
  }

  @override
  bool get hasAlwaysThrows => throw UnimplementedError();

  @override
  bool get hasDeprecated => throw UnimplementedError();

  @override
  bool get hasDoNotStore => throw UnimplementedError();

  @override
  bool get hasDoNotSubmit => throw UnimplementedError();

  @override
  bool get hasFactory => throw UnimplementedError();

  @override
  bool get hasImmutable => throw UnimplementedError();

  @override
  bool get hasInternal => throw UnimplementedError();

  @override
  bool get hasIsTest => throw UnimplementedError();

  @override
  bool get hasIsTestGroup => throw UnimplementedError();

  @override
  bool get hasJS => throw UnimplementedError();

  @override
  bool get hasLiteral => throw UnimplementedError();

  @override
  bool get hasMustBeConst => throw UnimplementedError();

  @override
  bool get hasMustBeOverridden => throw UnimplementedError();

  @override
  bool get hasMustCallSuper => throw UnimplementedError();

  @override
  bool get hasNonVirtual => throw UnimplementedError();

  @override
  bool get hasOptionalTypeArgs => throw UnimplementedError();

  @override
  bool get hasOverride => throw UnimplementedError();

  @override
  bool get hasProtected => throw UnimplementedError();

  @override
  bool get hasRedeclare => throw UnimplementedError();

  @override
  bool get hasReopen => throw UnimplementedError();

  @override
  bool get hasRequired => throw UnimplementedError();

  @override
  bool get hasSealed => throw UnimplementedError();

  @override
  bool get hasUseResult => throw UnimplementedError();

  @override
  bool get hasVisibleForOverriding => throw UnimplementedError();

  @override
  bool get hasVisibleForTemplate => throw UnimplementedError();

  @override
  bool get hasVisibleForTesting => throw UnimplementedError();

  @override
  bool get hasVisibleOutsideTemplate => throw UnimplementedError();

  @override
  int get id => throw UnimplementedError();

  @override
  bool isAccessibleIn(LibraryElement library) {
    throw UnimplementedError();
  }

  @override
  bool get isPrivate => throw UnimplementedError();

  @override
  bool get isPublic => throw UnimplementedError();

  @override
  bool get isSynthetic => throw UnimplementedError();

  @override
  ElementKind get kind => throw UnimplementedError();

  @override
  LibraryElement? get library => throw UnimplementedError();

  @override
  Source? get librarySource => throw UnimplementedError();

  @override
  ElementLocation? get location => throw UnimplementedError();

  @override
  List<ElementAnnotation> get metadata => throw UnimplementedError();

  @override
  String? get name => throw UnimplementedError();

  @override
  int get nameLength => throw UnimplementedError();

  @override
  int get nameOffset => throw UnimplementedError();

  @override
  Element get nonSynthetic => throw UnimplementedError();

  @override
  AnalysisSession? get session => throw UnimplementedError();

  @override
  Version? get sinceSdkVersion => throw UnimplementedError();

  @override
  Source? get source => throw UnimplementedError();

  @override
  E? thisOrAncestorMatching<E extends Element>(
      bool Function(Element p1) predicate) {
    throw UnimplementedError();
  }

  @override
  E? thisOrAncestorMatching3<E extends Element>(
      bool Function(Element p1) predicate) {
    throw UnimplementedError();
  }

  @override
  E? thisOrAncestorOfType<E extends Element>() {
    throw UnimplementedError();
  }

  @override
  E? thisOrAncestorOfType3<E extends Element>() {
    throw UnimplementedError();
  }

  @override
  void visitChildren(ElementVisitor<dynamic> visitor) {}
}
