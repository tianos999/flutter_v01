import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snack_cart/core/constants/constants.dart';
import 'package:snack_cart/data/models/topping.dart';
import 'package:snack_cart/core/constants/color.dart';
import 'package:snack_cart/presentation/widgets/custom_image.dart';
import 'package:snack_cart/core/utils/data.dart';
import 'package:dashed_border/dashed_border.dart';

class SnackCartStep01 extends StatefulWidget {
  const SnackCartStep01({super.key});

  @override
  State<SnackCartStep01> createState() => _SnackCartStep01State();
}

class _SnackCartStep01State extends State<SnackCartStep01> {
  final List<Topping> _acceptedItems = [];

  // Available toppings to drag
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
          _snackCartDraggable(),
          _sizedBox(10),
          _snackCartDragTarget(),
          _proceedWithOrder(),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          // Handle proceed with order action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: const Center(
          child: Text(
            'Proceed with Order',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
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
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,       // Number of columns in the grid
          crossAxisSpacing: 10.0,  // Horizontal spacing between grid items
          mainAxisSpacing: 10.0,   // Vertical spacing between grid items
          childAspectRatio: 4.1,  // Ratio of item width to item height
        ),
        itemCount: _acceptedItems.length,
        itemBuilder: (context, index) {
          //return _targetItemBuilder(context, index);
          return _targetItemBuilder1(context, index);
        },
      );
    }

    return Container(
        height: 300,
        width: 350,
        decoration: BoxDecoration(
          color: candidateData.isEmpty ? Colors.grey.shade200 : AppColor.cartDropV02,
          borderRadius: BorderRadius.circular(8),
          // border: Border.all(color: AppColor.cartDropV01),
          border: DashedBorder(
            color: AppColor.cartDropV01,     // Border color
            width: 2.0,            // Border thickness
            dashLength: 6.0,       // Dash length
            dashGap: 3.0,          // Gap length
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: _child
    );
  }

  _targetItemBuilder(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        color: _acceptedItems[index].color,
        shape: BoxShape.rectangle,
      ),
      child: Center(
        child: Text(
          _acceptedItems[index].name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _targetItemBuilder2(BuildContext context, int index) {
    return _buildSettingsGroup([
      _buildListTile(Icons.person_outline, Colors.orange, 'Profile'),
    ]);
  }

  _targetAnimatedContainer(BuildContext context, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      margin: EdgeInsets.only(right: 5, left: 0, top: 0, bottom: 0),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            spreadRadius: .5,
            blurRadius: .5,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            _acceptedItems[index].icon,
            color: _acceptedItems[index].color,
            size: 30.0,
          ),
          /*
          FaIcon(
            FontAwesomeIcons.iceCream,
            size: 25,
            color: Colors.black,
          ),
           */
        ],
      ),
    );
  }

  _targetItemBuilder1(BuildContext context, int index) {

    Widget row = Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /*
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
             */
        _targetAnimatedContainer(context, index),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                child: Text(
                  _acceptedItems[index].name,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 2, 0, 0),
                child: Text(
                  "S/ ${_acceptedItems[index].price.toStringAsFixed(2)}",
                ),
              ),
            ],
          ),
        ),
        _buildStepperButton(Icons.remove, () {
          // Handle add button press
        }),
        Container(
          margin: const EdgeInsets.only(
            left: 5.0,
            top: 0.0,
            right: 5.0,
            bottom: 0.0,
          ),
          child: const Text(
            '1',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: Colors.black26,
              letterSpacing: 0.2,
            ),
          ),
        ),
        _buildStepperButton(Icons.add, () {
          // Handle remove button press
        }),
        Container(
          margin: const EdgeInsets.only(
            left: 10.0,
            top: 0.0,
            right: 0.0,
            bottom: 0.0,
          ),
          child: Text(
            "S/ ${_acceptedItems[index].price.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
              color: Colors.black26,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ],
    );

    return Container(
      //height: 50.0,
      //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(children: [row]),
    );

    /*
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 12, 8),
        child: row
      );
     */
  }

  // Custom OutlinedButton for the +/- controls
  Widget _buildStepperButton(IconData icon, VoidCallback onPressed) {
    return SizedBox(
      width: 32,
      height: 32,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: BorderSide(color: Colors.greenAccent),
          backgroundColor: Colors.blue[50], // Sets background color
          foregroundColor: Colors.blue,     // Sets text and icon color
        ),
        child: Icon(icon, size: 18, color: Colors.deepPurple),
      ),
    );
  }

  _sizedBox(double? height) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> children) {
    /*
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'aaaaaa',
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
     */

    return Container(
      //height: 50.0,
      //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
        //padding: EdgeInsets.all(6),
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
