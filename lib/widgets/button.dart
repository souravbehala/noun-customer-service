import 'dart:async';

import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  // const Button({Key? key}) : super(key: key);
  final String text;
  final Function onPressed;

  Button(this.text, this.onPressed);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  var _isElevated = true;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (_) => setState(() => _isElevated = true),
      onPointerDown: (_) {
        setState(() {
          _isElevated = false;

          //_isElevated = false;
        });
        widget.onPressed();
        // Timer(const Duration(milliseconds: 10000), widget.onPressed());
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        width: MediaQuery.of(context).size.width * 0.55,
        height: MediaQuery.of(context).size.height * 0.045,
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: const Color(0xff1f1f1f),
            borderRadius: BorderRadius.circular(28),
            boxShadow: _isElevated == true
                ? [
                    const BoxShadow(
                      color: Color(0xff00ffba),
                      offset: Offset(2, 2),
                      blurRadius: 3, //change done
                      spreadRadius: 0.3, //change done
                    ),
                    const BoxShadow(
                      color: Colors.black,
                      offset: Offset(-2, -2), //change done
                      blurRadius: 3, //change done
                    )
                  ]
                : null),
      ),
    );
  }
}
