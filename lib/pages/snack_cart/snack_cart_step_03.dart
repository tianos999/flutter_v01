import 'package:flutter/material.dart';
import 'package:snack_cart/core/constants/color.dart';
import 'package:snack_cart/presentation/widgets/custom_textbox.dart';
import 'package:snack_cart/presentation/widgets/icon_box.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class SnackCartStep03 extends StatefulWidget {
  const SnackCartStep03({super.key});

  @override
  State<SnackCartStep03> createState() => _SnackCartStep03State();
}

class _SnackCartStep03State extends State<SnackCartStep03> {

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

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sizedBox(),
          _title(),
          _sizedBox(),
          _creditCardWidget(),
          _sizedBox(),
          _creditCardForm(),
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

  _creditCardForm1() {
    return Material( // <--- Explicitly provides Material styling
      type: MaterialType.transparency, // Optional: keeps background transparent
      child: _creditCardForm()
    );
  }

  _creditCardForm2() {

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

  _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: CustomTextBox(
            hint: "Buscar...",
            prefix: Icon(Icons.search, color: Colors.grey),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        IconBox(
          child: Icon(Icons.filter_list_rounded, color: Colors.white),
          bgColor: AppColor.secondary,
          radius: 10,
        )
      ],
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

  _title() {
    return const Padding(
      padding: EdgeInsets.only(left: 15),
      child: Text(
        "Realizar el pago",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
