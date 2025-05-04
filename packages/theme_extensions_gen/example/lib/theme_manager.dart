import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  ThemeManager(
    List<ThemeExtension> light,
    List<ThemeExtension> dark,
  )   : _light = light,
        _dark = dark,
        _isLight = true;

  final List<ThemeExtension> _light;
  final List<ThemeExtension> _dark;
  bool _isLight;

  List<ThemeExtension> get extensions => _isLight ? _light : _dark;

  bool get isLight => _isLight;

  void toggle() {
    _isLight = !_isLight;
    notifyListeners();
  }
}
