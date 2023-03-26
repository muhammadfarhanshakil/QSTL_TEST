import 'package:hive/hive.dart';
part 'SelectedUser.g.dart';

@HiveType(typeId: 0)
class SelectedUsers extends HiveObject {
  @HiveField(0)
  List<int>? users;
}
