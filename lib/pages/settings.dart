import 'package:flutter/material.dart';
import 'package:snack_cart/core/constants/color.dart';
import 'package:snack_cart/core/utils/data.dart';
import 'package:snack_cart/presentation/widgets/custom_image.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: AppColor.appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: _buildHeader(),
        ),
        SliverToBoxAdapter(child: _buildBody())
      ],
    );
  }

  _buildHeader() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hola!",
                  style: TextStyle(
                    color: AppColor.darker,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Alfredo Bringas",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            CustomImage(
              profile,
              width: 35,
              height: 35,
              trBackground: true,
              borderColor: AppColor.primary,
              radius: 10,
            ),
          ],
        ),
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sizedBox(),
          // Settings Group 1
          _buildSettingsGroup([
            _buildListTile(Icons.person_outline, Colors.orange, 'Profile'),
            _buildListTile(Icons.notifications_none, Colors.blue, 'Notification'),
            _buildListTile(Icons.lock_outline, Colors.green, 'Change Password'),
          ]),
          // Settings Group 2
          _buildSettingsGroup([
            _buildListTile(Icons.dark_mode_outlined, Colors.blueGrey, 'Appearance'),
            _buildListTile(Icons.favorite_border, Colors.redAccent, 'Favorites'),
            _buildListTile(Icons.info_outline, Colors.grey, 'Privacy Policy'),
          ]),
          // Logout Group
          _buildSettingsGroup([
            _buildListTile(Icons.logout, Colors.red, 'Log Out', showTrailing: false, isDestructive: true),
          ]),
        ],
      ),
    );
  }

  _sizedBox() {
    return const SizedBox(
      height: 20,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> children) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildListTile(IconData icon, Color iconColor, String title, {bool showTrailing = true, bool isDestructive = false}) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(
        title,
        style: TextStyle(color: isDestructive ? Colors.red : Colors.black87),
      ),
      trailing: showTrailing ? Icon(Icons.chevron_right, color: Colors.grey) : null,
      onTap: () {},
    );
  }
}
