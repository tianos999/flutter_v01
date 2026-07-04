import 'package:flutter/material.dart';
import 'package:snack_cart/core/constants/constants.dart';
import 'package:snack_cart/pages/event_details.dart';
import 'package:snack_cart/pages/explore.dart';
import 'package:snack_cart/pages/snack_cart/snack_cart_step_02.dart';
import 'package:snack_cart/pages/snack_cart/snack_cart_step_03.dart';
import 'package:snack_cart/pages/my_orders.dart';
import 'package:snack_cart/pages/settings.dart';
import 'package:snack_cart/pages/snack_cart/snack_cart_step_01.dart';
import 'package:snack_cart/core/constants/color.dart';
import 'package:snack_cart/pages/snack_cart/snack_cart_step_04.dart';
import 'package:snack_cart/presentation/widgets/bottombar_item.dart';

import 'home.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int _currentIndex = 0;

  late final List _barItems = [
    {
      "icon": Icons.home_outlined,
      "active_icon": Icons.home_rounded,
      "page": HomePage(onIndexChanged: _updateIndex),
    },
    {
      "icon": Icons.search_outlined,
      "active_icon": Icons.search,
      "page": ExplorePage(),
    },
    {
      "icon": Icons.add,
      "active_icon": Icons.add,
      "page": SnackCartStep01(onIndexChanged: _updateIndex),
    },
    {
      "icon": Icons.receipt_long,
      "active_icon": Icons.receipt_long_rounded,
      "page": MyOrdersPage(),
    },
    {
      "icon": Icons.settings_outlined,
      "active_icon": Icons.settings_rounded,
      "page": SettingsPage(),
    },
    {
      "icon": Icons.add,
      "active_icon": Icons.add,
      "page": SnackCartStep02(onIndexChanged: _updateIndex),
    },
    {
      "icon": Icons.add,
      "active_icon": Icons.add,
      "page": SnackCartStep03(onIndexChanged: _updateIndex),
    },
    {
      "icon": Icons.add,
      "active_icon": Icons.add,
      "page": SnackCartStep04(onIndexChanged: _updateIndex),
    },
    {
      "icon": Icons.add,
      "active_icon": Icons.add,
      "page": EventDetailsPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: _buildPage(),
      floatingActionButton: _buildBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      //drawer: const Drawer(child: Center(child: Text('Drawer'))),
    );
  }

  void _updateIndex(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  Widget _buildPage() {
    return IndexedStack(
      index: _currentIndex,
      children: List.generate(
        _barItems.length,
            (index) => _barItems[index]["page"],
      ),
    );
  }

  Widget _buildBottomBar() {

    final List<Widget> _bottomBarItemList =  List<Widget>.empty(growable: true);

    for (final (index, item) in _barItems.indexed) {
      if (_barItems[index]["page"] is SnackCartStep01) {
        FloatingActionButton floatingActionButton = FloatingActionButton(
          onPressed: () {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.indigoAccent, // TikTok pinkish-red
          foregroundColor: Colors.white,
          elevation: 15.0,
          hoverElevation: 8.0,     // Hovering state shadow
          highlightElevation: 12.0,// Pressed shadow depth
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: Colors.white, width: 4.0),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add, color: Colors.white, size: 24, weight: 700.0),
            ],
          ),
        );
        _bottomBarItemList.add(floatingActionButton);
      } else {
        BottomBarItem bottomBarItem = BottomBarItem(
          _currentIndex == index ? _barItems[index]["active_icon"] : _barItems[index]["icon"],
          isActive: _currentIndex == index,
          activeColor: AppColor.primary,
          onTap: () {
            setState(() {
              _currentIndex = index;
            });
          },
        );
        _bottomBarItemList.add(bottomBarItem);
      }

      if ((index + 1) == Constants.MAX_PAGES) {
        break;
      }
    }

    final BoxDecoration _boxDecoration = BoxDecoration(
      color: AppColor.bottomBarColor,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: AppColor.shadowColor.withOpacity(0.1),
          blurRadius: 1,
          spreadRadius: 1,
          offset: Offset(0, 1),
        )
      ],
    );

    return Container(
      height: 55,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: _boxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: _bottomBarItemList,
      ),
    );
  }
}
