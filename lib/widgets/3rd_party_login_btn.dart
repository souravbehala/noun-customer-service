import 'package:flutter/material.dart';

class SmallButton extends StatefulWidget {
  //SmallButton({Key? key}) : super(key: key);
  final String img;

  SmallButton(this.img);

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  var _isElevated = true;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (_) => setState(() {
        _isElevated = true;
      }),
      onPointerDown: (_) {
        setState(() => _isElevated = false);
        print('Gmail Clicked');
      },
      child: AnimatedContainer(
        duration: Duration(
          milliseconds: 250,
        ),
        height: 50,
        width: 50,
        child: Image.asset(
          widget.img,
          color: _isElevated == true ? Color(0xff00ffba) : Colors.white,
        ),
        decoration: BoxDecoration(
            color: Color(0xff1f1f1f),
            borderRadius: BorderRadius.circular(50),
            boxShadow: _isElevated == true
                ? [
                    const BoxShadow(
                      color: Color(0xff00ffba),
                      offset: Offset(2, 2),
                      blurRadius: 5, //change done
                      spreadRadius: 0.4, //change done
                    ),
                    const BoxShadow(
                      color: Colors.black,
                      offset: Offset(-2, -2), //change done
                      blurRadius: 5, //change done
                    )
                  ]
                : null),
      ),
    );
  }
}
