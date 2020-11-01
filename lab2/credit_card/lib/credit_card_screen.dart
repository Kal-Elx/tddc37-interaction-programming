import 'package:flutter/material.dart';

import 'credit_card.dart';
import 'credit_card_form.dart';

class CreditCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cardWidth = width * 0.95;
    final cardHeight = cardWidth * (435.0 / 675.0);

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: cardHeight / 2,
                ),
                Expanded(
                  child: Card(
                    child: CreditCardForm(cardHeight / 2),
                  ),
                ),
              ],
            ),
            Positioned(
              child: Align(
                alignment: FractionalOffset.topCenter,
                child: CreditCard(
                  width: width * 0.95,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
