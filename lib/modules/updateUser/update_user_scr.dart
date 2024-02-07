import 'package:admin_racing/modules/updateUser/update_user_ctrl.dart';
import 'package:admin_racing/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../models/user_model.dart';
import '../../utils/my_elevated_btn.dart';
import '../home/home_ctrl.dart';
class UpdateUserScr extends StatefulWidget {
   UpdateUserScr({super.key,required this.data});
   final Data? data;

  @override
  State<UpdateUserScr> createState() => _UpdateUserScrState();
}

class _UpdateUserScrState extends State<UpdateUserScr> {
  Data? userModel;
  @override
  void initState() {
    super.initState();
    if (widget.data != null) {
      e.phonectrl.text = widget.data!.mobileNo ?? '';
      e.nameCTRL.text = widget.data!.name ?? '';
      e.emailCTRL.text = widget.data!.email ?? '';
      e.aadharCTRL.text = widget.data!.aadharNumber ?? '';
      e.panCTRL.text = widget.data!.panNumber ?? '';
      e.addressCTRL.text = widget.data!.address ?? '';
    }
    print(e.phonectrl.text);
    print(widget.data?.toJson());
  }
   final UpdateCTRL e = Get.put(UpdateCTRL());

   final HomeCTRL h = Get.find<HomeCTRL>();

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      content:  SingleChildScrollView(
        child: Column(
          children: [
            const Text('Update User',style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.w500,fontSize: 20),),
            Form(
              key:e.formkey,
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: e.nameCTRL,
                        decoration: InputDecoration(
                          hintText: 'Enter user name',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: e.emailCTRL,
                        decoration: InputDecoration(
                          hintText: 'Enter email number',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: e.phonectrl,
                        decoration: InputDecoration(
                          hintText: 'Enter mobile number',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: e.panCTRL,
                        decoration: InputDecoration(
                          hintText: 'Enter pan number',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: e.aadharCTRL,
                        decoration: InputDecoration(
                          hintText: 'Enter aadhar number',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: e.addressCTRL,
                        decoration: InputDecoration(
                          hintText: 'Enter address',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MyElevatedBtn(text: 'Update User',onPressed: (){
        
              if(e.formkey.currentState!.validate()){
                Map<String,dynamic> jsonBody = {
                  'id':widget.data?.id??"",
                  'mobileNo':e.phonectrl.text.toString(),
                  'name':e.nameCTRL.text.toString(),
                  'email':e.emailCTRL.text.toString(),
                  'aadharNumber':e.aadharCTRL.text.toString(),
                  'panNumber':e.panCTRL.text.toString(),
                  'address':e.addressCTRL.text.toString(),
                };
                e.updateUser(jsonBody: jsonBody).then((value) {
                  Get.back();
                  h.getAllUser();
        
                });
              }
        
            },),
        
          ],
        ),
      ),

    );

    //   Scaffold(
    //   appBar: AppBar(title: Text('Update Profile'),centerTitle: true,),
    //   body: Column(
    //     children: [
    //       Form(
    //         key:e.formkey,
    //         child:
    //       TextFormField(
    //         validator: e.validateMobile, // Link the validation function
    //         // maxLength: 10,
    //         controller: e.phonectrl,
    //         decoration: InputDecoration(
    //           hintText: 'Enter mobile number',
    //           hintStyle: TextStyle(color: Colors.grey),
    //           border: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(8),
    //           ),
    //         ),
    //         keyboardType: TextInputType.phone,
    //       ),
    //       ),
    //       MyElevatedBtn(text: 'Update User',onPressed: (){
    //
    //         if(e.formkey.currentState!.validate()){
    //           Map<String,dynamic> jsonBody = {
    //             'id':userModel?.id??"",
    //             'mobileNo':e.phonectrl.text.toString()
    //           };
    //           e.updateUser(jsonBody: jsonBody).then((value) {
    //             Get.back();
    //           });
    //         }
    //
    //       },)
    //     ],
    //   ),
    //
    // );
  }
}
