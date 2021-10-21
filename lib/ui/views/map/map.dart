import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:ubengineering/core/controllers/appController.dart';
import 'package:ubengineering/ui/styles/_colors.dart';

class Map extends StatefulWidget {
  final VoidCallback openEndDrawer;
  Map(this.openEndDrawer);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final AppController _appController = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        20.0,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Сайн байна уу?,',
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: -0.5,
                        color: dark,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      _appController.user.value.firstName ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        letterSpacing: -0.5,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  // onTap: () {
                  //   switch (_appController.user.value.role) {
                  //     case 3:
                  //       _appController.openCitizenEndDrawer();
                  //       break;
                  //     case 4:
                  //       _appController.openEnricherEndDrawer();
                  //       break;
                  //     case 5:
                  //       _appController.openFixerEndDrawer();
                  //       break;
                  //     default:
                  //   }
                  // },
                  // onTap: widget.openEndDrawer,
                  onTap: () {
                    widget.openEndDrawer();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: Color(
                          0xFFBEBAB3,
                        ),
                      ),
                    ),
                    child: Icon(Icons.menu),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(47.9187, 106.917782),
                  zoom: 12.0,
                ),
                layers: [
                  TileLayerOptions(
                      urlTemplate:
                          "http://103.50.205.138/map01/Tilemap/demo/{z}/{x}/{y}.png?mskey=12345",
                      subdomains: ['a', 'b', 'c']),
                  MarkerLayerOptions(
                    markers: [],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
