import 'package:admin_racing/modules/home/home_ctrl.dart';
import 'package:admin_racing/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../updateUser/update_user_scr.dart';
class AllUserScr extends StatefulWidget {
  const AllUserScr({super.key});

  @override
  State<AllUserScr> createState() => _AllUserScrState();
}

class _AllUserScrState extends State<AllUserScr> {
  final HomeCTRL c = Get.find<HomeCTRL>();

  @override
  void initState() {
    super.initState();
   c.getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: Text("Mobile No")),
                Expanded(child: Text("Email")),
                Expanded(child: Text("Name")),
                Expanded(child: Text("Aadhar No")),
                Expanded(child: Text("Pancard No")),
              ],
            ),
            const Divider(),
            showUserList(),
          ],
        ),
      ),
    );
  }
  Widget showUserList() {
    return Obx(
          () {
        final userList = c.userList;
        if (userList.isEmpty) {
          return const Center(child: Column(
            children: [
              Text('No users found!'),
            ],
          ));
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: userList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final user = userList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),

                child: ListTile(
                  style: ListTileStyle.list,

                  hoverColor: AppColor.primaryColor,

                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: Text(user.mobileNo ?? "")),
                      Expanded(child: Text(user.email ?? "")),
                      Expanded(child: Text(user.name ?? "")),
                      Expanded(child: Text(user.aadharNumber ?? "")),
                      Expanded(child: Text(user.panNumber ?? "")),
                    ],
                  ),
                  trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return UpdateUserScr(data: user,);
                            },
                          );
                        },
                        icon: const Icon(Icons.edit,color: Colors.green),
                      ),
                      IconButton(
                        onPressed: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CupertinoAlertDialog(
                                content: const Text('Are you sure to delete this user'),
                                actions: [
                                  CupertinoDialogAction(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    onPressed: () {
                                      c.deleteUser(
                                        userId: user.id.toString(),
                                      ).then((value) {
                                        Get.back();
                                        c.getAllUser();
                                      });
                                    },
                                    isDestructiveAction: true,
                                    child: const Text('Delete'),
                                  ),
                                ],
                              );
                            },
                          );

                        },
                        icon: const Icon(Icons.delete_forever,color: Colors.red,),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
