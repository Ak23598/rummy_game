import 'package:animated_widgets/animated_widgets.dart';
import 'package:card_game_serve_and_flip_animation/provider/rummy_provider.dart';
import 'package:card_game_serve_and_flip_animation/utils/Sockets.dart';
import 'package:card_game_serve_and_flip_animation/widgets/main_player_cards/rummy_eight_card_widget.dart';
import 'package:card_game_serve_and_flip_animation/widgets/main_player_cards/rummy_eleven_card_widget.dart';
import 'package:card_game_serve_and_flip_animation/widgets/main_player_cards/rummy_five_card_widget.dart';
import 'package:card_game_serve_and_flip_animation/widgets/main_player_cards/rummy_joker_card_widget.dart';
import 'package:card_game_serve_and_flip_animation/widgets/main_player_cards/rummy_nine_card_widget.dart';
import 'package:card_game_serve_and_flip_animation/widgets/main_player_cards/rummy_seven_card_widget.dart';
import 'package:card_game_serve_and_flip_animation/widgets/main_player_cards/rummy_six_card_widget.dart';
import 'package:card_game_serve_and_flip_animation/widgets/main_player_cards/rummy_ten_card_widget.dart';
import 'package:card_game_serve_and_flip_animation/widgets/main_player_cards/rummy_thirteen_card_widget.dart';
import 'package:card_game_serve_and_flip_animation/widgets/main_player_cards/rummy_twelve_card_widget.dart';
import 'package:card_game_serve_and_flip_animation/widgets/main_player_cards/rummy_two_card_widget.dart';
import 'package:card_game_serve_and_flip_animation/widgets/main_player_cards/rummy_three_card_widget.dart';
import 'package:card_game_serve_and_flip_animation/widgets/main_player_cards/rummy_four_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../utils/card_sprite_utils.dart';
import '../main_player_cards/rummy_one_card_widget.dart';

class NewPlayer3SeatWidget extends StatefulWidget {
  const NewPlayer3SeatWidget({
    required this.userProfileImage,
    // required this.oneCardServed,
    // required this.twoCardServed,
    // required this.threeCardServed,
    // required this.fourCardServed,
    // required this.fiveCardServed,
    // required this.sixCardServed,
    // required this.sevenCardServed,
    // required this.eightCardServed,
    // required this.nineCardServed,
    // required this.tenCardServed,
    // required this.elevenCardServed,
    // required this.twelveCardServed,
    // required this.thirteenCardServed,
    // required this.oneCardFliped,
    // required this.twoCardFliped,
    // required this.threeCardFliped,
    // required this.fourCardFliped,
    // required this.fiveCardFliped,
    // required this.sixCardFliped,
    // required this.sevenCardFliped,
    // required this.eightCardFliped,
    // required this.nineCardFliped,
    // required this.tenCardFliped,
    // required this.elevenCardFliped,
    // required this.twelveCardFliped,
    // required this.thirteenCardFliped,
    // required this.oneCardNo,
    // required this.twoCardNo,
    // required this.threeCardNo,
    // required this.fourCardNo,
    // required this.fiveCardNo,
    // required this.sixCardNo,
    // required this.sevenCardNo,
    // required this.eightCardNo,
    // required this.nineCardNo,
    // required this.tenCardNo,
    // required this.elevenCardNo,
    // required this.twelveCardNo,
    // required this.thirteenCardNo,
    // required this.jokerCardFliped,
    // required this.jokerCardNo,
    // required this.jokerCardServed,
    required this.Served,
    required this.Fliped,
    required this.CardNo
  });

  final String userProfileImage;
  // final bool oneCardServed;
  // final bool twoCardServed;
  // final bool threeCardServed;
  // final bool fourCardServed;
  // final bool fiveCardServed;
  // final bool sixCardServed;
  // final bool sevenCardServed;
  // final bool eightCardServed;
  // final bool nineCardServed;
  // final bool tenCardServed;
  // final bool elevenCardServed;
  // final bool twelveCardServed;
  // final bool thirteenCardServed;
  // final bool jokerCardServed;
  // final bool oneCardFliped;
  // final bool twoCardFliped;
  // final bool threeCardFliped;
  // final bool fourCardFliped;
  // final bool fiveCardFliped;
  // final bool sixCardFliped;
  // final bool sevenCardFliped;
  // final bool eightCardFliped;
  // final bool nineCardFliped;
  // final bool tenCardFliped;
  // final bool elevenCardFliped;
  // final bool twelveCardFliped;
  // final bool thirteenCardFliped;
  // final bool jokerCardFliped;
  // final int  oneCardNo;
  // final int  twoCardNo;
  // final int  threeCardNo;
  // final int  fourCardNo;
  // final int  fiveCardNo;
  // final int  sixCardNo;
  // final int  sevenCardNo;
  // final int  eightCardNo;
  // final int  nineCardNo;
  // final int  tenCardNo;
  // final int  elevenCardNo;
  // final int  twelveCardNo;
  // final int  thirteenCardNo;
  // final int  jokerCardNo;
  final List<bool> Served;
  final List<bool> Fliped;
  final List<int> CardNo;

  @override
  State<NewPlayer3SeatWidget> createState() => _NewPlayer3SeatWidgetState();
}

class _NewPlayer3SeatWidgetState extends State<NewPlayer3SeatWidget> {
  @override
  Widget build(BuildContext context) {
    // List indexData =[14.0.h,18.0.h,22.0.h,26.0.h];
    return Positioned(
      right: 0.0,
      left: 0.0,
      bottom: -(12.5.w),
      child: Consumer<RummyProvider>(
        builder: (context,rummyProvider,_){
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [

              Container(
                height: 70,
                margin: EdgeInsets.only(bottom: 10.0.h),
                child: ReorderableListView(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(0),
                  children: [
                    for(int index = 0;index < widget.CardNo.length;index++)
                      Align(
                        key: ValueKey(index),
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: rummyProvider.cardUp[index]?5:15),
                          child: SizeAnimatedWidget.tween(
                            enabled: widget.Served[index],
                            duration: const Duration(milliseconds: 200),
                            sizeEnabled: Size(10.0.w, 20.0.w),
                            sizeDisabled: Size(0, 0),
                            curve: Curves.ease,
                            child: TranslationAnimatedWidget.tween(
                              enabled: widget.Served[index],
                              delay: const Duration(milliseconds: 500),
                              translationEnabled: const Offset(0, 0),
                              translationDisabled: Offset(10.0.h, -(20.0.w)),
                              curve: Curves.ease,
                              duration: const Duration(milliseconds: 500),
                              child: InkWell(
                                onTap: () {
                                  rummyProvider.setCardUpTrue(index);
                                },
                                child: Draggable<int>(
                                  onDragStarted: () {
                                    rummyProvider.setOneAcceptCardList(1,index);
                                  },
                                  onDraggableCanceled: (velocity, offset) {
                                    rummyProvider.setOneAcceptCardList(2,index);
                                  },
                                  child: rummyProvider.isAcceptCardList[index] == 1
                                      ? SizedBox()
                                      : rummyProvider.isAcceptCardList[index] == 2
                                      ? Container(
                                    child: getSpriteImage(widget.CardNo[index]),
                                  )
                                      : Container(
                                    child: OpacityAnimatedWidget.tween(
                                      opacityEnabled: 1,
                                      opacityDisabled: 0,
                                      enabled: widget.Fliped[index],
                                      child: RotationAnimatedWidget.tween(
                                        enabled: widget.Fliped[index],
                                        rotationDisabled: Rotation.deg(y: 10),
                                        rotationEnabled: Rotation.deg(y: 10),
                                        child: getSpriteImage(widget.CardNo[index]),
                                      ),
                                    ),
                                  ),
                                  feedback: Container(
                                    height: 70,
                                    width: 40,
                                    child: getSpriteImage(widget.CardNo[index]),
                                  ),
                                  data: widget.CardNo[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                  onReorder: (oldIndex,newIndex){
                    setState(() {
                      final itemCard = widget.CardNo.removeAt(oldIndex);
                      widget.CardNo.insert(newIndex, itemCard);
                    });
                  }),
              ),
             /* Container(
                height: 70,
                margin: EdgeInsets.only(bottom: 10.0.h),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                    itemCount: CardNo.length,
                    itemBuilder: (context,index){
                  return Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: rummyProvider.cardUp[index]?5:15),
                      child: SizeAnimatedWidget.tween(
                        enabled: Served[index],
                        duration: const Duration(milliseconds: 200),
                        sizeEnabled: Size(10.0.w, 20.0.w),
                        sizeDisabled: Size(0, 0),
                        curve: Curves.ease,
                        child: TranslationAnimatedWidget.tween(
                          enabled: Served[index],
                          delay: const Duration(milliseconds: 500),
                          translationEnabled: const Offset(0, 0),
                          translationDisabled: Offset(10.0.h, -(20.0.w)),
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 500),
                          child:InkWell(
                            onTap: () {
                              rummyProvider.setCardUpTrue(index);
                            },
                            child: Draggable<int>(
                              onDragStarted: () {
                                rummyProvider.setOneAcceptCardList(1,index);
                              },
                              onDraggableCanceled: (velocity, offset) {
                                rummyProvider.setOneAcceptCardList(2,index);
                              },
                              child: rummyProvider.isAcceptCardList[index] == 1
                                  ? SizedBox()
                                  : rummyProvider.isAcceptCardList[index] == 2
                                  ? Container(
                                child: getSpriteImage(CardNo[index]),
                              )
                                  : Container(
                                child: OpacityAnimatedWidget.tween(
                                  opacityEnabled: 1,
                                  opacityDisabled: 0,
                                  enabled: oneCardFliped,
                                  child: RotationAnimatedWidget.tween(
                                    enabled: oneCardFliped,
                                    rotationDisabled: Rotation.deg(y: 10),
                                    rotationEnabled: Rotation.deg(y: 10),
                                    child: getSpriteImage(CardNo[index]),
                                  ),
                                ),
                              ),
                              feedback: Container(
                                height: 70,
                                width: 40,
                                child: getSpriteImage(CardNo[index]),
                              ),
                              data: CardNo[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),*/
              Container(
                child: Image.asset(
                  widget.userProfileImage,
                  height: 8.3.h,
                  width: 8.3.h,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
