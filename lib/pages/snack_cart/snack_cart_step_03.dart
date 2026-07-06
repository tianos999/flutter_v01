import 'package:flutter/material.dart';
import 'package:snack_cart/core/constants/app_color.dart';
import 'package:snack_cart/core/constants/constants.dart';
import 'package:snack_cart/core/utils/utils_mixin.dart';
import 'package:snack_cart/presentation/widgets/custom_textbox.dart';
import 'package:snack_cart/presentation/widgets/icon_box.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class SnackCartStep03 extends StatefulWidget {

  final Function(int) onIndexChanged;
  const SnackCartStep03({Key? key, required this.onIndexChanged}) : super(key: key);

  @override
  State<SnackCartStep03> createState() => _SnackCartStep03State();
}

class _SnackCartStep03State extends State<SnackCartStep03> with UtilsMixin {

  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>>? cardNumberKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>>? cvvCodeKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>>? expiryDateKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>>? cardHolderKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        tianosSliverAppBar(
            data01: 'SPONSORED CONTENT',
            data02: 'Realizar el pago',
            icon: Icons.check_circle_outline,
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
          _creditCardWidget(),
          _creditCardForm(),
          _payNow(),
          SizedBox(height: 70),
        ],
      ),
    );
  }

  _creditCardWidget() {
    return CreditCardWidget(
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      showBackView: isCvvFocused, // Handles auto-flip
      onCreditCardWidgetChange: (brand) {},
    );
  }

  _creditCardForm() {
    final CreditCardForm form = CreditCardForm(
      formKey: formKey, // Required
      cardNumber: cardNumber, // Required
      expiryDate: expiryDate, // Required
      cardHolderName: cardHolderName, // Required
      cvvCode: cvvCode, // Required
      cardNumberKey: cardNumberKey,
      cvvCodeKey: cvvCodeKey,
      expiryDateKey: expiryDateKey,
      cardHolderKey: cardHolderKey,
      onCreditCardModelChange: (CreditCardModel data) {}, // Required
      obscureCvv: true,
      obscureNumber: true,
      isHolderNameVisible: true,
      isCardNumberVisible: true,
      isExpiryDateVisible: true,
      enableCvv: true,
      cvvValidationMessage: 'Please input a valid CVV',
      dateValidationMessage: 'Please input a valid date',
      numberValidationMessage: 'Please input a valid number',
      cardNumberValidator: (String? cardNumber){},
      expiryDateValidator: (String? expiryDate){},
      cvvValidator: (String? cvv){},
      cardHolderValidator: (String? cardHolderName){},
      isCardHolderNameUpperCase: true,
      onFormComplete: () {
        // callback to execute at the end of filling card data
      },
      autovalidateMode: AutovalidateMode.always,
      disableCardNumberAutoFillHints: false,
      inputConfiguration: const InputConfiguration(
        cardNumberDecoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Number',
          hintText: 'XXXX XXXX XXXX XXXX',
        ),
        expiryDateDecoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Expired Date',
          hintText: 'XX/XX',
        ),
        cvvCodeDecoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'CVV',
          hintText: 'XXX',
        ),
        cardHolderDecoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Card Holder',
        ),
        cardNumberTextStyle: TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
        cardHolderTextStyle: TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
        expiryDateTextStyle: TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
        cvvCodeTextStyle: TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
      ),
    );

    return form;
  }

  _payNow() {

    Widget button = ElevatedButton.icon(
      onPressed: () {
        widget.onIndexChanged(Constants.PAYMENT_CONFIRMED_PAGE);
      },
      icon: const Icon(Icons.check_circle_outline, size: 24.0,),
      label: const Text("Ver mis órdenes"),
      iconAlignment: IconAlignment.end, // Positions icon to the right of text
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryMagenta, // Background color
        foregroundColor: Colors.white,    // Text and icon color
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 12),
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

}
