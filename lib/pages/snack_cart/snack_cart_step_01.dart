import 'package:flutter/material.dart';
import 'package:snack_cart/core/constants/constants.dart';
import 'package:snack_cart/data/models/topping.dart';
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
          _sizedBox(),
          _snackCartDragTarget(),
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
            return Container(
              height: 400,
              width: 350,
              decoration: BoxDecoration(
                color: candidateData.isEmpty ? Colors.grey.shade200 : Colors.green.shade200,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: _acceptedItems.isEmpty ? const Center(child: Text('Agregar Toppings Aqui!')) : GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: _acceptedItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: _acceptedItems[index].color,
                      shape: BoxShape.circle,
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
                },
              ),
            );
          },
        ),
      ],
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
        radius: 30,
      ),
    );

    return Draggable<Topping>(
      // Data to be transmitted upon successful drop
      data: topping,
      // Visual feedback that follows the user's finger during a drag
      feedback: feedback,
      // Alternative widget left in the original spot during an ongoing drag
      childWhenDragging: SizedBox.shrink(),
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

  _draggable1(Topping topping) {

    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4.0),
        color: Colors.blueAccent,
        height: 60,
        child: Center(
          child: Text(
            'gato',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }

  _draggable2(Topping topping) {

    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4.0),
        color: Colors.blueAccent,
        height: 90.0,
        width: 90.0,
        child: Text(
          'gato',
          style: TextStyle(color: Colors.black),
        ),
      ),
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
