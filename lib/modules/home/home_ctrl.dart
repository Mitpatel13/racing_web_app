import 'package:get/get.dart';

import '../../backend/user_repo.dart';
import '../../models/user_model.dart';

class HomeCTRL extends GetxController {
  RxList<Data> userList = <Data>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllUser();
  }

  Future<void> getAllUser() async {
    try {
      var users = await UserRepo().getAllUser(adminId: "65c326f2033a88e5d86ae270");
      userList.assignAll(users);
    } catch (e, t) {
      print('Error in getAllUser: $e');
      print('Trace in getAllUser: $t');
      // Handle errors here, if needed
    }
  }
  Future<void> deleteUser({required String userId}) async {
    try {
      var users = await UserRepo().deleteUser(adminId: "65c326f2033a88e5d86ae270",userId: userId);
      return users;
    } catch (e, t) {
      print('Error in getAllUser: $e');
      print('Trace in getAllUser: $t');
      // Handle errors here, if needed
    }
  }
}
