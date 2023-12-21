import 'package:animated_widgets/animated_widgets.dart';
import 'package:card_game_serve_and_flip_animation/provider/rummy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../utils/card_sprite_utils.dart';

class RummyTwelveCardWidget extends StatelessWidget {
  const RummyTwelveCardWidget({
    required this.twelveCardFliped,
    required this.opacityEnabled,
    required this.opacityDisabled,
    required this.twelveCard,
    required this.cardNo,
  });

  final bool twelveCardFliped;
  final double opacityEnabled;
  final double opacityDisabled;
  final int twelveCard;
  final int cardNo;

  @override
  Widget build(BuildContext context) {
    return Consumer<RummyProvider>(builder: (context, rummyProvider, _) {
      return InkWell(
        onTap: () {
          rummyProvider.setCardUpTrue(11);
        },
        child: Draggable<int>(
          onDragStarted: () {
            rummyProvider.setDropTwelveCard(1);
          },
          onDraggableCanceled: (velocity, offset) {
            rummyProvider.setDropTwelveCard(2);
          },
          child: rummyProvider.isDropTwelveCard == 1
              ? SizedBox()
              : rummyProvider.isDropTwelveCard == 2
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
              enabled: twelveCardFliped,
              child: RotationAnimatedWidget.tween(
                enabled: twelveCardFliped,
                rotationDisabled: Rotation.deg(y: 180),
                rotationEnabled: Rotation.deg(y: 0),
                child: getSpriteImage(twelveCard),
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
