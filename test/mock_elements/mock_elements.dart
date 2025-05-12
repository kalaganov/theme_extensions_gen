import 'package:analyzer/dart/analysis/session.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:analyzer/source/source.dart';
import 'package:analyzer/src/generated/engine.dart';
import 'package:pub_semver/src/version.dart';

//ignore_for_file: deprecated_member_use

class MockElement extends Element {
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

class MockClassElement extends ClassElement {
  @override
  T? accept<T>(ElementVisitor<T> visitor) {
    throw UnimplementedError();
  }

  @override
  List<PropertyAccessorElement> get accessors => throw UnimplementedError();

  @override
  List<InterfaceType> get allSupertypes => throw UnimplementedError();

  @override
  AugmentedClassElement get augmented => throw UnimplementedError();

  @override
  List<Element> get children => throw UnimplementedError();

  @override
  List<ConstructorElement> get constructors => throw UnimplementedError();

  @override
  AnalysisContext get context => throw UnimplementedError();

  @override
  Element get declaration => throw UnimplementedError();

  @override
  String get displayName => throw UnimplementedError();

  @override
  String? get documentationComment => throw UnimplementedError();

  @override
  CompilationUnitElement get enclosingElement3 => throw UnimplementedError();

  @override
  List<FieldElement> get fields => throw UnimplementedError();

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
  FieldElement? getField(String name) {
    throw UnimplementedError();
  }

  @override
  PropertyAccessorElement? getGetter(String name) {
    throw UnimplementedError();
  }

  @override
  MethodElement? getMethod(String name) {
    throw UnimplementedError();
  }

  @override
  ConstructorElement? getNamedConstructor(String name) {
    throw UnimplementedError();
  }

  @override
  PropertyAccessorElement? getSetter(String name) {
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
  bool get hasNonFinalField => throw UnimplementedError();

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
  InterfaceType instantiate(
      {required List<DartType> typeArguments,
      required NullabilitySuffix nullabilitySuffix}) {
    throw UnimplementedError();
  }

  @override
  List<InterfaceType> get interfaces => throw UnimplementedError();

  @override
  bool get isAbstract => throw UnimplementedError();

  @override
  bool isAccessibleIn(LibraryElement library) {
    throw UnimplementedError();
  }

  @override
  bool get isAugmentation => throw UnimplementedError();

  @override
  bool get isBase => throw UnimplementedError();

  @override
  bool get isConstructable => throw UnimplementedError();

  @override
  bool get isDartCoreEnum => throw UnimplementedError();

  @override
  bool get isDartCoreObject => throw UnimplementedError();

  @override
  bool get isExhaustive => throw UnimplementedError();

  @override
  bool isExtendableIn(LibraryElement library) {
    throw UnimplementedError();
  }

  @override
  bool get isFinal => throw UnimplementedError();

  @override
  bool isImplementableIn(LibraryElement library) {
    throw UnimplementedError();
  }

  @override
  bool get isInterface => throw UnimplementedError();

  @override
  bool isMixableIn(LibraryElement library) {
    throw UnimplementedError();
  }

  @override
  bool get isMixinApplication => throw UnimplementedError();

  @override
  bool get isMixinClass => throw UnimplementedError();

  @override
  bool get isPrivate => throw UnimplementedError();

  @override
  bool get isPublic => throw UnimplementedError();

  @override
  bool get isSealed => throw UnimplementedError();

  @override
  bool get isSimplyBounded => throw UnimplementedError();

  @override
  bool get isSynthetic => throw UnimplementedError();

  @override
  bool get isValidMixin => throw UnimplementedError();

  @override
  ElementKind get kind => throw UnimplementedError();

  @override
  LibraryElement get library => throw UnimplementedError();

  @override
  Source get librarySource => throw UnimplementedError();

  @override
  ElementLocation? get location => throw UnimplementedError();

  @override
  MethodElement? lookUpConcreteMethod(
      String methodName, LibraryElement library) {
    throw UnimplementedError();
  }

  @override
  PropertyAccessorElement? lookUpGetter(
      String getterName, LibraryElement library) {
    throw UnimplementedError();
  }

  @override
  PropertyAccessorElement? lookUpInheritedConcreteGetter(
      String getterName, LibraryElement library) {
    throw UnimplementedError();
  }

  @override
  MethodElement? lookUpInheritedConcreteMethod(
      String methodName, LibraryElement library) {
    throw UnimplementedError();
  }

  @override
  PropertyAccessorElement? lookUpInheritedConcreteSetter(
      String setterName, LibraryElement library) {
    throw UnimplementedError();
  }

  @override
  MethodElement? lookUpInheritedMethod(
      String methodName, LibraryElement library) {
    throw UnimplementedError();
  }

  @override
  MethodElement? lookUpMethod(String methodName, LibraryElement library) {
    throw UnimplementedError();
  }

  @override
  PropertyAccessorElement? lookUpSetter(
      String setterName, LibraryElement library) {
    throw UnimplementedError();
  }

  @override
  List<ElementAnnotation> get metadata => throw UnimplementedError();

  @override
  List<MethodElement> get methods => throw UnimplementedError();

  @override
  List<InterfaceType> get mixins => throw UnimplementedError();

  @override
  String get name => 'MockClassElement';

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
  Source get source => throw UnimplementedError();

  @override
  InterfaceType? get supertype => null;

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
  InterfaceType get thisType => throw UnimplementedError();

  @override
  List<TypeParameterElement> get typeParameters => throw UnimplementedError();

  @override
  ConstructorElement? get unnamedConstructor => throw UnimplementedError();

  @override
  void visitChildren(ElementVisitor<dynamic> visitor) {}
}

class MockInterfaceType extends InterfaceType {
  @override
  R accept<R>(TypeVisitor<R> visitor) {
    throw UnimplementedError();
  }

  @override
  R acceptWithArgument<R, A>(
      TypeVisitorWithArgument<R, A> visitor, A argument) {
    throw UnimplementedError();
  }

  @override
  List<PropertyAccessorElement> get accessors => throw UnimplementedError();

  @override
  InstantiatedTypeAliasElement? get alias => throw UnimplementedError();

  @override
  List<InterfaceType> get allSupertypes => throw UnimplementedError();

  @override
  InterfaceType? asInstanceOf(InterfaceElement element) {
    throw UnimplementedError();
  }

  @override
  InterfaceType? asInstanceOf2(InterfaceElement2 element) {
    throw UnimplementedError();
  }

  @override
  List<ConstructorElement> get constructors => throw UnimplementedError();

  @override
  List<ConstructorElement2> get constructors2 => throw UnimplementedError();

  @override
  InterfaceElement get element => throw UnimplementedError();

  @override
  InterfaceElement2 get element3 => throw UnimplementedError();

  @override
  DartType get extensionTypeErasure => throw UnimplementedError();

  @override
  String getDisplayString({bool withNullability = true}) {
    throw UnimplementedError();
  }

  @override
  PropertyAccessorElement? getGetter(String name) {
    throw UnimplementedError();
  }

  @override
  GetterElement? getGetter2(String name) {
    throw UnimplementedError();
  }

  @override
  MethodElement? getMethod(String name) {
    throw UnimplementedError();
  }

  @override
  MethodElement2? getMethod2(String name) {
    throw UnimplementedError();
  }

  @override
  PropertyAccessorElement? getSetter(String name) {
    throw UnimplementedError();
  }

  @override
  SetterElement? getSetter2(String name) {
    throw UnimplementedError();
  }

  @override
  List<GetterElement> get getters => throw UnimplementedError();

  @override
  List<InterfaceType> get interfaces => throw UnimplementedError();

  @override
  bool get isBottom => throw UnimplementedError();

  @override
  bool get isDartAsyncFuture => throw UnimplementedError();

  @override
  bool get isDartAsyncFutureOr => throw UnimplementedError();

  @override
  bool get isDartAsyncStream => throw UnimplementedError();

  @override
  bool get isDartCoreBool => throw UnimplementedError();

  @override
  bool get isDartCoreDouble => throw UnimplementedError();

  @override
  bool get isDartCoreEnum => throw UnimplementedError();

  @override
  bool get isDartCoreFunction => throw UnimplementedError();

  @override
  bool get isDartCoreInt => throw UnimplementedError();

  @override
  bool get isDartCoreIterable => throw UnimplementedError();

  @override
  bool get isDartCoreList => throw UnimplementedError();

  @override
  bool get isDartCoreMap => throw UnimplementedError();

  @override
  bool get isDartCoreNull => throw UnimplementedError();

  @override
  bool get isDartCoreNum => throw UnimplementedError();

  @override
  bool get isDartCoreObject => throw UnimplementedError();

  @override
  bool get isDartCoreRecord => throw UnimplementedError();

  @override
  bool get isDartCoreSet => throw UnimplementedError();

  @override
  bool get isDartCoreString => throw UnimplementedError();

  @override
  bool get isDartCoreSymbol => throw UnimplementedError();

  @override
  bool get isDartCoreType => throw UnimplementedError();

  @override
  bool isStructurallyEqualTo(covariant DartType other) {
    throw UnimplementedError();
  }

  @override
  ConstructorElement? lookUpConstructor(String? name, LibraryElement library) {
    throw UnimplementedError();
  }

  @override
  ConstructorElement2? lookUpConstructor2(
      String? name, LibraryElement2 library) {
    throw UnimplementedError();
  }

  @override
  PropertyAccessorElement? lookUpGetter2(String name, LibraryElement library,
      {bool concrete = false,
      bool inherited = false,
      bool recoveryStatic = false}) {
    throw UnimplementedError();
  }

  @override
  GetterElement? lookUpGetter3(String name, LibraryElement2 library,
      {bool concrete = false,
      bool inherited = false,
      bool recoveryStatic = false}) {
    throw UnimplementedError();
  }

  @override
  MethodElement? lookUpMethod2(String name, LibraryElement library,
      {bool concrete = false,
      bool inherited = false,
      bool recoveryStatic = false}) {
    throw UnimplementedError();
  }

  @override
  MethodElement2? lookUpMethod3(String name, LibraryElement2 library,
      {bool concrete = false,
      bool inherited = false,
      bool recoveryStatic = false}) {
    throw UnimplementedError();
  }

  @override
  PropertyAccessorElement? lookUpSetter2(String name, LibraryElement library,
      {bool concrete = false,
      bool inherited = false,
      bool recoveryStatic = false}) {
    throw UnimplementedError();
  }

  @override
  SetterElement? lookUpSetter3(String name, LibraryElement2 library,
      {bool concrete = false,
      bool inherited = false,
      bool recoveryStatic = false}) {
    throw UnimplementedError();
  }

  @override
  List<MethodElement> get methods => throw UnimplementedError();

  @override
  List<MethodElement2> get methods2 => throw UnimplementedError();

  @override
  List<InterfaceType> get mixins => throw UnimplementedError();

  @override
  String? get name => throw UnimplementedError();

  @override
  NullabilitySuffix get nullabilitySuffix => throw UnimplementedError();

  @override
  List<SetterElement> get setters => throw UnimplementedError();

  @override
  InterfaceType? get superclass => throw UnimplementedError();

  @override
  List<InterfaceType> get superclassConstraints => throw UnimplementedError();

  @override
  List<DartType> get typeArguments => throw UnimplementedError();
}
