import 'package:pub_semver/pub_semver.dart';

/// A no-op code formatter used in tests to disable formatting.
///
/// This is necessary to obtain unmodified output from the generator
/// for exact character-by-character comparison in tests. To generate
/// consistent `.g.part` files:
///
/// 1. Replace the formatter in your builder with [noopFormatter].
/// 2. Run the generator in the real project.
/// 3. Copy the generated `.g.part` files into test assets.
/// 4. Use them as expected outputs for comparison.
///
/// This avoids discrepancies caused by the analyzer or formatting tools
/// that might alter whitespace, trailing commas, or keyword placement.
String noopFormatter(String code, Version version) => code;
