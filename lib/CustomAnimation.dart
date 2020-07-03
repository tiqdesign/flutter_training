import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutteranimation/ConstantValues/ColorLibrary.dart';

class CustomAnimation extends StatefulWidget {
  @override
  _CustomAnimationState createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation>
    with SingleTickerProviderStateMixin {

  Animation _arrowAnimation;
  AnimationController _arrowAnimationController;

  ColorLibrary _colorLibrary = new ColorLibrary();

  @override
  void initState() {
    //animation controller for handling that animation
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    //what is that animation
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);

    super.initState();
  }

  @override
  void dispose() {
    _arrowAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              AnimatedBuilder(
                animation: _arrowAnimationController,
                builder: (context, child) => Transform.rotate(
                  angle: _arrowAnimation.value,
                  child: Icon(
                    Icons.expand_more,
                    size: 50.0,
                    color: Colors.black,
                  ),
                ),
              ),
              OutlineButton(
                color: Colors.white,
                textColor: Colors.black,
                padding: const EdgeInsets.all(12.0),
                child: Text('Start Icon Animation'),
                onPressed: () {
                  _arrowAnimationController.isCompleted
                      ? _arrowAnimationController.reverse()
                      : _arrowAnimationController.forward();
                },
                splashColor: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
