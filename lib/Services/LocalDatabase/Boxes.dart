import 'package:hive/hive.dart';
import 'package:qstl_test/Services/LocalDatabase/SelectedUser.dart';

class Boxes {
  static Box<SelectedUsers> getSelectedUsers() =>
      Hive.box<SelectedUsers>('SelectedUsers');
}
