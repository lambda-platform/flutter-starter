import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubengineering/core/controllers/appController.dart';
import 'package:ubengineering/ui/styles/_colors.dart';

AppBar CustomBottomBarHeader(BuildContext context, text) {
  final AppController _appController = Get.put(AppController());
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // GestureDetector(
        //   onTap: () {
        //     // _appController.goBack();
        //   },
        //   child: Container(
        //     padding: const EdgeInsets.all(6.0),
        //     decoration: BoxDecoration(
        //       border: Border.all(
        //         width: 1.0,
        //         color: grey,
        //       ),
        //       shape: BoxShape.circle,
        //     ),
        //     child: Icon(
        //       Icons.chevron_left,
        //       color: dark,
        //     ),
        //   ),
        // ),
        // SizedBox(
        //   width: 10.0,
        // ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                letterSpacing: -0.5,
                color: dark,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        // SizedBox(
        //   width: 10.0,
        // ),
        // Icon(
        //   Icons.chevron_left,
        //   color: Theme.of(context).scaffoldBackgroundColor,
        // ),
      ],
    ),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 0,
  );
}
