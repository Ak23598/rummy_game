import 'package:animated_widgets/animated_widgets.dart';
import 'package:card_game_serve_and_flip_animation/provider/rummy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../utils/card_sprite_utils.dart';

class RummyFourCardWidget extends StatelessWidget {
  const RummyFourCardWidget({
    required this.fourCardFliped,
    required this.opacityEnabled,
    required this.opacityDisabled,
    required this.fourCard,
    required this.cardNo,
  });

  final bool fourCardFliped;
  final double opacityEnabled;
  final double opacityDisabled;
  final int fourCard;
  final int cardNo;

  @override
  Widget build(BuildContext context) {
    return Consumer<RummyProvider>(builder: (context, rummyProvider, _) {
      return InkWell(
        onTap: () {
          rummyProvider.setCardUpTrue(3);
        },
        child: Draggable<int>(
          onDragStarted: () {
            rummyProvider.setDropFourCard(1);
          },
          onDraggableCanceled: (velocity, offset) {
            rummyProvider.setDropFourCard(2);
          },
          child: rummyProvider.isDropFourCard == 1
              ? SizedBox()
              : rummyProvider.isDropFourCard == 2
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
              enabled: fourCardFliped,
              child: RotationAnimatedWidget.tween(
                enabled: fourCardFliped,
                rotationDisabled: Rotation.deg(y: 180),
                rotationEnabled: Rotation.deg(y: 0),
                child: getSpriteImage(fourCard),
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
