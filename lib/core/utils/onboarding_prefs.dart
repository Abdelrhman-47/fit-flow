import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PrefHelpers {
  static const String _onboardingCompletedKey = 'onboarding_completed';

  static Future<bool> isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingCompletedKey) ?? false;
  }

  static Future<void> setOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingCompletedKey, true);
  }
    static const String _userDataKey = 'user_data';

  static Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_userDataKey);
    if (data != null) {
      return jsonDecode(data);
    }
    return null;
  }

  static Future<void> setUserData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userDataKey, jsonEncode(data));
  }

  static const String _planIdKey = 'selected_plan_id';

  static Future<String?> getPlanId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_planIdKey);
  }

  static Future<void> setPlanId(String planId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_planIdKey, planId);
  }
}