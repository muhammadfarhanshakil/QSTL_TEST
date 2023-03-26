import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:qstl_test/Controllers/UserControllers.dart';
import 'package:qstl_test/Services/LocalDatabase/Boxes.dart';
import 'package:qstl_test/Services/LocalDatabase/SelectedUser.dart';
import 'package:qstl_test/View/widgets/Button.dart';
import 'package:qstl_test/View/widgets/Input_field.dart';
import 'package:qstl_test/constants.dart';
import 'package:hive/hive.dart';
import 'Models/UserModel.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:provider/provider.dart';

import 'View/ApiDataWidget.dart';
import 'View/LoginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(SelectedUsersAdapter());

  await Hive.openBox<SelectedUsers>('SelectedUsers');

  if (Boxes.getSelectedUsers().values.isEmpty) {
    Boxes.getSelectedUsers().add(SelectedUsers());
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'QSTL TASK',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: AppColor.primary,
                  title: const Text('QSTL TASK'),
                  pinned: true,
                  floating: true,
                  snap: true,
                  bottom: const TabBar(
                    // isScrollable: true,
                    tabs: [
                      Tab(child: Text('API Data')),
                      Tab(child: Text('Login Screen')),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: <Widget>[
                Consumer<UserController>(builder: (context, value, _) {
                  if (value.users == null) {
                    value.fetchAllUsers();

                    return Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: AppColor.primary,
                        valueColor: const AlwaysStoppedAnimation(Colors.white),
                      ),
                    );
                  }

                  print("value.users!.length ${value.users!.length}");
                  return ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: width * 0.05),
                      itemCount: value.users!.length,
                      itemBuilder: (context, index) {
                        return ApiDataWidget(
                          index: index,
                        );
                      });
                }),
                const LoginScreen()
              ],
            ),
          )),
    );
  }
}
