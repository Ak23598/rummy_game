import 'package:animated_widgets/animated_widgets.dart';
import 'package:card_game_serve_and_flip_animation/provider/rummy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../utils/card_sprite_utils.dart';

class RummyEightCardWidget extends StatelessWidget {
  const RummyEightCardWidget({
    required this.eightCardFliped,
    required this.opacityEnabled,
    required this.opacityDisabled,
    required this.eightCard,
    required this.cardNo,
  });

  final bool eightCardFliped;
  final double opacityEnabled;
  final double opacityDisabled;
  final int eightCard;
  final int cardNo;

  @override
  Widget build(BuildContext context) {
    return Consumer<RummyProvider>(builder: (context, rummyProvider, _) {
      return InkWell(
        onTap: () {
          rummyProvider.setCardUpTrue(7);
        },
        child: Draggable<int>(
          onDragStarted: () {
            rummyProvider.setDropEightCard(1);
          },
          onDraggableCanceled: (velocity, offset) {
            rummyProvider.setDropEightCard(2);
          },
          child: rummyProvider.isDropEightCard == 1
              ? SizedBox()
              : rummyProvider.isDropEightCard == 2
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
              enabled: eightCardFliped,
              child: RotationAnimatedWidget.tween(
                enabled: eightCardFliped,
                rotationDisabled: Rotation.deg(y: 180),
                rotationEnabled: Rotation.deg(y: 0),
                child: getSpriteImage(eightCard),
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
