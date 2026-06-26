import 'package:flutter/material.dart';
import 'package:snack_cart/data/models/topping.dart';
import 'package:snack_cart/pages/snack_cart/snack_cart_step_03.dart';
import 'package:snack_cart/core/constants/color.dart';
import 'package:snack_cart/presentation/widgets/custom_image.dart';
import 'package:snack_cart/core/utils/data.dart';

class SnackCartStep01 extends StatefulWidget {
  const SnackCartStep01({super.key});

  @override
  State<SnackCartStep01> createState() => _SnackCartStep01State();
}

class _SnackCartStep01State extends State<SnackCartStep01> {
  final List<Topping> _acceptedItems = [];

  // Available toppings to drag
  final List<Topping> _sourceItems = [
    Topping('Cheese', Colors.cyanAccent),
    Topping('Pepperoni', Colors.red),
    Topping('Basil', Colors.green),
    Topping('Gato', Colors.blue),
  ];

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
        SliverToBoxAdapter(child: _buildBody1())
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

  _buildBody1() {
    return SingleChildScrollView(
      child: Column(
        // Main Axis for Column is Vertical (The 4 Rows)
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (rowIndex) {
          return Row(
            // Main Axis for Row is Horizontal (The 3 Columns)
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (colIndex) {
              return Expanded(
                child: Container(
                  margin: EdgeInsets.all(4.0),
                  color: Colors.blue[(rowIndex + colIndex + 1) * 100],
                  height: 100,

                  // Main content: Image, Title, and Price
                  child:
                  Container(
                    //width: 250,
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Colors.red,
                        width: 1.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        // Add Button in the top right corner
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(color: Colors.orange.withOpacity(0.3), blurRadius: 5, offset: Offset(0, 3))
                              ],
                            ),
                            child: Icon(Icons.add, color: Colors.white, size: 28),
                          ),
                        ),
                        // Main content: Image, Title, and Price
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 30.0,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Snack Box',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$12.99',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        }),
      ),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
        width: 250,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Add Button in the top right corner
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.orange.withOpacity(0.3), blurRadius: 5, offset: Offset(0, 3))
                  ],
                ),
                child: Icon(Icons.add, color: Colors.white, size: 28),
              ),
            ),
            // Main content: Image, Title, and Price
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 30.0,
                ),
                SizedBox(height: 8),
                Text(
                  'Snack Box',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '\$12.99',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}
