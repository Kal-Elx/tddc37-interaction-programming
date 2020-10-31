import 'package:flutter/material.dart';

import 'credit_card.dart';

class CreditCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dimensions = MediaQuery.of(context).size;
    final GlobalKey<CreditCardState> _creditCardStateState =
        GlobalKey<CreditCardState>();

    final creditCard = CreditCard(
      width: dimensions.width * 0.95,
      background: 6,
      bank: 'mastercard',
      key: _creditCardStateState,
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Card(
                  child: Container(
                    height: dimensions.height * 0.75,
                    width: double.infinity,
                    child: Center(
                      child: RaisedButton(
                        child: Text("flip me"),
                        onPressed: () {
                          _creditCardStateState.currentState.flip();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: FractionalOffset.topCenter,
                child: creditCard,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
