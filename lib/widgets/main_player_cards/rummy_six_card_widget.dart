import 'package:animated_widgets/animated_widgets.dart';
import 'package:card_game_serve_and_flip_animation/provider/rummy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../utils/card_sprite_utils.dart';

class RummySixCardWidget extends StatelessWidget {
  const RummySixCardWidget({
    required this.sixCardFliped,
    required this.opacityEnabled,
    required this.opacityDisabled,
    required this.sixCard,
    required this.cardNo,
  });

  final bool sixCardFliped;
  final double opacityEnabled;
  final double opacityDisabled;
  final int sixCard;
  final int cardNo;

  @override
  Widget build(BuildContext context) {
    return Consumer<RummyProvider>(builder: (context, rummyProvider, _) {
      return InkWell(
        onTap: () {
          rummyProvider.setCardUpTrue(5);
        },
        child: Draggable<int>(
          onDragStarted: () {
            rummyProvider.setDropSixCard(1);
          },
          onDraggableCanceled: (velocity, offset) {
            rummyProvider.setDropSixCard(2);
          },
          child: rummyProvider.isDropSixCard == 1
              ? SizedBox()
              : rummyProvider.isDropSixCard == 2
              ? Container(
            width: 14.0.w,
            height: 20.0.w,
            padding: EdgeInsets.only(bottom: 0.29.h, left: 2.0.h),
            child: getSpriteImage(cardNo),
          )
              : Container(
            width: 14.0.w,
            height: 20.0.w,
            padding: EdgeInsets.only(bottom: 0.29.h, left: 2.0.h),
            child: OpacityAnimatedWidget.tween(
              opacityEnabled: opacityEnabled,
              opacityDisabled: opacityDisabled,
              enabled: sixCardFliped,
              child: RotationAnimatedWidget.tween(
                enabled: sixCardFliped,
                rotationDisabled: Rotation.deg(y: 180),
                rotationEnabled: Rotation.deg(y: 0),
                child: getSpriteImage(sixCard),
              ),
            ),
          ),
          feedback: Container(
            width: 14.0.w,
            height: 20.0.w,
            padding: EdgeInsets.only(bottom: 0.29.h, left: 2.0.h),
            child: getSpriteImage(cardNo),
          ),
          data:cardNo,
        ),
      );
    });
  }
}
