class UserData{
  String? id;
  String? name;
  String? email;
  String? phone;
  String? data;

  UserData({
    required this.id,
    required this.name,
    this.email,
    this.phone,
  });


  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

}
