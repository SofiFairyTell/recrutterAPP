class Issue {
  int id;
  String subject;
  String project;
  List<Issue> subtasks;
  List<int> subtaskIds;
  String stage;

  Issue({
    required this.id,
    required this.subject,
    required this.project,
    required this.subtasks,
    required this.subtaskIds,
    required this.stage,
  });

  factory Issue.fromJson(Map<String, dynamic> json) {
    List<Issue> subtasks = [];
    List<int> subtaskIds = [];

    if (json['children'] != null) {
      subtasks = (json['children'] as List)
          .map((subtaskJson) => Issue.fromJson(subtaskJson))
          .toList();
      subtaskIds = subtasks.map((subtask) => subtask.id).toList();
    }

    return Issue(
      id: json['id'],
      subject: json['subject'],
      project: json['project']['name'],
      subtasks: subtasks,
      subtaskIds: subtaskIds, stage: ''
      //stage: json['stage'] != null ? json['stage']['value'] as String? : null
    );
  }
}
