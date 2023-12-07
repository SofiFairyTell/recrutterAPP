class Issue {
  int id;
  String subject;
  String project;
  List<Issue> subtasks;
  List<int> subtaskIds;
  String stage;
  String tracker;
  String priority;
  String author;
  String description;

  String startDate;
  String dueDate;
  String createdOn;
  String updatedOn;
  String progress;
  String estimatedHours;
  String status;
  String assignedTo;

  Issue({
    required this.id,
    required this.subject,
    required this.project,
    required this.subtasks,
    required this.subtaskIds,
    required this.stage,
    required this.startDate,
    required this.dueDate,
    required this.estimatedHours,
    required this.progress,
    required this.status,
    required this.author,
    required this.createdOn,
    required this.updatedOn,
    required this.description,
    required this.priority,
    required this.tracker,
    required this.assignedTo
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
      subtaskIds: subtaskIds, stage: '',
      startDate: json['start_date'] ?? '',
      dueDate: json['due_date'] ?? '',
      estimatedHours: json['estimated_hours']?? '',
      progress: '',
      status: json['status']['name'] ?? '',
      author: json['author'] ?? '',
      createdOn: json['created_on'] ?? '',
      updatedOn: json['updated_on'] ?? '',
      description: json['description'] ?? '',
        assignedTo:json['assigned_to'] ?? '',
        priority: json['priority']['name'] ?? '',
        tracker: json['tracker']['name'] ?? ''
      //stage: json['stage'] != null ? json['stage']['value'] as String? : null
    );
  }
}
