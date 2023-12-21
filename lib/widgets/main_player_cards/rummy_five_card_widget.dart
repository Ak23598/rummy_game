import 'package:animated_widgets/animated_widgets.dart';
import 'package:card_game_serve_and_flip_animation/provider/rummy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../utils/card_sprite_utils.dart';

class RummyFiveCardWidget extends StatelessWidget {
  const RummyFiveCardWidget({
    required this.fiveCardFliped,
    required this.opacityEnabled,
    required this.opacityDisabled,
    required this.fiveCard,
    required this.cardNo,
  });

  final bool fiveCardFliped;
  final double opacityEnabled;
  final double opacityDisabled;
  final int fiveCard;
  final int cardNo;

  @override
  Widget build(BuildContext context) {
    return Consumer<RummyProvider>(builder: (context, rummyProvider, _) {
      return InkWell(
        onTap: () {
          rummyProvider.setCardUpTrue(4);
        },
        child: Draggable<int>(
          onDragStarted: () {
            rummyProvider.setDropFiveCard(1);
          },
          onDraggableCanceled: (velocity, offset) {
            rummyProvider.setDropFiveCard(2);
          },
          child: rummyProvider.isDropFiveCard == 1
              ? Container(


          )
              : rummyProvider.isDropFiveCard == 2
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
              enabled: fiveCardFliped,
              child: RotationAnimatedWidget.tween(
                enabled: fiveCardFliped,
                rotationDisabled: Rotation.deg(y: 180),
                rotationEnabled: Rotation.deg(y: 0),
                child: getSpriteImage(fiveCard),
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
