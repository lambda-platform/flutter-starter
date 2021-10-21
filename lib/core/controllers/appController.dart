// import 'package:lambdastarter/core/models/district.dart';
import 'package:lambdastarter/core/models/user.dart';
import 'package:get/get.dart';
import 'package:lambdastarter/graphql/API/districts.dart';
class AppController extends GetxController {
  static AppController instance = Get.find();


  // RxList<District> districts = <District>[].obs;
  RxList<Districts$Query$Districts> districts = <Districts$Query$Districts>[].obs;
  Rx<User> user = User().obs;

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  setDistricts(List<Districts$Query$Districts>? districtsData) {
    if(districtsData != null){
      districts.value = districtsData;
    }

  }

  setUser(User userData) {

    user.value = userData;

  }
}
