import 'package:flutter/material.dart';

class AppColor {
  static Color secondary = const Color(0xff2d2a50);
  static Color primary = const Color(0xffc11012);
}

class Screen {
  // contains function for  navigations
  static push(BuildContext context, Widget Screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Screen));
  }

  static replace(BuildContext context, Widget Screen) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Screen));
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }

  static void loadingProgressIndicator(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    showDialog(
      barrierDismissible: false,
      builder: (ctx) {
        return Center(
          child: CircularProgressIndicator.adaptive(
            backgroundColor: AppColor.primary,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      },
      context: context,
    );
  }

  static void showSnackBar(
      {required BuildContext context, required String content}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Padding(
          padding: EdgeInsets.only(
            // top: height * 0.6,
            left: width * 0.015,
            right: width * 0.015,
            bottom: 0,
          ),
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: width * 0.03),
              // ignore: sort_child_properties_last
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: SizedBox(
                      width: width * 0.5,
                      child: Text(
                        content,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
            ),
          ),
        )));
  }
}
