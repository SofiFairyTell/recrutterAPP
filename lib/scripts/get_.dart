import 'dart:convert';
import 'dart:io';

void get_Issue() async {
  const apiKey = 'de1b88738e2a19ec994caf6f88d4581d6edd16bb';
  const redmine = 'https://dev.sciener.ru';

  // Выполняем HTTP-запрос для получения задач
  final response = await Process.run(
    'curl',
    [
      '-H',
      'X-Redmine-API-Key: $apiKey',
      '$redmine/issues.json',
    ],
  );

  if (response.exitCode != 0) {
    return;
  }

  final issues = json.decode(response.stdout)['issues'];

  // Записываем информацию о задачах в CSV-файл
  final file = File('tasks_info.csv');
  final sink = file.openWrite();

  // Задаем заголовки CSV-файла
  sink.writeln('Issue ID,Subject,Project,Subtasks,Subtasks ID,Stage');

  // Записываем информацию о каждой задаче и её подзадачах/связанных задачах в CSV-файл
  for (var issue in issues) {
    final subtasks = (issue['children'] as List<dynamic>).map((subtask) => subtask['subject']).join(', ');
    final subtasksId = (issue['children'] as List<dynamic>).map((subtask) => subtask['id'].toString()).join(', ');

    // Получаем значение кастомного поля "Этап"
    final stageValue = (issue['custom_fields'] as List<dynamic>)
        .firstWhere((field) => field['name'] == 'Этап', orElse: () => {})['value'];

    sink.writeln(
      '${issue['id']},${issue['subject']},${issue['project']['name']},$subtasks,$subtasksId,$stageValue',
    );
  }

  await sink.flush();
  await sink.close();

 // print('CSV file created: tasks_info.csv');
}
