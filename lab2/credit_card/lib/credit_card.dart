import 'dart:math';

import 'package:flutter/material.dart';

import 'credit_card_number.dart';
import 'card_info.dart';
import 'cvv.dart';

class CreditCard extends StatefulWidget {
  final double width;
  final int background;
  final String bank;

  CreditCard(
      {@required this.width,
      @required this.background,
      @required this.bank,
      Key key})
      : super(key: key);

  @override
  CreditCardState createState() => CreditCardState();
}

class CreditCardState extends State<CreditCard>
    with SingleTickerProviderStateMixin {
  bool _showFront = true;
  AnimationController controller;

  void flip() async {
    await controller.forward();
    setState(() => _showFront = !_showFront);
    await controller.reverse();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 300), value: 0);
  }

  double relative(double fraction) => widget.width * fraction;

  @override
  Widget build(BuildContext context) {
    final background = Image.asset(
      'assets/images/${widget.background.toString()}.jpeg',
      width: widget.width,
    );

    final bankImage = Image.asset(
      'assets/images/${widget.bank}.png',
      width: relative(0.15),
    );

    final cardFront = Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: background,
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
          child: CreditCardNumber(relative(0.85)),
        ),
        Positioned(
          bottom: relative(0.05),
          left: relative(0.05),
          child: CardInfo(
            width: relative(0.7),
            height: relative(0.7),
            title: 'Card Holder',
            value: 'FULL NAME',
          ),
        ),
        Positioned(
          bottom: relative(0.05),
          right: relative(0.05),
          child: CardInfo(
            width: relative(0.18),
            height: relative(0.7),
            title: 'Expires',
            value: 'MM/YY',
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
            origin: Offset(widget.width / 2, 0),
            transform: Matrix4.rotationY(-pi),
            child: background,
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
          child: CVV(relative(0.94)),
        ),
      ],
    );

    return AnimatedBuilder(
      animation: controller,
      builder: (ctx, child) {
        return Transform(
          origin: Offset(widget.width / 2, 0),
          transform: Matrix4.rotationY((controller.value) * pi / 2),
          child: _showFront ? cardFront : cardBack,
        );
      },
    );
  }
}
