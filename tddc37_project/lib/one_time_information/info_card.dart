import 'package:flutter/material.dart';

import 'auto_scale_title.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final Widget resource;
  final String body;

  const InfoCard({
    this.title,
    this.resource,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Card(
        child: Column(
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: AutoScaleTitle(
                  title: title,
                  maxFontSize: 24,
                ),
              ),
            if (resource != null)
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: resource,
                  ),
                ),
              ),
            if (body != null)
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    body,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
