import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  // Adiciona informações
  static Future<void> addNotification(
      String title, String body, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final notificationsString = prefs.getString('notifications') ?? '[]';
    final notificationsList = json.decode(notificationsString) as List;
    notificationsList.add({
      'title': title,
      'body': body,
      'data': data,
    });
    prefs.setString('notifications', json.encode(notificationsList));
  }

  // Busca informações
  static Future<List<Map<String, dynamic>>> getNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final notificationsString = prefs.getString('notifications') ?? '[]';
    return List<Map<String, dynamic>>.from(json.decode(notificationsString));
  }

  // Exclui informações
  static Future<void> deleteNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('notifications');
  }
}
