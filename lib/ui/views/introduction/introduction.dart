import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubengineering/ui/styles/_colors.dart';
import 'package:get/get.dart';
import 'package:ubengineering/ui/views/authentication/login.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  IntroductionScreenState createState() => IntroductionScreenState();
}

class IntroductionScreenState extends State<IntroductionScreen> {
  int pageIndex = 0;

  void changeIndex(index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    PageController _pageViewController = PageController(initialPage: 0);
    SharedPreferences? _prefs;
    List<Widget> pages = [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: (MediaQuery.of(context).size.width) * 0.6,
              child: Image(
                image:
                    AssetImage('assets/images/introduction/introduction1.png'),
              ),
            ),
            Text(
              'Улаанбаатар хотын инженер хангамжийн байгууллагын нэгдсэн мэдээллийн сан',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: dark,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Иргэдийн амар тайван байдал, аюулгүй орчноор хангах зорилго бүхий систем',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: textDarkGrey,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: (MediaQuery.of(context).size.width) * 0.6,
              child: Image(
                image:
                    AssetImage('assets/images/introduction/introduction2.png'),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Хүсэлт илгээх',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: dark,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Аюулгүй орчноор хангах',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: textDarkGrey,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: (MediaQuery.of(context).size.width) * 0.6,
              child: Image(
                image:
                    AssetImage('assets/images/introduction/introduction3.png'),
              ),
            ),
            Text(
              'Улаанбаатар хотын инженер хангамжийн байгууллагын нэгдсэн мэдээллийн сан',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: dark,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Иргэдийн амар тайван байдал, аюулгүй орчноор хангах зорилго бүхий систем',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: textDarkGrey,
              ),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () async {
                  _prefs = await SharedPreferences.getInstance();
                  await _prefs!.setBool("is_first_run", false);
                  Get.offAllNamed("/login");
                },
                child: Text(
                  'Алгасах',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: textDarkGrey,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 20,
                    child: PageView(
                      onPageChanged: (index) {
                        changeIndex(index);
                      },
                      controller: _pageViewController,
                      scrollDirection: Axis.horizontal,
                      children: pages,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        pageIndex == 0
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
                        pageIndex == 1
                            ? Container(
                                height: 6,
                                width: 16,
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: bgSecondColor,
                                ),
                              )
                            : Container(
                                height: 6,
                                width: 6,
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: bgNonActive,
                                ),
                              ),
                        pageIndex == 2
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
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
              width: double.infinity,
              child: pages.length == pageIndex + 1
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          double.infinity,
                          56,
                        ),
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () async {
                        _prefs = await SharedPreferences.getInstance();
                        await _prefs!.setBool("is_first_run", false);
                        Get.offAllNamed("/login");
                      },
                      child: Text(
                        'Эхлэх',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          double.infinity,
                          56,
                        ),
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        if (pages.length != pageIndex + 1) {
                          _pageViewController.animateToPage(
                            pageIndex + 1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        }
                      },
                      child: Text(
                        'Дараагийн хуудас',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
