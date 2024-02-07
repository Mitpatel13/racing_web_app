import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

import '../alluser/all_user_scr.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenu,
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedHoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
            ),
            items: [
              SideMenuItem(
                title: 'Users',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.supervisor_account),
              ),

              SideMenuItem(
                title: 'Exit',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.exit_to_app),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                const AllUserScr(),
                // Container(
                //   color: Colors.white,
                //   child: const Center(
                //     child: Text(
                //       'Users',
                //       style: TextStyle(fontSize: 35),
                //     ),
                //   ),
                // ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Exit',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}