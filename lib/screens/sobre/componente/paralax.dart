import 'package:flutter/material.dart';
import 'package:parallax_image/parallax_image.dart';

class ParalaImagem extends StatelessWidget {
  ScrollController controller;
  String img;
  double alt;

  ParalaImagem({
    Key? key,
    required this.controller,
    required this.img,
    required this.alt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: alt,
      width: MediaQuery.of(context).size.width,
      child: Expanded(
        child: ParallaxImage(
          image: new AssetImage(img),
          // Extent of this widget in scroll direction.
          // In this case it is vertical scroll so extent defines
          // the height of this widget.
          // The image is scaled with BoxFit.fitWidth which makes it
          // occupy full width of this widget.
          // After image is scaled it should normally have height greater
          // than this value to allow for parallax effect to be
          // visible.
          extent: alt,
          // Optionally specify child widget.

          // Optinally specify scroll controller.
          controller: controller,
        ),
      ),
    );
  }
}
