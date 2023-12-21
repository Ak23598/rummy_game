import 'package:animated_widgets/animated_widgets.dart';
import 'package:card_game_serve_and_flip_animation/provider/rummy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../utils/card_sprite_utils.dart';

class RummySevenCardWidget extends StatelessWidget {
  const RummySevenCardWidget({
    required this.sevenCardFliped,
    required this.opacityEnabled,
    required this.opacityDisabled,
    required this.sevenCard,
    required this.cardNo,
  });

  final bool sevenCardFliped;
  final double opacityEnabled;
  final double opacityDisabled;
  final int sevenCard;
  final int cardNo;

  @override
  Widget build(BuildContext context) {
    return Consumer<RummyProvider>(builder: (context, rummyProvider, _) {
      return InkWell(
        onTap: () {
          rummyProvider.setCardUpTrue(6);
        },
        child: Draggable<int>(
          onDragStarted: () {
            rummyProvider.setDropSevenCard(1);
          },
          onDraggableCanceled: (velocity, offset) {
            rummyProvider.setDropSevenCard(2);
          },
          child: rummyProvider.isDropSevenCard == 1
              ? SizedBox()
              : rummyProvider.isDropSevenCard == 2
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
              enabled: sevenCardFliped,
              child: RotationAnimatedWidget.tween(
                enabled: sevenCardFliped,
                rotationDisabled: Rotation.deg(y: 180),
                rotationEnabled: Rotation.deg(y: 0),
                child: getSpriteImage(sevenCard),
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
