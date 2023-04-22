import 'package:shared_preferences/shared_preferences.dart';

class QuotePreferences {
  static const String _lastQuoteIndexKey = 'lastQuoteIndex';

  static Future<SharedPreferences> _prefs() async {
    return await SharedPreferences.getInstance();
  }

  static Future<int> getLastQuoteIndex() async {
    final prefs = await _prefs();
    return prefs.getInt(_lastQuoteIndexKey) ?? -1;
  }

  static Future<void> setLastQuoteIndex(int index) async {
    final prefs = await _prefs();
    prefs.setInt(_lastQuoteIndexKey, index);
  }
}
