import 'package:flutter/material.dart';
import 'package:ubengineering/ui/styles/_colors.dart';
import 'package:intl/intl.dart';

class SendRequestWidget extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final DateTime time;
  final int? statusId;
  final String? organization;
  final Function()? onTap;
  const SendRequestWidget({
    Key? key,
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.statusId,
    required this.organization,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Container status;
    switch (statusId) {
      case 1:
        status = Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            color: mainColor,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Хүлээгдэж буй',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
              ),
            ),
          ),
        );
        break;
      case 2:
        status = Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            color: bgSecondColor,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Хуваарилагдсан',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
              ),
            ),
          ),
        );
        break;
      case 3:
        status = Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            color: Color(0xFF5BA092),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Шийдэгдсэн',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
              ),
            ),
          ),
        );
        break;
      default:
        status = Container();
    }
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
              border: Border.all(
                color: textGrey,
              ),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          title.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: dark,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: bgSecondColor,
                      ),
                      child: Icon(
                        Icons.chevron_right,
                        size: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          description.toString(),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14,
                            color: textDarkGrey,
                            height: 1.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                size: 18.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                DateFormat('yyyy/MM/d hh:mm aaa')
                                    .format(time)
                                    .toString(),
                                style: TextStyle(
                                  color: textDarkGrey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          status
                        ],
                      ),
                    ],
                  ),
                ),
                organization != null
                    ? Column(
                        children: [
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Хариуцагч байгууллага: ${organization.toString()}',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: textDarkGrey,
                            ),
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
