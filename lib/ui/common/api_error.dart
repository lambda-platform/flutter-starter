import 'package:flutter/material.dart';

class ApiError extends StatelessWidget {
  const ApiError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          ),
        ),
        Text(
          'Алдаа гарлаа \nдахин оролдох',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
