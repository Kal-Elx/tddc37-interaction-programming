import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'card_model.dart';
import 'text_form_element.dart';
import 'form_element_title.dart';
import 'form_element_input.dart';
import 'dropdown_form_element.dart';
import 'formatters.dart' as formatters;

class CreditCardForm extends StatelessWidget {
  final double begin;

  CreditCardForm(this.begin);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardModel>(context, listen: false);

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overScroll) {
        overScroll.disallowGlow();
        return false;
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: begin),
              TextFormElement(
                title: 'Card Number',
                focusFunc: provider.setFocusCardNumber,
                updateFunc: provider.updateCardNumber,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(16),
                  formatters.CardNumberInputFormatter(),
                ],
              ),
              TextFormElement(
                title: 'Card Holder',
                focusFunc: provider.setFocusCardHolder,
                updateFunc: provider.updateCardHolder,
                keyboardType: TextInputType.name,
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter,
                ],
              ),
              ExpiresAndCvv(provider: provider)
            ],
          ),
        ),
      ),
    );
  }
}

class ExpiresAndCvv extends StatelessWidget {
  const ExpiresAndCvv({
    Key key,
    @required this.provider,
  }) : super(key: key);

  final CardModel provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 2, child: FormElementTitle(title: 'Expires')),
            SizedBox(width: 16.0),
            Expanded(flex: 1, child: FormElementTitle(title: 'CVV')),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: DropdownFormElement(
                  hint: 'Month',
                  focusFunc: provider.setFocusExpires,
                  updateFunc: provider.updateMonth,
                  values: List.generate(
                      12, (i) => '0' * (i <= 8 ? 1 : 0) + (i + 1).toString()),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: DropdownFormElement(
                  hint: 'Year',
                  focusFunc: provider.setFocusExpires,
                  updateFunc: provider.updateYear,
                  values: List.generate(11, (i) => (i + 2020).toString()),
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              flex: 1,
              child: FormElementInput(
                focusFunc: provider.setFocusCvv,
                updateFunc: provider.updateCvv,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
