class UserInfo {
  String fullName;
  String password;
  String email;

  UserInfo({required this.fullName, required this.password, required this.email});

  static UserInfo fromFormFields(String fullName, String password, String email) {
    return UserInfo(
      fullName: fullName,
      password: password,
      email: email,
    );
  }
}
