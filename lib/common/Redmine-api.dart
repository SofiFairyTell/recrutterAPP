/// Класс для взаимодействия с API Redmine

import 'package:http/http.dart' as http;
import 'package:recrutterapp/model/Redmine/Projects.dart';
import 'package:recrutterapp/model/Redmine/User.dart';
import 'dart:convert';
import '../model/Redmine/Issue.dart';
import '../model/Redmine/Person.dart';

class RedmineApi {
  final String baseUrl;
  final String apiKey;

  RedmineApi({required this.baseUrl, required this.apiKey});

  /*** Получить то что есть на сервере
   * apiKey - ключ пользователя Redmine
   * baseURL - ссылка на Redmine
   * */
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

  static Future<List<User>> getUser(String apiKey, String baseUrl) async {
    List<User> allUser = [];
    int offset = 0;
    int limit = 100; // Установите желаемый лимит
    while(true)
    {
      final response = await http.get(
        Uri.parse('$baseUrl/people?per_page=$limit'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<Map<String, dynamic>> userJson = List<Map<String, dynamic>>.from(data['people']);

        if (userJson.isEmpty) {
          break;
        }

        allUser.addAll(userJson.map((userJson) => User.fromJson(userJson)));
        offset += limit; // Увеличиваем смещение для следующего запроса
      } else {
        throw Exception('Failed to load people');
      }
    }
    return allUser;
  }

  static Future <List<User>> fetchRedmineUsers(String baseUrl, String apiKey) async {
    List<User> allUser = [];
    final response = await http.get(
      Uri.parse('$baseUrl/users.json?key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<Map<String, dynamic>> userJson = List<Map<String, dynamic>>.from(data['people']);
      return allUser;
    } else {
      throw Exception('Failed to load users');
    }
  }

  static Future<List<List<Person>>> fetchPeopleInProjects(String apiKey, String baseUrl) async {
    final List<List<Person>> allPeopleInProjects = [];
    final List<String> processedProjectIds = [];

    final projects = await getProjects(apiKey, baseUrl);

    for (var project in projects) {
      if (processedProjectIds.contains(project.id.toString())) {
        // Проект уже обработан, пропускаем его
        continue;
      }

      final response = await http.get(
        Uri.parse('$baseUrl/projects/${project.id}/memberships.json?key=$apiKey'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<Map<String, dynamic>> membershipsJson = List<Map<String, dynamic>>.from(data['memberships']);

        final List<Person> peopleInProject = membershipsJson.map((membershipJson) => Person.fromJson(membershipJson)).toList();
        allPeopleInProjects.add(peopleInProject);

        // Добавляем id проекта в список уже обработанных
        processedProjectIds.add(project.id.toString());
      } else {
        throw Exception('Failed to load people in projects');
      }
    }

    return allPeopleInProjects;
  }
}