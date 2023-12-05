/// Класс для взаимодействия с API Redmine

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/Redmine/Issue.dart';

class RedmineApi {
  final String baseUrl;
  final String apiKey;

  RedmineApi({required this.baseUrl, required this.apiKey});

  Future<List<Issue>> getAllIssues() async {
    final response = await http.get(
      Uri.parse('$baseUrl/issues.json?key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<Map<String, dynamic>> issuesJson = List<Map<String, dynamic>>.from(data['issues']);

      return issuesJson.map((issueJson) => Issue.fromJson(issueJson)).toList();
    } else {
      throw Exception('Failed to load issues');
    }
  }

  static Future<List<Issue>> getIssues(String apiKey, String baseUrl) async {
    List<Issue> allIssues = [];
    int offset = 0;
    int limit = 100; // Установите желаемый лимит
    while(true)
      {
        final response = await http.get(
          Uri.parse('$baseUrl/issues.json?key=$apiKey&offset=$offset&limit=$limit'),
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          final List<Map<String, dynamic>> issuesJson = List<Map<String, dynamic>>.from(data['issues']);

          if (issuesJson.isEmpty) {
            // Если больше нет задач, завершаем цикл
            break;
          }
          // Добавляем полученные задачи к общему списку
          allIssues.addAll(issuesJson.map((issueJson) => Issue.fromJson(issueJson)));
          offset += limit; // Увеличиваем смещение для следующего запроса
        } else {
          throw Exception('Failed to load issues');
        }
      }
      return allIssues;
  }

  //Нужен ли этот main??
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

}