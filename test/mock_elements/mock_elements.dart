import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:pub_semver/src/version.dart';

class MockElement extends Element2 {
  @override
  T? accept2<T>(ElementVisitor2<T> visitor) => throw UnimplementedError();

  @override
  List<Element2> get children2 => throw UnimplementedError();

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
  LibraryElement2 get library2 => throw UnimplementedError();

  @override
  String get displayName => 'MockClassElement';

  @override
  Element2 get baseElement => throw UnimplementedError();

  @override
  String displayString2({
    bool multiline = false,
    bool preferTypeAlias = false,
  }) {
    throw UnimplementedError();
  }

  @override
  Element2? get enclosingElement2 => throw UnimplementedError();

  @override
  Fragment get firstFragment => throw UnimplementedError();

  @override
  List<Fragment> get fragments => throw UnimplementedError();

  @override
  String getExtendedDisplayName2({String? shortName}) {
    throw UnimplementedError();
  }

  @override
  bool isAccessibleIn2(LibraryElement2 library) {
    throw UnimplementedError();
  }

  @override
  String? get lookupName => throw UnimplementedError();

  @override
  String? get name3 => throw UnimplementedError();

  @override
  Element2 get nonSynthetic2 => throw UnimplementedError();

  @override
  AnalysisSession? get session => throw UnimplementedError();

  @override
  Version? get sinceSdkVersion => throw UnimplementedError();

  @override
  Element2? thisOrAncestorMatching2(bool Function(Element2 p1) predicate) {
    throw UnimplementedError();
  }

  @override
  E? thisOrAncestorOfType2<E extends Element2>() {
    throw UnimplementedError();
  }

  @override
  void visitChildren2<T>(ElementVisitor2<T> visitor) {}
}
