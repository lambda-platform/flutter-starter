import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lambdastarter/core/constants/values.dart';
import 'package:lambdastarter/ui/styles/_colors.dart';

class RepairHistoryWidget extends StatelessWidget {
  final List<dynamic> images;
  final String description;
  final String endedDate;
  final String name;
  final int statusId;
  final Function()? onTap;
  const RepairHistoryWidget({
    Key? key,
    required this.images,
    required this.description,
    required this.endedDate,
    required this.onTap,
    required this.name,
    required this.statusId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var activeImage = 0.obs;
    Widget drawIndicator() {
      List<Widget> indicators = [];
      for (var i = 0; i < images.length; i++) {
        indicators.add(
          Column(
            children: [
              activeImage.value == i
                  ? Container(
                      height: 6,
                      width: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: bgSecondColor,
                      ),
                    )
                  : Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: bgNonActive,
                      ),
                    ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
        );
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: indicators,
      );
    }

    List<Container> imageCarousel = [];

    for (var i = 0; i < images.length; i++) {
      imageCarousel.add(
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                baseUrl + images[i]['response'],
              ),
            ),
          ),
        ),
      );
    }

    Widget status;

    switch (statusId) {
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
      case 4:
        status = Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            color: Colors.red,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Буцаагдсан',
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

    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: grey,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          )),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            images.length > 0
                ? Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(
                              20.0,
                            ),
                          ),
                        ),
                        height: 200.0,
                        child: PageView(
                          onPageChanged: (index) {
                            activeImage.value = index;
                          },
                          scrollDirection: Axis.horizontal,
                          children: imageCarousel,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Obx(
                        () => drawIndicator(),
                      ),
                    ],
                  )
                : Container(),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: dark,
                        height: 1.5,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(
                          0xFF78746D,
                        ),
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                endedDate,
                                style: TextStyle(
                                  color: textDarkGrey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          status
                        ],
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: Container(
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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
