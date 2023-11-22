/// Класс для взаимодействия с API Redmine

import 'package:http/http.dart' as http;
import 'dart:convert';

class RedmineApi {
  final String baseUrl;
  final String apiKey;

  RedmineApi({required this.baseUrl, required this.apiKey});

  Future<List<Map<String, dynamic>>> getAllIssues() async {
    final response = await http.get(
      Uri.parse('$baseUrl/issues.json'),
      headers: {'X-Redmine-API-Key': apiKey},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<Map<String, dynamic>> issues = List.from(data['issues']);
      return issues;
    } else {
      throw Exception('Failed to load issues');
    }
  }

  void main() async {
    final String baseUrl = 'https://dev.sciener.ru';
    final String baseKey = 'de1b88738e2a19ec994caf6f88d4581d6edd16bb';

    final redmine = RedmineApi(baseUrl: baseUrl, apiKey: baseKey);

    try {
      final issues = await redmine.getAllIssues();
      print('Issues: $issues');
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<List<String>> getAllIssues() async {
    // Здесь реализуйте логику для получения задач из Redmine
    // Вместо List<String> верните реальный тип данных, который вы ожидаете
    return [];
  }
}