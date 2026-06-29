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
      name: '111',
      color: Colors.cyanAccent,
      price: 25.0,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),
    Topping(
      name: '222',
      color: Colors.red,
      price: 10.3,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),
    Topping(
      name: '333',
      color: Colors.green,
      price: 14.0,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),
    Topping(
      name: '444',
      color: Colors.blue,
      price: 38.5,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),

    Topping(
      name: '555',
      color: Colors.cyanAccent,
      price: 25.0,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),
    Topping(
      name: '666',
      color: Colors.red,
      price: 10.3,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),
    Topping(
      name: '777',
      color: Colors.green,
      price: 14.0,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),
    Topping(
      name: '888',
      color: Colors.blue,
      price: 38.5,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),
    Topping(
      name: '999',
      color: Colors.green,
      price: 14.0,
      image: 'https://images.unsplash.com/photo-1723491922263-190acbde53d9?q=80&w=100&auto=format&fit=crop&ixlib=rb-4.1.0',
    ),
    Topping(
      name: 'A-111',
      color: Colors.blue,
      price: 38.5,
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(rowCount, (rowIndex) { // The 4 Rows

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(columnCount, (colIndex) { // The 3 Columns
            int itemIndex = rowIndex * columnCount + colIndex;

            print('columns-conejo: $columnCount, colIndex: $colIndex, rowIndex: $rowIndex, itemIndex: $itemIndex');
            print('---------------------------------------------');


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

    Widget child = CircleAvatar(
      backgroundColor: topping.color,
      radius: 40,
      child: Text(
        topping.name,
        style: const TextStyle(color: Colors.white),
      ),
    );

    return Draggable<Topping>(
      // Data to be transmitted upon successful drop
      data: topping,
      // Visual feedback that follows the user's finger during a drag
      feedback: feedback,
      // Alternative widget left in the original spot during an ongoing drag
      childWhenDragging: childWhenDragging,
      // The look of the widget sitting in its initial idle state
      child: child,
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

  _draggableEmpty() {

    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4.0),
        color: Colors.red,
        height: 60,
        child: Center(
          child: Text(
            'pollo',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
