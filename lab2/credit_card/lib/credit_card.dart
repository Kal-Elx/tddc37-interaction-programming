import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'credit_card_number.dart';
import 'card_info.dart';
import 'cvv.dart';
import 'card_model.dart';

class CreditCard extends StatelessWidget {
  final double width;

  CreditCard({
    @required this.width,
  });

  double relative(double fraction) => width * fraction;

  String _getBank(String number) {
    // Got most from https://stackoverflow.com/a/23231321/10094730
    if (number.startsWith(new RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      return 'mastercard';
    } else if (number.startsWith(new RegExp(r'[4]'))) {
      return 'visa';
    } else if (number.startsWith(new RegExp(r'3[47][0-9]{13}'))) {
      return 'amex';
    } else if (number.startsWith(new RegExp(
        r'65[4-9][0-9]{13}|64[4-9][0-9]{13}|6011[0-9]{12}|(622(?:12[6-9]|1[3-9][0-9]|[2-8][0-9][0-9]|9[01][0-9]|92[0-5])[0-9]{10})'))) {
      return 'discover';
    } else if (number.startsWith(new RegExp(r'9792'))) {
      return 'troy';
    } else if (number
        .startsWith(new RegExp(r'3(?:0[0-5]|[68][0-9])[0-9]{11}'))) {
      return 'dinersclub';
    } else if (number.startsWith(new RegExp(r'(?:2131|1800|35\d{3})\d{11}'))) {
      return 'jcb';
    } else if (number.startsWith(new RegExp(r'(62[0-9]{14,17})'))) {
      return 'unionpay';
    } else {
      return "visa";
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundImage = Image.asset(
      'assets/images/${(DateTime.now().hour + 1).toString()}.jpeg',
      width: width,
    );

    final bankImage = Image.asset(
      'assets/images/${_getBank(Provider.of<CardModel>(context).cardNumber)}.png',
      width: relative(0.15),
    );

    final cardFront = Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: backgroundImage,
        ),
        Positioned(
          top: relative(0.05),
          left: relative(0.05),
          child: Image.asset(
            'assets/images/chip.png',
            width: relative(0.15),
          ),
        ),
        Positioned(
          top: relative(0.05),
          right: relative(0.05),
          child: bankImage,
        ),
        Positioned(
          top: relative(0.27),
          left: relative(0.05),
          child: Consumer<CardModel>(
            builder: (_, card, __) => CreditCardNumber(
              width: relative(0.85),
              number: card.cardNumber,
              focused: card.focusCardNumber,
            ),
          ),
        ),
        Positioned(
          bottom: relative(0.05),
          left: relative(0.05),
          child: Consumer<CardModel>(
            builder: (_, card, __) => CardInfo(
              width: relative(0.7),
              height: relative(0.7),
              title: 'Card Holder',
              value: card.cardHolder,
              focused: card.focusCardHolder,
            ),
          ),
        ),
        Positioned(
          bottom: relative(0.05),
          right: relative(0.05),
          child: Consumer<CardModel>(
            builder: (_, card, __) => CardInfo(
              width: relative(0.18),
              height: relative(0.7),
              title: 'Expires',
              value: '${card.month}/${card.year}',
              focused: card.focusExpires,
            ),
          ),
        ),
      ],
    );

    final cardBack = Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Transform(
            // Mirror background.
            origin: Offset(width / 2, 0),
            transform: Matrix4.rotationY(-pi),
            child: backgroundImage,
          ),
        ),
        Positioned(
          bottom: relative(0.08),
          right: relative(0.05),
          child: bankImage,
        ),
        Positioned(
          top: relative(0.07),
          child: Container(
            color: Colors.black,
            width: relative(1),
            height: relative(0.12),
          ),
        ),
        Positioned(
          left: relative(0.03),
          top: relative(0.22),
          child: Consumer<CardModel>(
            builder: (_, card, __) => CVV(relative(0.94), card.cvv.length),
          ),
        ),
      ],
    );

    return Provider.of<CardModel>(context).focusCvv ? cardBack : cardFront;
  }
}
