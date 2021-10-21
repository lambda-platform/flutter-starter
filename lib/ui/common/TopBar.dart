import 'package:flutter/material.dart';
import 'package:lambdastarter/ui/styles/_colors.dart';

AppBar topBar({
  required BuildContext context,
  required String headerText,
  required bool isBottomTabScreen,
  VoidCallback? goBack,
  int? previusIndex,
}) {
  return AppBar(
    centerTitle: true,
    leadingWidth: 76.0,
    leading: Stack(
      children: [
        Positioned.fill(
          left: 20.0,
          child: GestureDetector(
            onTap: () {
              if (isBottomTabScreen) {
                goBack!();
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Container(
              margin: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: grey,
                  width: 1.0,
                ),
              ),
              child: Icon(
                Icons.chevron_left,
                color: dark,
                size: 30.0,
              ),
            ),
          ),
        ),
      ],
    ),
    title: Text(
      headerText,
      style: TextStyle(
        color: dark,
        fontWeight: FontWeight.w500,
        fontSize: 24,
        letterSpacing: -0.5,
      ),
    ),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 0,
  );
}
