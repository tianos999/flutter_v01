import 'package:flutter/material.dart';
import 'package:snack_cart/core/constants/constants.dart';
import 'package:snack_cart/core/utils/utils_mixin.dart';
import 'package:snack_cart/data/models/field_detail.dart';
import 'package:snack_cart/data/models/topping.dart';
import 'package:snack_cart/pages/snack_cart/snack_cart_step_03.dart';
import 'package:snack_cart/core/constants/app_color.dart';
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
        tianosSliverAppBar(
            data01: 'SPONSORED CONTENT',
            data02: 'Resumen de la orden',
            icon: Icons.credit_card,
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
          // _topicsCard(),
          _eventDetails(),
          SizedBox(height: 18),
          _totalCard(),
          SizedBox(height: 18),
          _continueWithPayment(),
          SizedBox(height: 70),
        ],
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
                        AppColor.primaryMagenta,
                        AppColor.primaryMagenta,
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
                    SizedBox(width: 10),
                    const Text(
                      "Topics seleccionados",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColor.primaryMagenta,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  children: [
                    const Text(
                      "☕",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        "Café ×1",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColor.primaryMagenta,
                        ),
                      ),
                    ),
                    const Text(
                      "S/ 8",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColor.primaryMagenta,
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
      margin: EdgeInsets.only(
        left: 10.0,
        top: 0.0,
        right: 10.0,
        bottom: 0.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: AppColor.secondaryCodGray),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Detalles del evento",
              style: TextStyle(
                color: AppColor.primaryMagenta,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 28),
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
                SizedBox(width: 16),
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
            SizedBox(height: 20),
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
      margin: EdgeInsets.only(
        left: 10.0,
        top: 0.0,
        right: 10.0,
        bottom: 0.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: AppColor.secondaryCodGray),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _priceRow("Subtotal", "S/ 8"),
            SizedBox(height: 14),
            _priceRow("Renta de carrito + empleado", "S/ 150"),
            SizedBox(height: 14),
            _priceRow("IGV (18%)", "S/ 28"),
            SizedBox(height: 18),
            const Divider(),
            SizedBox(height: 12),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryMagenta,
                    ),
                  ),
                ),
                Text(
                  "S/ 186",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryMagenta,
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
            color: AppColor.primaryMagenta,
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
        backgroundColor: AppColor.primaryMagenta, // Background color
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
