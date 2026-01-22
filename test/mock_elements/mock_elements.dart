import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:pub_semver/src/version.dart';

class MockElement extends Element {
  @override
  T? accept<T>(ElementVisitor2<T> visitor) => throw UnimplementedError();

  @override
  List<Element> get children => throw UnimplementedError();

  @override
  int get id => throw UnimplementedError();

  @override
  bool get isPrivate => throw UnimplementedError();

  @override
  bool get isPublic => throw UnimplementedError();

  @override
  bool get isSynthetic => throw UnimplementedError();

  @override
  ElementKind get kind => throw UnimplementedError();

  @override
  LibraryElement get library => throw UnimplementedError();

  @override
  String get displayName => 'MockClassElement';

  @override
  Element get baseElement => throw UnimplementedError();

  @override
  String displayString({bool multiline = false, bool preferTypeAlias = false}) {
    throw UnimplementedError();
  }

  @override
  Element? get enclosingElement => throw UnimplementedError();

  @override
  Fragment get firstFragment => throw UnimplementedError();

  @override
  List<Fragment> get fragments => throw UnimplementedError();

  @override
  String getExtendedDisplayName({String? shortName}) {
    throw UnimplementedError();
  }

  @override
  bool isAccessibleIn(LibraryElement library) {
    throw UnimplementedError();
  }

  @override
  String? get lookupName => throw UnimplementedError();

  @override
  String? get name => throw UnimplementedError();

  @override
  Element get nonSynthetic => throw UnimplementedError();

  @override
  AnalysisSession? get session => throw UnimplementedError();

  @override
  Version? get sinceSdkVersion => throw UnimplementedError();

  @override
  Element? thisOrAncestorMatching(bool Function(Element p1) predicate) {
    throw UnimplementedError();
  }

  @override
  E? thisOrAncestorOfType<E extends Element>() {
    throw UnimplementedError();
  }

  @override
  void visitChildren<T>(ElementVisitor2<T> visitor) {}

  @override
  String? get documentationComment => throw UnimplementedError();

  @override
  bool isDeprecatedWithKind(String kind) {
    throw UnimplementedError();
  }

  @override
  Metadata get metadata => throw UnimplementedError();
}
