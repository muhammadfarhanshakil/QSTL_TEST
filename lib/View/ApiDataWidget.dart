import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controllers/UserControllers.dart';
import '../Services/LocalDatabase/Boxes.dart';
import '../constants.dart';

class ApiDataWidget extends StatelessWidget {
  const ApiDataWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var userController = context.read<UserController>();

    var selectedUserBox = Boxes.getSelectedUsers().values.first;

    bool isSelected = selectedUserBox.users == null
        ? false
        : selectedUserBox.users!.contains(userController.users![index].id);

    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: width * 0.05),
        child: InkWell(
          onTap: () {},
          onLongPress: () {
            Screen.showSnackBar(
                context: context,
                content: "Double tap to ${isSelected ? 'Deselect' : 'Select'}");
          },
          onDoubleTap: () async {
            Screen.loadingProgressIndicator(context);
            if (isSelected) {
              await userController
                  .deSelectUser(userController.users![index].id);
            } else {
              await userController.selectUser(userController.users![index].id);
            }
            Screen.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            width: width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.secondary),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      userController.users![index].name,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const Spacer(),
                    if (isSelected)
                      const Text(
                        "Selected",
                        style: TextStyle(color: Colors.yellow),
                      )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.email,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      userController.users![index].email,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.call,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      userController.users![index].phone,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: width * 0.8 - 25,
                      child: Text(
                        '${userController.users![index].address.street}, ${userController.users![index].address.city}',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      CupertinoIcons.globe,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: width * 0.8 - 40,
                      child: Text(
                        userController.users![index].website,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
