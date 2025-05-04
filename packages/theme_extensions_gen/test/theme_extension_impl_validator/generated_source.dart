const generatedSource = '''
abstract interface class AppThemeExtension
    extends ThemeExtension<AppThemeExtension> with _\$AppThemeExtensionMixin {
  const factory AppThemeExtension({
    required Decoration decoration,
    required Decoration outerDecoration,
    required double figmaBlur,
    required BorderRadius clipRadius,
  }) = _\$AppThemeExtension;
}

mixin _\$AppThemeExtensionMixin {
  Decoration get decoration => throw UnimplementedError();

  Decoration get outerDecoration => throw UnimplementedError();

  double get sigma => throw UnimplementedError();

  BorderRadius get clipRadius => throw UnimplementedError();

  ThemeExtension<AppThemeExtension> copyWith() => throw UnimplementedError();

  ThemeExtension<AppThemeExtension> lerp(
    covariant AppThemeExtension? other,
    double t,
  ) =>
      throw UnimplementedError();
}

/// @nodoc
abstract class _\$AppThemeExtension implements AppThemeExtension {
  const factory _\$AppThemeExtension({
    decoration: Decoration,
    outerDecoration: Decoration,
    sigma: double,
    clipRadius: BorderRadius,
  }) = _\$AppThemeExtensionImpl;
}

/// @nodoc
class _\$AppThemeExtensionImpl extends ThemeExtension<AppThemeExtension>
    implements _\$AppThemeExtension {
  const _\$AppThemeExtensionImpl({
    decoration: Decoration,
    outerDecoration: Decoration,
    sigma: double,
    clipRadius: BorderRadius,
  });

  @override
  final Decoration decoration;

  @override
  final Decoration outerDecoration;

  @override
  final double sigma;

  @override
  final BorderRadius clipRadius;

  @override
  Object get type => AppThemeExtension;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppThemeExtension &&
            decoration == other.decoration &&
            outerDecoration == other.outerDecoration &&
            sigma == other.sigma &&
            clipRadius == other.clipRadius);
  }

  @override
  int get hashCode =>
      decoration.hashCode ^
      outerDecoration.hashCode ^
      sigma.hashCode ^
      clipRadius.hashCode;

  @override
  ThemeExtension<AppThemeExtension> copyWith({
    Decoration? decoration,
    Decoration? outerDecoration,
    double? sigma,
    BorderRadius? clipRadius,
  }) {
    return AppThemeExtension(
      decoration: decoration ?? this.decoration,
      outerDecoration: outerDecoration ?? this.outerDecoration,
      sigma: sigma ?? this.sigma,
      clipRadius: clipRadius ?? this.clipRadius,
    );
  }

  @override
  ThemeExtension<AppThemeExtension> lerp(
    ThemeExtension<AppThemeExtension>? other,
    double t,
  ) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      decoration: Decoration.lerp(decoration, other.decoration, t)!,
      outerDecoration:
          Decoration.lerp(outerDecoration, other.outerDecoration, t)!,
      sigma: _lerpDouble(sigma, other.sigma, t)!,
      clipRadius: BorderRadius.lerp(clipRadius, other.clipRadius, t)!,
    );
  }

  // This code is copied from the `lerp.dart` file in the dart:ui package.

  /// Linearly interpolate between two numbers, `a` and `b`, by an extrapolation
  /// factor `t`.
  ///
  /// When `a` and `b` are equal or both NaN, `a` is returned.  Otherwise,
  /// `a`, `b`, and `t` are required to be finite or null, and the result of `a +
  /// (b - a) * t` is returned, where nulls are defaulted to 0.0.
  double? _lerpDouble(num? a, num? b, double t) {
    if (a == b || (a?.isNaN ?? false) && (b?.isNaN ?? false)) {
      return a?.toDouble();
    }
    a ??= 0.0;
    b ??= 0.0;
    assert(
        a.isFinite, 'Cannot interpolate between finite and non-finite values');
    assert(
        b.isFinite, 'Cannot interpolate between finite and non-finite values');
    assert(t.isFinite, 't must be finite when interpolating between values');
    return a * (1.0 - t) + b * t;
  }
}
''';
