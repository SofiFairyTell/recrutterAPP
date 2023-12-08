/// Класс для взаимодействия с API Redmine

import 'package:http/http.dart' as http;
import 'package:recrutterapp/model/Redmine/Projects.dart';
import 'dart:convert';
import '../model/Redmine/Issue.dart';

class RedmineApi {
  final String baseUrl;
  final String apiKey;

  RedmineApi({required this.baseUrl, required this.apiKey});

  static Future<List<Projects>> getProjects(String apiKey, String baseUrl) async {
    List<Projects> allProjects = [];
    int offset = 0;
    int limit = 100; // Установите желаемый лимит
    while(true)
      {
        final response = await http.get(
          Uri.parse('$baseUrl/projects.json?key=$apiKey&offset=$offset&limit=$limit'),
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          final List<Map<String, dynamic>> projectsJson = List<Map<String, dynamic>>.from(data['projects']);

          if (projectsJson.isEmpty) {
            // Если больше нет задач, завершаем цикл
            break;
          }
          // Добавляем полученные задачи к общему списку
          allProjects.addAll(projectsJson.map((projectsJson) => Projects.fromJson(projectsJson)));
          offset += limit; // Увеличиваем смещение для следующего запроса
        } else {
          throw Exception('Failed to load issues');
        }
      }
      return allProjects;
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

}