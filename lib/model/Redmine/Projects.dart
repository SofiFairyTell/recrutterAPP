class Projects{
  int id;
  String name;
  String createdOn;
  String updatedOn;


  Projects({
   required this.id,
    required this.name,
    required this.createdOn,
    required this.updatedOn
});

  factory Projects.fromJson(Map<String, dynamic> json) {
    List<Projects> subtasks = [];
    List<int> subtaskIds = [];

    if (json['children'] != null) {
      subtasks = (json['children'] as List)
          .map((subtaskJson) => Projects.fromJson(subtaskJson))
          .toList();
      subtaskIds = subtasks.map((subtask) => subtask.id).toList();
    }

    return Projects(
        id: json['id'],
        name: json['name'],
        createdOn: json['created_on'] ?? '',
        updatedOn: json['updated_on'] ?? ''
    );
  }
}