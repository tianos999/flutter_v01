import 'package:flutter/material.dart';
import 'package:snack_cart/core/constants/constants.dart';
import 'package:snack_cart/core/utils/utils_mixin.dart';
import 'package:snack_cart/data/models/field_detail.dart';
import 'package:snack_cart/data/models/topping.dart';
import 'package:snack_cart/pages/snack_cart/snack_cart_step_03.dart';
import 'package:snack_cart/core/constants/color.dart';
import 'package:snack_cart/presentation/widgets/custom_image.dart';
import 'package:snack_cart/core/utils/data.dart';

class SnackCartStep02 extends StatefulWidget {

  final Function(int) onIndexChanged;
  const SnackCartStep02({Key? key, required this.onIndexChanged}) : super(key: key);

  @override
  State<SnackCartStep02> createState() => _SnackCartStep02State();
}

class _SnackCartStep02State extends State<SnackCartStep02> with UtilsMixin {

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
          sizedBox(height: 20),
          _title(),
          sizedBox(height: 20),
          _topicsCard(),
          sizedBox(height: 18),
          _eventDetails(),
          sizedBox(height: 18),
          _totalCard(),
          sizedBox(height: 18),
          _continueWithPayment(),
          sizedBox(height: 70),
        ],
      ),
    );
  }

  _title() {
    return const Padding(
      padding: EdgeInsets.only(left: 15),
      child: Text(
        "Resumen de la orden",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  _topicsCard() {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
        side: const BorderSide(color: Color(0xffECE6F5)),
      ),
      child: Column(
        children: [

          /// Top decoration
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(28),
            ),
            child: Column(
              children: [
                Container(
                  height: 36,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColor.primary,
                        AppColor.primary,
                        Colors.white,
                        Colors.white,
                      ],
                      stops: [0, .5, .5, 1],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      tileMode: TileMode.repeated,
                    ),
                  ),
                ),
                Container(
                  height: 6,
                  color: AppColor.orange,
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.receipt_long,
                      color: AppColor.orange
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Topics seleccionados",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColor.primary,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                Row(
                  children: const [
                    Text(
                      "☕",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Café ×1",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                    Text(
                      "S/ 8",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColor.primary,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _eventDetails() {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
        side: const BorderSide(color: AppColor.cartDropBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Detalles del evento",
              style: TextStyle(
                color: AppColor.primary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 28),

            Row(
              children: [
                Expanded(
                  child: FieldDetail(
                    label: "FECHA",
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            "06/28/2026",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(Icons.calendar_today)
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FieldDetail(
                    label: "INVITADOS",
                    child: const Text(
                      "40",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            FieldDetail(
              label: "DIRECCIÓN DEL EVENTO",
              child: const Text(
                "Av. Larco 345, Miraflores · Lima",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _totalCard() {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
        side: const BorderSide(color: AppColor.cartDropBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _priceRow("Subtotal", "S/ 8"),
            sizedBox(height: 14),
            _priceRow("Renta de carrito + empleado", "S/ 150"),
            sizedBox(height: 14),
            _priceRow("IGV (18%)", "S/ 28"),
            sizedBox(height: 18),
            const Divider(),
            sizedBox(height: 12),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary,
                    ),
                  ),
                ),
                Text(
                  "S/ 186",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  static Widget _priceRow(String title, String value) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xff6D6791),
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: AppColor.primary,
          ),
        )
      ],
    );
  }

  _continueWithPayment() {

    Widget button = ElevatedButton.icon(
      onPressed: () {
        widget.onIndexChanged(Constants.PAYMENT_FORM_PAGE);
      },
      icon: const Icon(Icons.credit_card, size: 24.0,),
      label: const Text("Continuar al pago"),
      iconAlignment: IconAlignment.end, // Positions icon to the right of text
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary, // Background color
        foregroundColor: Colors.white,    // Text and icon color
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
      ),
    );

    Widget row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns items horizontally
      children: [
        Expanded(
            child: button
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
      child: Expanded(
          child: row
      ),
    );
  }
}
