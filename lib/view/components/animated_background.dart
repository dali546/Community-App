import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(
          Duration(seconds: 3),
          ColorTween(
            begin: Colors.orange.shade600,
            end: Colors.lightBlue.shade900,
          )),
      Track("color2").add(
          Duration(seconds: 3),
          ColorTween(
            begin: Colors.purple.shade500,
            end: Colors.blue.shade600,
          )),
    ]);

    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        return Container(
          decoration: BoxDecoration(
            gradient: SweepGradient(
              center: Alignment.centerRight,
              colors: [animation["color1"], animation["color2"]],
            ),
          ),
        );
      },
    );
  }
}
