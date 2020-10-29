import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Email"),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter your email',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  )),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.pink,
            ),
          ),
        ),
      ],
    );
  }
}
