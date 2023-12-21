import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/card_sprite_utils.dart';

class RummyJokerCardWidget extends StatelessWidget {
  const RummyJokerCardWidget({
    required this.jokerCardFliped,
    required this.opacityEnabled,
    required this.opacityDisabled,
    required this.jokerCard,
  });

  final bool jokerCardFliped;
  final double opacityEnabled;
  final double opacityDisabled;
  final int jokerCard;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('Inkwell 3...');
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 0.29.h, left: 2.0.h),
        child: RotationAnimatedWidget.tween(
          enabled: jokerCardFliped,
          rotationDisabled: Rotation.deg(y: 0),
          rotationEnabled: Rotation.deg(y: 180),
          child: OpacityAnimatedWidget.tween(
            opacityEnabled: opacityEnabled,
            opacityDisabled: opacityDisabled,
            enabled: jokerCardFliped,
            child: RotationAnimatedWidget.tween(
              enabled: jokerCardFliped,
              rotationDisabled: Rotation.deg(y: 0),
              rotationEnabled: Rotation.deg(y: 180),
              child: getSpriteImage(jokerCard),
            ),
          ),
        ),
      ),
    );
  }
}
