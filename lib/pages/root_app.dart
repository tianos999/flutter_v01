import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:snack_cart/core/constants/constants.dart';
import 'package:snack_cart/pages/demo_page.dart';
import 'package:snack_cart/pages/event_details.dart';
import 'package:snack_cart/pages/explore.dart';
import 'package:snack_cart/pages/snack_cart/snack_cart_step_02.dart';
import 'package:snack_cart/pages/snack_cart/snack_cart_step_03.dart';
import 'package:snack_cart/pages/my_orders.dart';
import 'package:snack_cart/pages/settings.dart';
import 'package:snack_cart/pages/snack_cart/snack_cart_step_01.dart';
import 'package:snack_cart/core/constants/app_color.dart';
import 'package:snack_cart/pages/snack_cart/snack_cart_step_04.dart';
import 'package:snack_cart/presentation/widgets/bottombar_item.dart';
import 'package:snack_cart/presentation/widgets/custom_image.dart';

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
    {
      "icon": Icons.add,
      "active_icon": Icons.add,
      "page": DemoPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildBody(),
      backgroundColor: Colors.white,
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

  Widget _buildBody() {
    return IndexedStack(
      index: _currentIndex,
      children: List.generate(
        _barItems.length,
        (index) => _barItems[index]["page"],
      ),
    );
  }

  Widget _buildBottomBar() {

    List<BottomNavigationBarItem> itemsList =  List<BottomNavigationBarItem>.empty(growable: true);

    for (final (index, item) in _barItems.indexed) {
      BottomNavigationBarItem barItem = BottomNavigationBarItem(
        icon: Icon(
          _currentIndex == index ? _barItems[index]["active_icon"] : _barItems[index]["icon"],
        ),
      );

      itemsList.add(barItem);

      if ((index + 1) == Constants.MAX_PAGES) {
        break;
      }
    }

    return SnakeNavigationBar.color(
      currentIndex: _currentIndex,
      backgroundColor: AppColor.secondaryDuskyPeriwinkle,
      behaviour: SnakeBarBehaviour.floating,
      snakeShape: SnakeShape.circle,
      snakeViewColor: AppColor.primaryMagenta,
      selectedItemColor: AppColor.secondaryCodGray,
      unselectedItemColor: Colors.white,
      items: itemsList,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      titleSpacing: 0,
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          top: 10.0,
          right: 0.0,
          bottom: 10.0,
        ),
        child: Image.asset(
          'assets/images/splash_logo_v01.png',
          width: 35,
          height: 35,
          fit: BoxFit.contain, // Optional: scale the image
        ),
      ),
      title: const Text(
        'ThaMi Eventos',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: AppColor.secondaryCodGray
        )
      ),
      backgroundColor: AppColor.secondaryDuskyPeriwinkle,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          color: Colors.white,
          onPressed: () {
            debugPrint('Notifications pressed');
          },
        ),
        PopupMenuButton<String>(
          iconColor: Colors.white,
          onSelected: (value) {
            debugPrint('Selected: $value');
          },
          itemBuilder: (context) => const [
            PopupMenuItem(
              child: Text(
                'Settings',
                style: TextStyle(color: AppColor.secondaryCodGray),
              ),
            ),
            PopupMenuItem(
              child: Text(
                'Help',
                style: TextStyle(color: AppColor.secondaryCodGray),
              ),
            ),
            PopupMenuItem(
              child: Text(
                'Logout',
                style: TextStyle(color: AppColor.secondaryCodGray),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
