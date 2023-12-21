import 'package:animated_widgets/animated_widgets.dart';
import 'package:card_game_serve_and_flip_animation/provider/rummy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../utils/card_sprite_utils.dart';

class RummyOneCardWidget extends StatelessWidget {
  const RummyOneCardWidget({
    required this.oneCardFliped,
    required this.opacityEnabled,
    required this.opacityDisabled,
    required this.oneCard,
    required this.cardNo,
  });

  final bool oneCardFliped;
  final double opacityEnabled;
  final double opacityDisabled;
  final int oneCard;
  final int cardNo;

  @override
  Widget build(BuildContext context) {
    return Consumer<RummyProvider>(builder: (context, rummyProvider, _) {
      return InkWell(
        onTap: () {
          rummyProvider.setCardUpTrue(0);
        },
        child: Draggable<int>(
          onDragStarted: () {
            rummyProvider.setDropOneCard(1);
          },
          onDraggableCanceled: (velocity, offset) {
            rummyProvider.setDropOneCard(2);
          },
          child: rummyProvider.isDropOneCard == 1
              ? SizedBox()
              : rummyProvider.isDropOneCard == 2
                  ? Container(
                      width: 14.0.w,
                      height: 20.0.w,
                      padding: EdgeInsets.only(bottom: 0.29.h, left: 2.0.h),
                      child: getSpriteImage(cardNo),
                    )
                  : Container(
                      padding: EdgeInsets.only(bottom: 0.29.h, left: 2.0.h),
                      child: OpacityAnimatedWidget.tween(
                        opacityEnabled: opacityEnabled,
                        opacityDisabled: opacityDisabled,
                        enabled: oneCardFliped,
                        child: RotationAnimatedWidget.tween(
                          enabled: oneCardFliped,
                          rotationDisabled: Rotation.deg(y: 10),
                          rotationEnabled: Rotation.deg(y: 10),
                          child: getSpriteImage(oneCard),
                        ),
                      ),
                    ),
          feedback: Container(
            width: 14.0.w,
            height: 20.0.w,
            padding: EdgeInsets.only(bottom: 0.29.h, left: 2.0.h),
            child: getSpriteImage(cardNo),
          ),
          data: cardNo,
        ),
      );
    });
  }
}
