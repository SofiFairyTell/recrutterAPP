
class User {
  int auth_source_id;
  String firstname;
  String lastname;

  User({
    required this.auth_source_id,
    required this.firstname,
    required this.lastname
  });

  factory User.fromJson(Map<String, dynamic> json) {
    List<User> custom = [];
    List<int> subtaskIds = [];

    if (json['children'] != null) {
      custom = (json['children'] as List)
          .map((subtaskJson) => User.fromJson(subtaskJson))
          .toList();
      subtaskIds = custom.map((custom) => custom.auth_source_id).toList();
    }

    return User(
        auth_source_id: json['id'],
        firstname: json['name'],
        lastname:json['mail']
    );
  }
}