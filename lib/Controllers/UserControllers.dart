import 'package:flutter/material.dart';
import 'package:qstl_test/Services/LocalDatabase/Boxes.dart';
import 'package:qstl_test/Services/UserService.dart';

import '../Models/UserModel.dart';

class UserController extends ChangeNotifier {
  List<User>? users;

  Future fetchAllUsers() async {
    users = await UserService.fetchAllUsers();
    notifyListeners();
  }

  Future<void> selectUser(int id) async {
    var selectedUsers = Boxes.getSelectedUsers().values.first;
    // ignore: prefer_conditional_assignment
    if (selectedUsers.users == null) {
      selectedUsers.users = [id];
    } else {
      selectedUsers.users!.add(id);
    }
    await selectedUsers.save();
    notifyListeners();
  }

  Future<void> deSelectUser(int id) async {
    var selectedUsers = Boxes.getSelectedUsers().values.first;
    // ignore: prefer_conditional_assignment
    if (selectedUsers.users == null) {
      return;
    }
    selectedUsers.users!.remove(id);

    await selectedUsers.save();
    notifyListeners();
  }
}
