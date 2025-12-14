import 'package:flutter/foundation.dart';
import '../services/storage_service.dart';

class SettingsProvider with ChangeNotifier {
  final StorageService _storageService = StorageService();

  String _language = 'en';
  bool _isDarkMode = false;
  bool _isLoading = false;

  String get language => _language;
  bool get isDarkMode => _isDarkMode;
  bool get isLoading => _isLoading;
  bool get isKhmer => _language == 'kh';

  Future<void> loadSettings() async {
    _isLoading = true;
    notifyListeners();

    try {
      _language = await _storageService.getLanguage();
      _isDarkMode = await _storageService.isDarkMode();
    } catch (e) {
      debugPrint('Error loading settings: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> setLanguage(String language) async {
    _language = language;
    await _storageService.setLanguage(language);
    notifyListeners();
  }

  Future<void> toggleLanguage() async {
    final newLanguage = _language == 'en' ? 'kh' : 'en';
    await setLanguage(newLanguage);
  }

  Future<void> setDarkMode(bool isDark) async {
    _isDarkMode = isDark;
    await _storageService.setDarkMode(isDark);
    notifyListeners();
  }

  Future<void> toggleDarkMode() async {
    await setDarkMode(!_isDarkMode);
  }
}
