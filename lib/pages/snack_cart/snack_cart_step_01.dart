import 'package:flutter/material.dart';
import 'package:snack_cart/core/constants/constants.dart';
import 'package:snack_cart/core/utils/utils_mixin.dart';
import 'package:snack_cart/data/models/topping.dart';
import 'package:snack_cart/core/constants/color.dart';
import 'package:snack_cart/pages/snack_cart/cart_item_card.dart';
import 'package:snack_cart/presentation/widgets/custom_image.dart';
import 'package:snack_cart/core/utils/data.dart';
import 'package:dashed_border/dashed_border.dart';

class SnackCartStep01 extends StatefulWidget {

  final Function(int) onIndexChanged;
  const SnackCartStep01({Key? key, required this.onIndexChanged}) : super(key: key);

  @override
  State<SnackCartStep01> createState() => _SnackCartStep01State();
}

class _SnackCartStep01State extends State<SnackCartStep01> with UtilsMixin {
  final List<Topping> _acceptedItems = [];

  final List<Topping> _toppingsItems = [
    Topping(
      name: 'Brownies',
      color: Colors.blueGrey,
      price: 25.0,
      icon: Icons.search,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),
    Topping(
      name: 'Cupcakes',
      color: Colors.red,
      price: 10.3,
      icon: Icons.portrait,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),
    Topping(
      name: 'Picarones',
      color: Colors.green,
      price: 14.0,
      icon: Icons.podcasts,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),
    Topping(
      name: 'Fresas con crema',
      color: Colors.blue,
      price: 38.5,
      icon: Icons.grade_rounded,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),

    Topping(
      name: 'Helado artesanal',
      color: Colors.blueGrey,
      price: 25.0,
      icon: Icons.select_all,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),
    Topping(
      name: 'Salchipapa',
      color: Colors.red,
      price: 10.3,
      icon: Icons.bus_alert,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),
    Topping(
      name: 'Canchita',
      color: Colors.green,
      price: 14.0,
      icon: Icons.card_travel_outlined,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),

    /*
    Topping(
      name: 'Tequeños',
      color: Colors.blue,
      price: 38.5,
      icon: Icons.yard_outlined,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),
    Topping(
      name: 'Anticuchos',
      color: Colors.green,
      price: 14.0,
      icon: Icons.card_membership_sharp,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),
    Topping(
      name: 'Chicha / jugos',
      color: Colors.blue,
      price: 38.5,
      icon: Icons.fax_rounded,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),
     */
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        tianosAppBar(
          data01: 'SPONSORED CONTENT',
          data02: 'Arma tu carrito snack',
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
          _snackCartDraggable(),
          SizedBox(height: 10),
          _snackCartDragTarget(),
          _proceedWithOrder(),
          SizedBox(height: 70),
        ],
      ),
    );
  }

  _snackCartDraggable() {

    final int itemCount = _toppingsItems.length;
    final int targetColumns = Constants.MAX_COLUMN_COUNT;

    int columnCount = itemCount < targetColumns ? itemCount : targetColumns;
    int rowCount = (itemCount / columnCount).ceil();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(rowCount, (rowIndex) { // The 4 Rows

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(columnCount, (colIndex) { // The 3 Columns
            int itemIndex = rowIndex * columnCount + colIndex;

            if (itemIndex >= itemCount) {
              return _draggableEmpty();
            }

            Topping topping = _toppingsItems[itemIndex];

            return _draggable(topping);
          }),
        );
      }),
    );
  }

  _snackCartDragTarget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DragTarget<Topping>(
          onWillAcceptWithDetails: (details) => true,
          onAcceptWithDetails: (details) {
            setState(() {
              _acceptedItems.add(details.data);
            });
          },
          builder: (context, candidateData, rejectedData) {
            return _targetBuilderChild(context, candidateData, rejectedData);
          },
        ),
      ],
    );
  }

  _proceedWithOrder() {

    Widget button = ElevatedButton.icon(
      onPressed: () {
        widget.onIndexChanged(Constants.ORDER_SUMMARY_PAGE);
      },
      icon: const Icon(Icons.check_circle_outline, size: 24.0,),
      label: const Text("Proceda con la orden"),
      iconAlignment: IconAlignment.end, // Positions icon to the right of text
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary, // Background color
        foregroundColor: Colors.white,    // Text and icon color
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
      ),
    );

    Widget row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns items horizontally
      children: [
        const Text(
          'S/ 10.00',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        button,
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
      child: row,
    );
  }

  _targetBuilderChild(BuildContext context, List<dynamic> candidateData, List<dynamic> rejectedData) {

    Widget _child = Center(
      child: Text(
        "Arrastra o toca un snack",
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );

    if (!_acceptedItems.isEmpty) {
      _child = GridView.builder(
        padding: const EdgeInsets.all(4),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,       // Number of columns in the grid
          crossAxisSpacing: 0.0,  // Horizontal spacing between grid items
          mainAxisSpacing: 10.0,   // Vertical spacing between grid items
          childAspectRatio: 4.1,  // Ratio of item width to item height
        ),
        itemCount: _acceptedItems.length,
        itemBuilder: (context, index) {
          return CartItemCard(
            topping: _acceptedItems[index],
            onRemove: () {
              setState(() {
                _acceptedItems.removeAt(index);
              });
            },
          );
        },
      );
    }

    return Container(
        height: 300,
        width: 350,
        decoration: BoxDecoration(
          color: candidateData.isEmpty ? Colors.grey.shade200 : AppColor.cartDropBg,
          borderRadius: BorderRadius.circular(8),
          // border: Border.all(color: AppColor.cartDropV01),
          border: DashedBorder(
            color: AppColor.cartDropBorder,     // Border color
            width: 2.0,            // Border thickness
            dashLength: 6.0,       // Dash length
            dashGap: 3.0,          // Gap length
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: _child
    );
  }

  _draggable(Topping topping) {

    Widget feedback = Material(
      color: Colors.transparent,
      child: CircleAvatar(
        backgroundColor: topping.color,
        radius: 30,
        child: Text(
          topping.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );

    Widget childWhenDragging = Opacity(
      opacity: 0.5,
      child: CircleAvatar(
        backgroundColor: topping.color,
        //radius: 30,
        minRadius: 45.0, // Minimum diameter of 40.0
        maxRadius: 45.0, // Maximum diameter of 120.0
      ),
    );

    return Draggable<Topping>(
      // Data to be transmitted upon successful drop
      data: topping,
      // Visual feedback that follows the user's finger during a drag
      feedback: _draggableFeedback(topping),
      // Alternative widget left in the original spot during an ongoing drag
      childWhenDragging: childWhenDragging,
      // The look of the widget sitting in its initial idle state
      child: _draggableChild(topping),
    );
  }

  _draggableChild(Topping topping) {

    Widget container02 = Container(
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        // color: Colors.blue,
        borderRadius: BorderRadius.circular(9.0),
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
      child: Stack( // Stack
        clipBehavior: Clip.none,
        children: [
          // Add Button in the top right corner
          Positioned(
            top: -5,
            right: -12,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.orange.withOpacity(0.3), blurRadius: 5, offset: Offset(0, 3))
                ],
              ),
              child: Icon(Icons.add, color: Colors.white, size: 25),
            ),
          ),
          // Main content: Image, Title, and Price
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                topping.icon,
                color: topping.color,
                size: 30.0,
              ),
              SizedBox(height: 8),
              Text(
                topping.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Container(
                width: double.infinity, // Forces container to take full width
                child: Text(
                  'S/ ${topping.price.toStringAsFixed(2)}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ],
      ), // Stack
    );

    Widget container01 = Container(
      margin: const EdgeInsets.only(
      left: 0,
      top: 0,
      right: 0,
      bottom: 15.0,
    ),
      // color: Colors.red,
      height: 90.0,
      width: 90.0,
      child: container02,
    );

    return Expanded(
      child: container01,
    );
  }

  _draggableFeedback(Topping topping) {

    Widget container02 = Container(
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        // color: Colors.blue,
        borderRadius: BorderRadius.circular(9.0),
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
      child: Stack( // Stack
        clipBehavior: Clip.none,
        children: [
          // Main content: Image, Title, and Price
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                topping.icon,
                color: topping.color,
                size: 30.0,
              ),
              SizedBox(height: 8),
              Text(
                topping.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ), // Stack
    );

    Widget container01 = Container(
      margin: const EdgeInsets.only(
        left: 0,
        top: 0,
        right: 0,
        bottom: 15.0,
      ),
      // color: Colors.red,
      height: 70.0,
      width: 70.0,
      child: container02,
    );

    return Expanded(
      child: container01,
    );
  }

  _draggableEmpty() {

    return Container(
      margin: const EdgeInsets.only(
        left: 4.0,
        top: 0,
        right: 4.0,
        bottom: 12.0,
      ),
      height: 80.0,
      width: 80.0,
      decoration: BoxDecoration(
        // 1. Background Color (Move it here from the Container!)
        color: Colors.blueAccent,

        // 2. Rounded Corners (Only works if shape is BoxShape.rectangle)
        borderRadius: BorderRadius.circular(9.0),

        // 3. Border Around the Container
        border: Border.all(
          color: Colors.black26,
          width: 1,
        ),

        // 4. Drop Shadows
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(4, 4), // Moves shadow right and down
          ),
        ],

        // 5. Background Gradient (Overrides the solid color if active)
        gradient: const LinearGradient(
          colors: [Colors.white30, Colors.black45],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }

}
