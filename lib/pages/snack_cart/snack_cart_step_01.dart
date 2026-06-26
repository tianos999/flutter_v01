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
          _title(),
          _sizedBox(),
          _snackCartDraggable(),
          _sizedBox(),
          _snackCartDragTarget(),
          _sizedBox(),
          _submitPaymentButton(),
        ],
      ),
    );
  }

  _title() {
    return const Padding(
      padding: EdgeInsets.only(left: 15),
      child: Text(
        "Arma tu carrito Snack",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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

  _submitPaymentButton() {
    final Widget button = ElevatedButton(
      child: const Text('Proceda con la orden'),
      onPressed: () {
        // This line opens the new page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SnackCartStep03()),
        );
      },
    );

    return Center(
        child: button
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

  _snackCartDraggable() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _sourceItems.map((topping) {
        return Draggable<Topping>(
          data: topping,
          // Feedback: What the user sees while dragging
          feedback: Material(
            color: Colors.transparent,
            child: CircleAvatar(
              backgroundColor: topping.color,
              radius: 30,
              child: Text(
                topping.name,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          // Child When Dragging: What remains in the row
          childWhenDragging: Opacity(
            opacity: 0.5,
            child: CircleAvatar(
              backgroundColor: topping.color,
              radius: 30,
            ),
          ),
          // Normal State
          child: CircleAvatar(
            backgroundColor: topping.color,
            radius: 40,
            child: Text(
              topping.name,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      }).toList(),
    );
  }

  _snackCartDragDrop1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatCard('Followers', '12.5k'),
        _buildStatCard('Following', '482'),
        _buildStatCard('Posts', '156'),
      ],
    );
  }

  Widget _buildStatCard(String label, String count) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(count, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
