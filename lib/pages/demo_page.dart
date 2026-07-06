import 'package:flutter/material.dart';
import 'package:snack_cart/core/constants/app_color.dart';
import 'package:snack_cart/core/network/api_service_user.dart';
import 'package:snack_cart/core/utils/data.dart';
import 'package:snack_cart/core/utils/utils_mixin.dart';
import 'package:snack_cart/data/models/user_model.dart';
import 'package:snack_cart/presentation/widgets/custom_image.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> with UtilsMixin {

  // Store the future execution inside a variable to prevent
  // unnecessary API calls whenever the widget rebuilds.
  late Future<User> _futureUser;

  @override
  void initState() {
    super.initState();
    _futureUser = fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        tianosSliverAppBar(
            data01: 'SPONSORED CONTENT',
            data02: 'Demo Page',
            icon: Icons.shopping_cart,
            onPressed: () {}
        ),
        SliverToBoxAdapter(child: _buildBody())
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          _apiUserData(),
          SizedBox(height: 70),
        ],
      ),
    );
  }

  Widget _apiUserData() {
    return Center(
      child: FutureBuilder<User>(
        future: _futureUser,
        builder: (context, snapshot) {
          // 1. Handle loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          // 2. Handle error state
          else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          // 3. Handle success state when data is available
          else if (snapshot.hasData) {
            final user = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ID: ${user.id}'),
                Text('Name: ${user.name}', style: const TextStyle(fontSize: 20)),
                Text('Email: ${user.email}'),
              ],
            );
          }

          return const Text('No data found - pollo');
        },
      ),
    );
  }
}
