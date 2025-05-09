import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'src/context_extensions_generator.dart';
import 'src/models/options/context_extensions_generator_config.dart';
import 'src/models/options/theme_generator_config.dart';
import 'src/theme_extension_impl_collector.dart';
import 'src/theme_extension_templates_collector.dart';
import 'src/theme_extensions_generator.dart';
import 'src/theme_extensions_impl_combiner.dart';
import 'src/validators/context_extensions_config_validator.dart';
import 'src/validators/theme_generator_config_validator.dart';

/// Provides a [Builder] that generates theme extensions from annotations.
Builder themeExtensionsGenerator(_) =>
    SharedPartBuilder([ThemeExtensionsGenerator()], 'theme_extension');

/// A [Builder] that generates temporary `.theme_impl.json` metadata files
/// used by the final combiner step. Does not require `part` directives.
Builder themeExtensionsImplCollector(_) => ThemeExtensionImplCollector();

/// A [Builder] that collects theme template class names and generates
/// a file with `ContextThemeExtensions`.
/// Temporary `.theme_templates.json` metadata is used for
/// the final combiner step.
/// Does not require `part` directives.
Builder themeExtensionsTemplatesCollector(_) =>
    ThemeExtensionTemplatesCollector();

/// A [Builder] that reads `.theme_impl.json` metadata and generates
/// a Dart file with a merged list of `ThemeExtension` instances.
Builder themeExtensionsImplCombiner(BuilderOptions options) {
  ThemeGeneratorConfigValidator.validate(options.config);
  return ThemeExtensionsImplCombiner(
    ThemeGeneratorConfig.fromMap(options.config),
  );
}

/// A [Builder] that reads `.theme_templates.json` metadata and generates
/// an extension on BuildContext with getters for all template class names.
/// For example,
/// an annotation over AppThemeBottomBar -> getter appThemeBottomBar
Builder contextExtensionsGenerator(BuilderOptions options) {
  ContextExtensionsConfigValidator.validate(options.config);
  return ContextExtensionsGenerator(
    ContextExtensionsGeneratorConfig.fromMap(options.config),
  );
}
