import 'package:flutter/material.dart';
import 'package:snack_cart/core/constants/color.dart';
import 'package:snack_cart/core/utils/data.dart';
import 'package:snack_cart/core/utils/utils_mixin.dart';
import 'package:snack_cart/presentation/widgets/custom_image.dart';
import 'package:accordion/accordion.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> with UtilsMixin {
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
          Accordion(
            maxOpenSections: 1, // Automatically closes others when a new section opens
            headerBackgroundColor: AppColor.yellow,
            headerBackgroundColorOpened: Colors.red,
            headerBorderRadius: 5.0,
            contentBorderRadius: 5.0,
            //headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            children: [
              AccordionSection(
                isOpen: true, // Starts expanded
                //leftIcon: const Icon(Icons.info, color: Colors.white),
                header: _header1(),
                content: _content(),
              ),
              AccordionSection(
                isOpen: false,
                //leftIcon: const Icon(Icons.settings, color: Colors.white),
                header: _header1(),
                content: _content(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _header1() {
    return Container(
      padding: EdgeInsets.only(
        left: 8.0,
        top: 10.0,
        right: 0,
        bottom: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        //borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Column 1
          Container(
            margin: const EdgeInsets.only(
              left: 0,
              top: 0,
              right: 8.0,
              bottom: 0,
            ),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.star_outline, color: Colors.blue, size: 40.0),
          ),

          // Column 2
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    '#CS-921 · Antojos nocturnos',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                    )
                ),
                sizedBox(height: 8.0),
                const Text(
                    'Aniversario · 20 dic · S/ 2,100',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 13.0,
                    )
                ),
              ],
            ),
          ),

          // Column 3
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Color(0xFFE6F4EA),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Completada',
              style: TextStyle(
                color: Color(0xFF1E7E34),
                fontWeight: FontWeight.w500,
                fontSize: 11.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _header() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Leading custom design icon/avatar
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.credit_card, color: Colors.blue),
          ),
          const SizedBox(width: 16),

          // Section Titles
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Payment Methods',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Manage your saved credit cards',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color(0xFFE6F4EA),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Completada',
                    style: TextStyle(
                      color: Color(0xFF1E7E34),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _content() {
    return Column(
        children: [
          /*
          const SizedBox(height: 8),
          const Text("Carrito de postres 🍰", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const Text("Cumpleaños · 28 jun · 40 invitados · S/ 1,480", style: TextStyle(color: Colors.white70, fontSize: 14)),
          */
          // Timeline section
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _timelineStep("Orden creada y pagada", "24 jun · 19:12 · tarjeta ••4242", true, true),
                _timelineStep("Empleado asignado", "25 jun · Diego Morales · Carrito #07", true, true),
                _timelineStep("Carrito en preparación", "28 jun · 14:00 · stock cargado", true, false),
                _timelineStep("Evento y cierre de caja", "Pendiente", false, false, isLast: true),
              ],
            ),
          ),
          // Action Buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min, // Shrinks row to fit content snugly
                        children: [
                          Icon(Icons.receipt, color: Colors.blue, size: 20),
                          SizedBox(width: 8), // Adds a clean gap between text and icon
                          Text("Ver detalles", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min, // Shrinks row to fit content snugly
                        children: [
                          Icon(Icons.phone, color: Colors.blue, size: 20),
                          SizedBox(width: 8), // Adds a clean gap between text and icon
                          Text("Contactar", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  )
                ]
            ),
          )
        ]
    );
  }

  Widget _timelineStep(String title, String subtitle, bool isDone, bool showLine, {bool isLast = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(isDone ? Icons.circle : Icons.radio_button_unchecked, size: 20, color: isDone ? (title.contains("preparación") ? Colors.purple : Colors.green) : Colors.black12),
            if (!isLast) Container(width: 2, height: 30, color: Colors.black12),
          ],
        ),
        const SizedBox(width: 12),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: isDone ? (title.contains("preparación") ? Colors.purple : Colors.green) : Colors.black54, fontSize: 14, fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: Colors.black38, fontSize: 12)),
            ]
        )
      ],
    );
  }
}
