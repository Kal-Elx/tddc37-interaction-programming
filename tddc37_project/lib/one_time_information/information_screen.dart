import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'auto_scale_title.dart';

class InformationScreen extends StatefulWidget {
  final void Function() onClose;
  final List<Widget> information;
  final String title;
  final String dismissText;

  InformationScreen({
    @required this.onClose,
    @required this.information,
    @required this.title,
    @required this.dismissText,
  });

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                key: Key('infoScreenTitle'),
                child: Padding(
                  padding: const EdgeInsets.only(top: 36),
                  child: AutoScaleTitle(
                    title: widget.title,
                    maxFontSize: 36,
                  ),
                ),
              ),
              SizedBox(height: 64),
              Expanded(
                child: PageView(
                  key: Key('infoPageView'),
                  controller: controller,
                  children: widget.information,
                ),
              ),
              if (widget.information.length > 1)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: SmoothPageIndicator(
                    controller: controller, // PageController
                    count: widget.information.length,
                    effect: SlideEffect(activeDotColor: Colors.blue),
                  ),
                ),
              SizedBox(height: 64),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: RaisedButton(
                    key: Key('dismissButton'),
                    color: Colors.blue,
                    onPressed: widget.onClose,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        widget.dismissText,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
