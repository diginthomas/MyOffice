import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingAnimator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.fourRotatingDots(
            color:const Color(0xff6b59ff),
            size: MediaQuery.of(context).size.width / 5));
  }
}
