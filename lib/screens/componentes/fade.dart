import 'package:flutter/material.dart';

class Fade extends StatefulWidget {
  int delay;
  int mili;
  bool inverte = false;
  Widget child;
  Fade(
      {Key? key,
      required this.delay,
      required this.mili,
      required this.child,
      this.inverte = false})
      : super(key: key);

  @override
  _FadeState createState() => _FadeState(delay, mili, child);
}

class _FadeState extends State<Fade> {
  bool _visible = false;
  int delay;
  int mili;
  Widget child;
  _FadeState(this.delay, this.mili, this.child);
  void fadess() async {
    await Future.delayed(Duration(milliseconds: delay));
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  void initState() {
    fadess();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity:
            widget.inverte ? (_visible ? 0.0 : 1.0) : (_visible ? 1.0 : 0.0),
        duration: Duration(milliseconds: mili),
        child: child);
  }
}
