import 'package:flutter/material.dart';
import 'package:snack_cart/core/constants/constants.dart';
import 'package:snack_cart/core/utils/utils_mixin.dart';
import 'package:snack_cart/data/models/employee_row.dart';
import 'package:snack_cart/data/models/info_row.dart';
import 'package:snack_cart/data/models/topping.dart';
import 'package:snack_cart/pages/snack_cart/snack_cart_step_03.dart';
import 'package:snack_cart/core/constants/color.dart';
import 'package:snack_cart/presentation/widgets/custom_image.dart';
import 'package:snack_cart/core/utils/data.dart';

class SnackCartStep04 extends StatefulWidget {

  final Function(int) onIndexChanged;
  const SnackCartStep04({Key? key, required this.onIndexChanged}) : super(key: key);

  @override
  State<SnackCartStep04> createState() => _SnackCartStep04State();
}

class _SnackCartStep04State extends State<SnackCartStep04> with UtilsMixin {

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
          _paymentConfirmed(),
          sizedBox(height: 10),
          _viewMyOrders(),
          sizedBox(height: 80),
        ],
      ),
    );
  }

  _title() {
    return const Padding(
      //padding: EdgeInsets.only(left: 15),
      padding: const EdgeInsets.only(
        left: 15.0,
        top: 0.0,
        right: 0.0,
        bottom: 0.0,
      ),
      child: Text(
        "Pago confirmado",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  _paymentConfirmed() {
    return SafeArea(
      child: Padding(
        //padding: const EdgeInsets.symmetric(horizontal: 22),
        padding: const EdgeInsets.only(
          left: 22.0,
          top: 0.0,
          right: 22.0,
          bottom: 22.0,
        ),
        child: Column(
          children: [
            _successCircle(),
            sizedBox(height: 30),
            const Text(
              "¡Pago confirmado!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            sizedBox(height: 8),
            Text(
              "Tu carrito snack está reservado 🎉",
              style: TextStyle(
                color: Colors.black54.withOpacity(.75),
                fontSize: 20,
              ),
            ),
            sizedBox(height: 35),
            _infoRow(),
            sizedBox(height: 34),
            Text(
              "Recibirás la factura por correo · pago procesado con tarjeta",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54.withOpacity(.65),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _infoRow() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 22,
      ),
      decoration: BoxDecoration(
        color: AppColor.cartDropBg.withOpacity(.10),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColor.cartDropBorder,
          //color: AppColor.cartDropV02.withOpacity(.08),
        ),
      ),
      child: Column(
        children: [
          const InfoRow(
            icon: Icons.tag,
            label: "Orden",
            value: "#CS-1043",
          ),
          sizedBox(height: 22, color: AppColor.cartDropBg.withOpacity(.10)),
          const InfoRow(
            icon: Icons.calendar_today_outlined,
            label: "Fecha del evento",
            value: "28 jun 2026",
          ),
          sizedBox(height: 22, color: AppColor.cartDropBg.withOpacity(.10)),
          const EmployeeRow(),
          sizedBox(height: 22, color: AppColor.cartDropBg.withOpacity(.10)),
          const InfoRow(
            icon: Icons.payments_outlined,
            label: "Total pagado",
            value: "S/ 186",
            bold: true,
          ),
        ],
      ),
    );
  }

  _successCircle() {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF473A87),
      ),
      child: Center(
        child: Container(
          width: 145,
          height: 145,
          decoration: const BoxDecoration(
            color: Color(0xFF1FAA47),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 65,
          ),
        ),
      ),
    );
  }

  _viewMyOrders() {

    Widget button = ElevatedButton.icon(
      onPressed: () {
        widget.onIndexChanged(Constants.MY_ORDERS_PAGE);
      },
      icon: const Icon(Icons.receipt_long, size: 24.0,),
      label: const Text("Ver mis órdenes"),
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
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
      child: Expanded(
          child: row
      ),
    );
  }

}
