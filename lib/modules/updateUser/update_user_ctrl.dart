import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../backend/user_repo.dart';
import '../../models/user_model.dart';
import '../home/home_ctrl.dart';
class UpdateCTRL extends GetxController {
  final HomeCTRL c = Get.find<HomeCTRL>();
  @override
  void onInit() {
    super.onInit();
  }
  final nameCTRL = TextEditingController();
  final emailCTRL = TextEditingController();
  final aadharCTRL = TextEditingController();
  final panCTRL = TextEditingController();
  final addressCTRL = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final phonectrl = TextEditingController(); // Initialize with empty string

  Future<void> updateUser({required Map<String,dynamic> jsonBody}) async {
    try {
      final res = await UserRepo().updateUser(
        adminId: "65c326f2033a88e5d86ae270",
        data: jsonBody,
      );
      await c.getAllUser();

      return res;
    } catch (e, t) {
      print('Error in update user $e');
      print('Trace in update user $t');
    }
  }

  String mobilePattern = r'^[6-9]\d{9}$';

  bool isValidMobile(String? value) {
    if (value == null || value.isEmpty) {
      return false; // Mobile number is empty
    }

    RegExp regExp = RegExp(mobilePattern);
    return regExp.hasMatch(value);
  }

  String? validateMobile(String? value) {
    if (!isValidMobile(value)) {
      return 'Please enter a valid mobile number';
    }
    return null; // Return null if validation passes
  }
}