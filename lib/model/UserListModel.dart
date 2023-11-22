import 'package:recrutterapp/model/user.dart';

class UserList {
  final List<UserData> users;
  UserList(this.users);

  UserList.fromJson(List<dynamic> usersJson):
        users = usersJson.map((UserData) => UserData.fromJson(UserData)).toList();
}