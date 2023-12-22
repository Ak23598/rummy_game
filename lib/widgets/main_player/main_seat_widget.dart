import 'package:animated_widgets/animated_widgets.dart';
import 'package:card_game_serve_and_flip_animation/provider/rummy_provider.dart';
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

class Player3SeatWidget extends StatelessWidget {
  const Player3SeatWidget({
    required this.userProfileImage,
    required this.oneCardServed,
    required this.twoCardServed,
    required this.threeCardServed,
    required this.fourCardServed,
    required this.fiveCardServed,
    required this.sixCardServed,
    required this.sevenCardServed,
    required this.eightCardServed,
    required this.nineCardServed,
    required this.tenCardServed,
    required this.elevenCardServed,
    required this.twelveCardServed,
    required this.thirteenCardServed,
    required this.oneCardFliped,
    required this.twoCardFliped,
    required this.threeCardFliped,
    required this.fourCardFliped,
    required this.fiveCardFliped,
    required this.sixCardFliped,
    required this.sevenCardFliped,
    required this.eightCardFliped,
    required this.nineCardFliped,
    required this.tenCardFliped,
    required this.elevenCardFliped,
    required this.twelveCardFliped,
    required this.thirteenCardFliped,
    required this.oneCardNo,
    required this.twoCardNo,
    required this.threeCardNo,
    required this.fourCardNo,
    required this.fiveCardNo,
    required this.sixCardNo,
    required this.sevenCardNo,
    required this.eightCardNo,
    required this.nineCardNo,
    required this.tenCardNo,
    // required this.elevenCardNo,
    // required this.twelveCardNo,
    // required this.thirteenCardNo,
    required this.jokerCardFliped,
    required this.jokerCardNo,
    required this.jokerCardServed
  });

  final String userProfileImage;
  final bool oneCardServed;
  final bool twoCardServed;
  final bool threeCardServed;
  final bool fourCardServed;
  final bool fiveCardServed;
  final bool sixCardServed;
  final bool sevenCardServed;
  final bool eightCardServed;
  final bool nineCardServed;
  final bool tenCardServed;
  final bool elevenCardServed;
  final bool twelveCardServed;
  final bool thirteenCardServed;
  final bool jokerCardServed;
  final bool oneCardFliped;
  final bool twoCardFliped;
  final bool threeCardFliped;
  final bool fourCardFliped;
  final bool fiveCardFliped;
  final bool sixCardFliped;
  final bool sevenCardFliped;
  final bool eightCardFliped;
  final bool nineCardFliped;
  final bool tenCardFliped;
  final bool elevenCardFliped;
  final bool twelveCardFliped;
  final bool thirteenCardFliped;
  final bool jokerCardFliped;
  final int  oneCardNo;
  final int  twoCardNo;
  final int  threeCardNo;
  final int  fourCardNo;
  final int  fiveCardNo;
  final int  sixCardNo;
  final int  sevenCardNo;
  final int  eightCardNo;
  final int  nineCardNo;
  final int  tenCardNo;
  // final int  elevenCardNo;
  // final int  twelveCardNo;
  // final int  thirteenCardNo;
  final int  jokerCardNo;

  @override
  Widget build(BuildContext context) {
    List indexData =[14.0.h,18.0.h,22.0.h,26.0.h];
    return Positioned(
      right: 0.0,
      left: 0.0,
      bottom: -(12.5.w),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Consumer<RummyProvider>(builder: (context,rummyProvider,_){

            return  Padding(
              padding: EdgeInsets.only(bottom: 9.0.h),
              child: Container(
                height: 75,
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [

                    //One card

                    rummyProvider.isSortCard?Container():Align(
                 alignment: Alignment.bottomLeft,
                 child: Container(
                   margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:14.0.h,top: rummyProvider.cardUp[0]?5:15),
                   child: SizeAnimatedWidget.tween(
                     enabled: oneCardServed,
                     duration: const Duration(milliseconds: 200),
                     sizeEnabled: Size(14.0.w, 20.0.w),
                     sizeDisabled: Size(0, 0),
                     curve: Curves.ease,
                     child: TranslationAnimatedWidget.tween(
                       enabled: oneCardServed,
                       delay: const Duration(milliseconds: 500),
                       translationEnabled: const Offset(0, 0),
                       /*translationDisabled: Offset(10.0.h, -(20.0.w)),*/
                       curve: Curves.ease,
                       duration: const Duration(milliseconds: 500),
                       child: RummyOneCardWidget(
                         oneCardFliped: oneCardFliped,
                         opacityEnabled: 1,
                         opacityDisabled: 0,
                         oneCard: oneCardNo,
                         cardNo: oneCardNo,
                       ),
                     ),
                   ),
                 ),
               ),
                    rummyProvider.isSortCard?Container():Align(
                 alignment: Alignment.bottomLeft,
                 child: Container(
                   margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:14.0.h,top: rummyProvider.cardUp[0]?5:15),
                   child: SizeAnimatedWidget.tween(
                     enabled: oneCardServed,
                     duration: const Duration(milliseconds: 200),
                     sizeEnabled: Size(14.0.w, 20.0.w),
                     sizeDisabled: Size(0, 0),
                     curve: Curves.ease,
                     child: TranslationAnimatedWidget.tween(
                       enabled: oneCardServed,
                       delay: const Duration(milliseconds: 500),
                       translationEnabled: const Offset(0, 0),
                       translationDisabled: Offset(16.0.h, -(40.0.w)),
                       curve: Curves.ease,
                       duration: const Duration(milliseconds: 500),
                       child: RummyOneCardWidget(
                         oneCardFliped: oneCardFliped,
                         opacityEnabled: 0,
                         opacityDisabled: 1,
                         oneCard: 53,
                         cardNo: oneCardNo,
                       ),
                     ),
                   ),
                 ),
               ),

                     //Two card

                    rummyProvider.isSortCard?Container():Align(
                 alignment: Alignment.bottomLeft,
                 child: Container(
                   margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:18.0.h,top: rummyProvider.cardUp[1]?5:15),
                   child: SizeAnimatedWidget.tween(
                     enabled: twoCardServed,
                     duration: const Duration(milliseconds: 200),
                     sizeEnabled: Size(14.0.w, 20.0.w),
                     sizeDisabled: Size(0, 0),
                     curve: Curves.ease,
                     child: TranslationAnimatedWidget.tween(
                       enabled: twoCardServed,
                       delay: const Duration(milliseconds: 500),
                       translationEnabled: const Offset(0, 0),
                       translationDisabled: Offset(0, -(50.0.w)),
                       curve: Curves.ease,
                       duration: const Duration(milliseconds: 500),
                       child: RummyTwoCardWidget(
                         twoCardFliped: twoCardFliped,
                         opacityEnabled: 1,
                         opacityDisabled: 0,
                         twoCard: twoCardNo,
                         cardNo: twoCardNo,
                       ),
                     ),
                   ),
                 ),
               ),
                    rummyProvider.isSortCard?Container():Align(
                 alignment: Alignment.bottomLeft,
                 child: Container(
                   margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:18.0.h,top: rummyProvider.cardUp[1]?5:15),
                   child: SizeAnimatedWidget.tween(
                     enabled: twoCardServed,
                     duration: const Duration(milliseconds: 200),
                     sizeEnabled: Size(14.0.w, 20.0.w),
                     sizeDisabled: Size(0, 0),
                     curve: Curves.ease,
                     child: TranslationAnimatedWidget.tween(
                       enabled: twoCardServed,
                       delay: const Duration(milliseconds: 500),
                       translationEnabled: const Offset(0, 0),
                       translationDisabled: Offset(12.0.h,-(18.0.h)),
                       curve: Curves.ease,
                       duration: const Duration(milliseconds: 500),
                       child: RummyTwoCardWidget(
                         twoCardFliped: twoCardFliped,
                         opacityEnabled: 0,
                         opacityDisabled: 1,
                         twoCard: 53,
                         cardNo: twoCardNo,
                       ),
                     ),
                   ),
                 ),
               ),

                    //Three Card

                    rummyProvider.isSortCard?Container():Align(
                   alignment: Alignment.bottomLeft,
                   child: Container(
                   margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:22.0.h,top: rummyProvider.cardUp[2]?5:15),
                   child: SizeAnimatedWidget.tween(
                     enabled: threeCardServed,
                     duration: const Duration(milliseconds: 200),
                     sizeEnabled: Size(14.0.w, 20.0.w),
                     sizeDisabled: Size(0, 0),
                     curve: Curves.ease,
                     child: TranslationAnimatedWidget.tween(
                       enabled: threeCardServed,
                       delay: const Duration(milliseconds: 500),
                       translationEnabled: const Offset(0, 0),
                       translationDisabled: Offset(0, -(50.0.w)),
                       curve: Curves.ease,
                       duration: const Duration(milliseconds: 200),
                       child: RummyThreeCardWidget(
                         thirdCardFliped: threeCardFliped,
                         opacityEnabled: 1,
                         opacityDisabled: 0,
                         threeCard: threeCardNo,
                         cardNo: threeCardNo,
                       ),
                     ),
                   ),
                 ),
               ),
                    rummyProvider.isSortCard?Container():Align(
                 child: Container(
                   margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:22.0.h,top: rummyProvider.cardUp[2]?5:15),
                   alignment: Alignment.bottomLeft,
                   child: SizeAnimatedWidget.tween(
                     enabled: threeCardServed,
                     duration: const Duration(milliseconds: 200),
                     sizeEnabled: Size(14.0.w, 20.0.w),
                     sizeDisabled: Size(0, 0),
                     curve: Curves.ease,
                     child: TranslationAnimatedWidget.tween(
                       enabled: threeCardServed,
                       delay: const Duration(milliseconds: 500),
                       translationEnabled: const Offset(0, 0),
                       translationDisabled: Offset(14.0.h, -(55.0.w)),
                       curve: Curves.ease,
                       duration: const Duration(milliseconds: 200),
                       child: RummyThreeCardWidget(
                         thirdCardFliped: threeCardFliped,
                         opacityEnabled: 0,
                         opacityDisabled: 1,
                         threeCard: 53,
                         cardNo: threeCardNo,
                       ),
                     ),
                   ),
                 ),
               ),

                    //Four Card

                    rummyProvider.isSortCard?Container():Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:26.0.h,top: rummyProvider.cardUp[3]?5:15),
                      child: SizeAnimatedWidget.tween(
                        enabled: fourCardServed,
                        duration: const Duration(milliseconds: 200),
                        sizeEnabled: Size(14.0.w, 20.0.w),
                        sizeDisabled: Size(0, 0),
                        curve: Curves.ease,
                        child: TranslationAnimatedWidget.tween(
                          enabled: fourCardServed,
                          delay: const Duration(milliseconds: 500),
                          translationEnabled: const Offset(0, 0),
                          translationDisabled: Offset(0, -(50.0.w)),
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 200),
                          child: RummyFourCardWidget(
                            fourCardFliped: fourCardFliped,
                            opacityEnabled: 1,
                            opacityDisabled: 0,
                            fourCard: fourCardNo,
                            cardNo: fourCardNo,
                          ),
                        ),
                      ),
                    ),
                  ),
                    rummyProvider.isSortCard?Container():Align(
                    child: Container(
                      margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:26.0.h,top: rummyProvider.cardUp[3]?5:15),
                      alignment: Alignment.bottomLeft,
                      child: SizeAnimatedWidget.tween(
                        enabled: fourCardServed,
                        duration: const Duration(milliseconds: 200),
                        sizeEnabled: Size(14.0.w, 20.0.w),
                        sizeDisabled: Size(0, 0),
                        curve: Curves.ease,
                        child: TranslationAnimatedWidget.tween(
                          enabled: fourCardServed,
                          delay: const Duration(milliseconds: 500),
                          translationEnabled: const Offset(0, 0),
                          translationDisabled: Offset(5.0.h, -(65.0.w)),
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 200),
                          child: RummyFourCardWidget(
                            fourCardFliped: fourCardFliped,
                            opacityEnabled: 0,
                            opacityDisabled: 1,
                            fourCard: 53,
                            cardNo: fourCardNo,
                          ),
                        ),
                      ),
                    ),
                  ),

                    //Five Card

                    rummyProvider.isSortCard?Container():Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:30.0.h,top: rummyProvider.cardUp[4]?5:15),
                      child: SizeAnimatedWidget.tween(
                        enabled: fiveCardServed,
                        duration: const Duration(milliseconds: 200),
                        sizeEnabled: Size(14.0.w, 20.0.w),
                        sizeDisabled: Size(0, 0),
                        curve: Curves.ease,
                        child: TranslationAnimatedWidget.tween(
                          enabled: fiveCardServed,
                          delay: const Duration(milliseconds: 500),
                          translationEnabled: const Offset(0, 0),
                          translationDisabled: Offset(0, -(50.0.w)),
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 200),
                          child: RummyFiveCardWidget(
                            fiveCardFliped: fiveCardFliped,
                            opacityEnabled: 1,
                            opacityDisabled: 0,
                            fiveCard: fiveCardNo,
                            cardNo: fiveCardNo,
                          ),
                        ),
                      ),
                    ),
                  ),
                    rummyProvider.isSortCard?Container():Align(
                    child: Container(
                      margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:30.0.h,top: rummyProvider.cardUp[4]?5:15),
                      alignment: Alignment.bottomLeft,
                      child: SizeAnimatedWidget.tween(
                        enabled: fiveCardServed,
                        duration: const Duration(milliseconds: 200),
                        sizeEnabled: Size(14.0.w, 20.0.w),
                        sizeDisabled: Size(0, 0),
                        curve: Curves.ease,
                        child: TranslationAnimatedWidget.tween(
                          enabled: fiveCardServed,
                          delay: const Duration(milliseconds: 500),
                          translationEnabled: const Offset(0, 0),
                          translationDisabled: Offset(-(5.0.h), -(55.0.w)),
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 200),
                          child: RummyFiveCardWidget(
                            fiveCardFliped: fiveCardFliped,
                            opacityEnabled: 0,
                            opacityDisabled: 1,
                            fiveCard: 53,
                            cardNo: fiveCardNo,
                          ),
                        ),
                      ),
                    ),
                  ),

                    //Six Card

                    rummyProvider.isSortCard?Container():Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:34.0.h,top: rummyProvider.cardUp[5]?5:15),
                      child: SizeAnimatedWidget.tween(
                        enabled: sixCardServed,
                        duration: const Duration(milliseconds: 200),
                        sizeEnabled: Size(14.0.w, 20.0.w),
                        sizeDisabled: Size(0, 0),
                        curve: Curves.ease,
                        child: TranslationAnimatedWidget.tween(
                          enabled: sixCardServed,
                          delay: const Duration(milliseconds: 500),
                          translationEnabled: const Offset(0, 0),
                          translationDisabled: Offset(0, -(50.0.w)),
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 200),
                          child: RummySixCardWidget(
                            sixCardFliped: sixCardFliped,
                            opacityEnabled: 1,
                            opacityDisabled: 0,
                            sixCard: sixCardNo,
                            cardNo: sixCardNo,
                          ),
                        ),
                      ),
                    ),
                  ),
                    rummyProvider.isSortCard?Container():Align(
                    child: Container(
                      margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:34.0.h,top: rummyProvider.cardUp[5]?5:15),
                      alignment: Alignment.bottomLeft,
                      child: SizeAnimatedWidget.tween(
                        enabled: sixCardServed,
                        duration: const Duration(milliseconds: 200),
                        sizeEnabled: Size(14.0.w, 20.0.w),
                        sizeDisabled: Size(0, 0),
                        curve: Curves.ease,
                        child: TranslationAnimatedWidget.tween(
                          enabled: sixCardServed,
                          delay: const Duration(milliseconds: 500),
                          translationEnabled: const Offset(0, 0),
                          translationDisabled: Offset(-(15.0.h), -(60.0.w)),
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 200),
                          child: RummySixCardWidget(
                            sixCardFliped: sixCardFliped,
                            opacityEnabled: 0,
                            opacityDisabled: 1,
                            sixCard: 53,
                            cardNo: sixCardNo,
                          ),
                        ),
                      ),
                    ),
                  ),

                    //Seven Card

                    rummyProvider.isSortCard?Container():Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:38.0.h,top: rummyProvider.cardUp[6]?5:15),
                      child: SizeAnimatedWidget.tween(
                        enabled: sevenCardServed,
                        duration: const Duration(milliseconds: 200),
                        sizeEnabled: Size(14.0.w, 20.0.w),
                        sizeDisabled: Size(0, 0),
                        curve: Curves.ease,
                        child: TranslationAnimatedWidget.tween(
                          enabled: sevenCardServed,
                          delay: const Duration(milliseconds: 500),
                          translationEnabled: const Offset(0, 0),
                          translationDisabled: Offset(0, -(50.0.w)),
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 200),
                          child: RummySevenCardWidget(
                            sevenCardFliped: sevenCardFliped,
                            opacityEnabled: 1,
                            opacityDisabled: 0,
                            sevenCard: sevenCardNo,
                            cardNo: sevenCardNo,
                          ),
                        ),
                      ),
                    ),
                  ),
                    rummyProvider.isSortCard?Container():Align(
                    child: Container(
                      margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:38.0.h,top: rummyProvider.cardUp[6]?5:15),
                      alignment: Alignment.bottomLeft,
                      child: SizeAnimatedWidget.tween(
                        enabled: sevenCardServed,
                        duration: const Duration(milliseconds: 200),
                        sizeEnabled: Size(14.0.w, 20.0.w),
                        sizeDisabled: Size(0, 0),
                        curve: Curves.ease,
                        child: TranslationAnimatedWidget.tween(
                          enabled: sevenCardServed,
                          delay: const Duration(milliseconds: 500),
                          translationEnabled: const Offset(0, 0),
                          translationDisabled: Offset(-(20.0.h), -(55.0.w)),
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 200),
                          child: RummySevenCardWidget(
                            sevenCardFliped: sevenCardFliped,
                            opacityEnabled: 0,
                            opacityDisabled: 1,
                            sevenCard: 53,
                            cardNo: sevenCardNo,
                          ),
                        ),
                      ),
                    ),
                  ),

                    //Eight Card

                    rummyProvider.isSortCard?Container():Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:42.0.h,top: rummyProvider.cardUp[7]?5:15),
                        child: SizeAnimatedWidget.tween(
                          enabled: eightCardServed,
                          duration: const Duration(milliseconds: 200),
                          sizeEnabled: Size(14.0.w, 20.0.w),
                          sizeDisabled: Size(0, 0),
                          curve: Curves.ease,
                          child: TranslationAnimatedWidget.tween(
                            enabled: eightCardServed,
                            delay: const Duration(milliseconds: 500),
                            translationEnabled: const Offset(0, 0),
                            translationDisabled: Offset(0, -(50.0.w)),
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 200),
                            child: RummyEightCardWidget(
                              eightCardFliped: eightCardFliped,
                              opacityEnabled: 1,
                              opacityDisabled: 0,
                              eightCard: eightCardNo,
                              cardNo: eightCardNo,
                            ),
                          ),
                        ),
                      ),
                    ),
                    rummyProvider.isSortCard?Container():Align(
                      child: Container(
                        margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:42.0.h,top: rummyProvider.cardUp[7]?5:15),
                        alignment: Alignment.bottomLeft,
                        child: SizeAnimatedWidget.tween(
                          enabled: eightCardServed,
                          duration: const Duration(milliseconds: 200),
                          sizeEnabled: Size(14.0.w, 20.0.w),
                          sizeDisabled: Size(0, 0),
                          curve: Curves.ease,
                          child: TranslationAnimatedWidget.tween(
                            enabled: eightCardServed,
                            delay: const Duration(milliseconds: 500),
                            translationEnabled: const Offset(0, 0),
                            translationDisabled: Offset(-(25.0.h), -(55.0.w)),
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 200),
                            child: RummyEightCardWidget(
                              eightCardFliped: eightCardFliped,
                              opacityEnabled: 0,
                              opacityDisabled: 1,
                              eightCard: 53,
                              cardNo: eightCardNo,
                            ),
                          ),
                        ),
                      ),
                    ),

                    //Nine Card

                    rummyProvider.isSortCard?Container():Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:46.0.h,top: rummyProvider.cardUp[8]?5:15),
                        child: SizeAnimatedWidget.tween(
                          enabled: nineCardServed,
                          duration: const Duration(milliseconds: 200),
                          sizeEnabled: Size(14.0.w, 20.0.w),
                          sizeDisabled: Size(0, 0),
                          curve: Curves.ease,
                          child: TranslationAnimatedWidget.tween(
                            enabled: nineCardServed,
                            delay: const Duration(milliseconds: 500),
                            translationEnabled: const Offset(0, 0),
                            translationDisabled: Offset(0, -(50.0.w)),
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 200),
                            child: RummyNineCardWidget(
                              nineCardFliped: nineCardFliped,
                              opacityEnabled: 1,
                              opacityDisabled: 0,
                              nineCard: nineCardNo,
                              cardNo: nineCardNo,
                            ),
                          ),
                        ),
                      ),
                    ),
                    rummyProvider.isSortCard?Container():Align(
                      child: Container(
                        margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:46.0.h,top: rummyProvider.cardUp[8]?5:15),
                        alignment: Alignment.bottomLeft,
                        child: SizeAnimatedWidget.tween(
                          enabled: nineCardServed,
                          duration: const Duration(milliseconds: 200),
                          sizeEnabled: Size(14.0.w, 20.0.w),
                          sizeDisabled: Size(0, 0),
                          curve: Curves.ease,
                          child: TranslationAnimatedWidget.tween(
                            enabled: nineCardServed,
                            delay: const Duration(milliseconds: 500),
                            translationEnabled: const Offset(0, 0),
                            translationDisabled: Offset(-(33.0.h), -(50.0.w)),
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 200),
                            child: RummyNineCardWidget(
                              nineCardFliped: nineCardFliped,
                              opacityEnabled: 0,
                              opacityDisabled: 1,
                              nineCard: 53,
                              cardNo: nineCardNo,
                            ),
                          ),
                        ),
                      ),
                    ),

                    //Ten Card

                    rummyProvider.isSortCard?Container():Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:50.0.h,top: rummyProvider.cardUp[9]?5:15),
                        child: SizeAnimatedWidget.tween(
                          enabled: tenCardServed,
                          duration: const Duration(milliseconds: 200),
                          sizeEnabled: Size(14.0.w, 20.0.w),
                          sizeDisabled: Size(0, 0),
                          curve: Curves.ease,
                          child: TranslationAnimatedWidget.tween(
                            enabled: tenCardServed,
                            delay: const Duration(milliseconds: 500),
                            translationEnabled: const Offset(0, 0),
                            translationDisabled: Offset(0, -(50.0.w)),
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 200),
                            child: RummyTenCardWidget(
                              tenCardFliped: tenCardFliped,
                              opacityEnabled: 1,
                              opacityDisabled: 0,
                              tenCard: tenCardNo,
                              cardNo: tenCardNo,
                            ),
                          ),
                        ),
                      ),
                    ),
                    rummyProvider.isSortCard?Container():Align(
                      child: Container(
                        margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:50.0.h,top: rummyProvider.cardUp[9]?5:15),
                        alignment: Alignment.bottomLeft,
                        child: SizeAnimatedWidget.tween(
                          enabled: tenCardServed,
                          duration: const Duration(milliseconds: 200),
                          sizeEnabled: Size(14.0.w, 20.0.w),
                          sizeDisabled: Size(0, 0),
                          curve: Curves.ease,
                          child: TranslationAnimatedWidget.tween(
                            enabled: tenCardServed,
                            delay: const Duration(milliseconds: 500),
                            translationEnabled: const Offset(0, 0),
                            translationDisabled: Offset(-(38.0.h), -(50.0.w)),
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 200),
                            child: RummyTenCardWidget(
                              tenCardFliped: tenCardFliped,
                              opacityEnabled: 0,
                              opacityDisabled: 1,
                              tenCard: 53,
                              cardNo: tenCardNo,
                            ),
                          ),
                        ),
                      ),
                    ),

                    //Eleven Card

                    // rummyProvider.isSortCard?Container():Align(
                    //   alignment: Alignment.bottomLeft,
                    //   child: Container(
                    //     margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:54.0.h,top: rummyProvider.cardUp[10]?5:15),
                    //     child: SizeAnimatedWidget.tween(
                    //       enabled: elevenCardServed,
                    //       duration: const Duration(milliseconds: 200),
                    //       sizeEnabled: Size(14.0.w, 20.0.w),
                    //       sizeDisabled: Size(0, 0),
                    //       curve: Curves.ease,
                    //       child: TranslationAnimatedWidget.tween(
                    //         enabled: elevenCardServed,
                    //         delay: const Duration(milliseconds: 500),
                    //         translationEnabled: const Offset(0, 0),
                    //         translationDisabled: Offset(0, -(50.0.w)),
                    //         curve: Curves.ease,
                    //         duration: const Duration(milliseconds: 200),
                    //         child: RummyElevenCardWidget(
                    //           elevenCardFliped: elevenCardFliped,
                    //           opacityEnabled: 1,
                    //           opacityDisabled: 0,
                    //           elevenCard: elevenCardNo,
                    //           cardNo: elevenCardNo,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // rummyProvider.isSortCard?Container():Align(
                    //   child: Container(
                    //     margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:54.0.h,top: rummyProvider.cardUp[10]?5:15),
                    //     alignment: Alignment.bottomLeft,
                    //     child: SizeAnimatedWidget.tween(
                    //       enabled: elevenCardServed,
                    //       duration: const Duration(milliseconds: 200),
                    //       sizeEnabled: Size(14.0.w, 20.0.w),
                    //       sizeDisabled: Size(0, 0),
                    //       curve: Curves.ease,
                    //       child: TranslationAnimatedWidget.tween(
                    //         enabled: elevenCardServed,
                    //         delay: const Duration(milliseconds: 500),
                    //         translationEnabled: const Offset(0, 0),
                    //         translationDisabled: Offset(-(46.0.h), -(50.0.w)),
                    //         curve: Curves.ease,
                    //         duration: const Duration(milliseconds: 200),
                    //         child: RummyElevenCardWidget(
                    //           elevenCardFliped: elevenCardFliped,
                    //           opacityEnabled: 0,
                    //           opacityDisabled: 1,
                    //           elevenCard: 53,
                    //           cardNo: elevenCardNo,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    //Twelve Card

                    // rummyProvider.isSortCard?Container():Align(
                    //   alignment: Alignment.bottomLeft,
                    //   child: Container(
                    //     margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:58.0.h,top: rummyProvider.cardUp[11]?5:15),
                    //     child: SizeAnimatedWidget.tween(
                    //       enabled: twelveCardServed,
                    //       duration: const Duration(milliseconds: 200),
                    //       sizeEnabled: Size(14.0.w, 20.0.w),
                    //       sizeDisabled: Size(0, 0),
                    //       curve: Curves.ease,
                    //       child: TranslationAnimatedWidget.tween(
                    //         enabled: twelveCardServed,
                    //         delay: const Duration(milliseconds: 500),
                    //         translationEnabled: const Offset(0, 0),
                    //         translationDisabled: Offset(0, -(50.0.w)),
                    //         curve: Curves.ease,
                    //         duration: const Duration(milliseconds: 200),
                    //         child: RummyTwelveCardWidget(
                    //           twelveCardFliped: twelveCardFliped,
                    //           opacityEnabled: 1,
                    //           opacityDisabled: 0,
                    //           twelveCard: twelveCardNo,
                    //           cardNo: twelveCardNo,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // rummyProvider.isSortCard?Container():Align(
                    //   child: Container(
                    //     margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:58.0.h,top: rummyProvider.cardUp[11]?5:15),
                    //     alignment: Alignment.bottomLeft,
                    //     child: SizeAnimatedWidget.tween(
                    //       enabled: twelveCardServed,
                    //       duration: const Duration(milliseconds: 200),
                    //       sizeEnabled: Size(14.0.w, 20.0.w),
                    //       sizeDisabled: Size(0, 0),
                    //       curve: Curves.ease,
                    //       child: TranslationAnimatedWidget.tween(
                    //         enabled: twelveCardServed,
                    //         delay: const Duration(milliseconds: 500),
                    //         translationEnabled: const Offset(0, 0),
                    //         translationDisabled: Offset(-(56.0.h), -(50.0.w)),
                    //         curve: Curves.ease,
                    //         duration: const Duration(milliseconds: 200),
                    //         child: RummyTwelveCardWidget(
                    //           twelveCardFliped: twelveCardFliped,
                    //           opacityEnabled: 0,
                    //           opacityDisabled: 1,
                    //           twelveCard: 53,
                    //           cardNo: twelveCardNo,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    //Thirteen Card

                    // rummyProvider.isSortCard?Container():Align(
                    //   alignment: Alignment.bottomLeft,
                    //   child: Container(
                    //     margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:62.0.h,top: rummyProvider.cardUp[12]?5:15),
                    //     child: SizeAnimatedWidget.tween(
                    //       enabled: thirteenCardServed,
                    //       duration: const Duration(milliseconds: 200),
                    //       sizeEnabled: Size(14.0.w, 20.0.w),
                    //       sizeDisabled: Size(0, 0),
                    //       curve: Curves.ease,
                    //       child: TranslationAnimatedWidget.tween(
                    //         enabled: thirteenCardServed,
                    //         delay: const Duration(milliseconds: 500),
                    //         translationEnabled: const Offset(0, 0),
                    //         translationDisabled: Offset(0, -(50.0.w)),
                    //         curve: Curves.ease,
                    //         duration: const Duration(milliseconds: 200),
                    //         child: RummyThirteenCardWidget(
                    //           thirteenCardFliped: thirteenCardFliped,
                    //           opacityEnabled: 1,
                    //           opacityDisabled: 0,
                    //           thirteenCard: thirteenCardNo,
                    //           cardNo: thirteenCardNo,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // rummyProvider.isSortCard?Container():Align(
                    //   child: Container(
                    //     margin: EdgeInsets.only(left: rummyProvider.isSortCard?0:62.0.h,top: rummyProvider.cardUp[12]?5:15),
                    //     alignment: Alignment.bottomLeft,
                    //     child: SizeAnimatedWidget.tween(
                    //       enabled: thirteenCardServed,
                    //       duration: const Duration(milliseconds: 200),
                    //       sizeEnabled: Size(14.0.w, 20.0.w),
                    //       sizeDisabled: Size(0, 0),
                    //       curve: Curves.ease,
                    //       child: TranslationAnimatedWidget.tween(
                    //         enabled: thirteenCardServed,
                    //         delay: const Duration(milliseconds: 500),
                    //         translationEnabled: const Offset(0, 0),
                    //         translationDisabled: Offset(-(64.0.h), -(50.0.w)),
                    //         curve: Curves.ease,
                    //         duration: const Duration(milliseconds: 200),
                    //         child: RummyThirteenCardWidget(
                    //           thirteenCardFliped: thirteenCardFliped,
                    //           opacityEnabled: 0,
                    //           opacityDisabled: 1,
                    //           thirteenCard: 53,
                    //           cardNo: thirteenCardNo,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),


                    rummyProvider.isSortCard?Container(
                      child: Stack(
                        children: [

                          //One card

                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 8.0.h,top: rummyProvider.cardUp[0]?5:15),
                              child: SizeAnimatedWidget.tween(
                                enabled: oneCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: oneCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  /*translationDisabled: Offset(10.0.h, -(20.0.w)),*/
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 500),
                                  child: RummyOneCardWidget(
                                    oneCardFliped: oneCardFliped,
                                    opacityEnabled: 1,
                                    opacityDisabled: 0,
                                    oneCard: oneCardNo,
                                    cardNo: oneCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: EdgeInsets.only(left:8.0.h,top: rummyProvider.cardUp[0]?5:15),
                              child: SizeAnimatedWidget.tween(
                                enabled: oneCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: oneCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(16.0.h, -(40.0.w)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 500),
                                  child: RummyOneCardWidget(
                                    oneCardFliped: oneCardFliped,
                                    opacityEnabled: 0,
                                    opacityDisabled: 1,
                                    oneCard: 53,
                                    cardNo: oneCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //Two card

                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 12.0.h,top: rummyProvider.cardUp[1]?5:15),
                              child: SizeAnimatedWidget.tween(
                                enabled: twoCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: twoCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(0, -(50.0.w)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 500),
                                  child: RummyTwoCardWidget(
                                    twoCardFliped: twoCardFliped,
                                    opacityEnabled: 1,
                                    opacityDisabled: 0,
                                    twoCard: twoCardNo,
                                    cardNo: twoCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 12.0.h,top: rummyProvider.cardUp[1]?5:15),
                              child: SizeAnimatedWidget.tween(
                                enabled: twoCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: twoCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(12.0.h,-(18.0.h)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 500),
                                  child: RummyTwoCardWidget(
                                    twoCardFliped: twoCardFliped,
                                    opacityEnabled: 0,
                                    opacityDisabled: 1,
                                    twoCard: 53,
                                    cardNo: twoCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //Three Card

                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 16.0.h,top: rummyProvider.cardUp[2]?5:15),
                              child: SizeAnimatedWidget.tween(
                                enabled: threeCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: threeCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(0, -(50.0.w)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 200),
                                  child: RummyThreeCardWidget(
                                    thirdCardFliped: threeCardFliped,
                                    opacityEnabled: 1,
                                    opacityDisabled: 0,
                                    threeCard: threeCardNo,
                                    cardNo: threeCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            child: Container(
                              margin: EdgeInsets.only(left: 16.0.h,top: rummyProvider.cardUp[2]?5:15),
                              alignment: Alignment.bottomLeft,
                              child: SizeAnimatedWidget.tween(
                                enabled: threeCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: threeCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(14.0.h, -(55.0.w)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 200),
                                  child: RummyThreeCardWidget(
                                    thirdCardFliped: threeCardFliped,
                                    opacityEnabled: 0,
                                    opacityDisabled: 1,
                                    threeCard: 53,
                                    cardNo: threeCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            width: 105,
                            height: 15,
                            margin: EdgeInsets.only(left: 9.5.h,top: 8.0.h),
                            color: Colors.lightGreen,
                            child: Center(child: Text("1'st Life")),
                          )
                        ],
                      ),
                    ):Container(),
                    rummyProvider.isSortCard?Container(
                      child: Stack(
                        children: [
                          //Four Card

                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 24.0.h,top: rummyProvider.cardUp[3]?5:15),
                              child: SizeAnimatedWidget.tween(
                                enabled: fourCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: fourCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(0, -(50.0.w)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 200),
                                  child: RummyFourCardWidget(
                                    fourCardFliped: fourCardFliped,
                                    opacityEnabled: 1,
                                    opacityDisabled: 0,
                                    fourCard: fourCardNo,
                                    cardNo: fourCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            child: Container(
                              margin: EdgeInsets.only(left: 24.0.h,top: rummyProvider.cardUp[3]?5:15),
                              alignment: Alignment.bottomLeft,
                              child: SizeAnimatedWidget.tween(
                                enabled: fourCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: fourCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(5.0.h, -(65.0.w)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 200),
                                  child: RummyFourCardWidget(
                                    fourCardFliped: fourCardFliped,
                                    opacityEnabled: 0,
                                    opacityDisabled: 1,
                                    fourCard: 53,
                                    cardNo: fourCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //Five Card

                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 28.0.h,top: rummyProvider.cardUp[4]?5:15),
                              child: SizeAnimatedWidget.tween(
                                enabled: fiveCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: fiveCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(0, -(50.0.w)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 200),
                                  child: RummyFiveCardWidget(
                                    fiveCardFliped: fiveCardFliped,
                                    opacityEnabled: 1,
                                    opacityDisabled: 0,
                                    fiveCard: fiveCardNo,
                                    cardNo: fiveCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            child: Container(
                              margin: EdgeInsets.only(left: 28.0.h,top: rummyProvider.cardUp[4]?5:15),
                              alignment: Alignment.bottomLeft,
                              child: SizeAnimatedWidget.tween(
                                enabled: fiveCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: fiveCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(-(5.0.h), -(55.0.w)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 200),
                                  child: RummyFiveCardWidget(
                                    fiveCardFliped: fiveCardFliped,
                                    opacityEnabled: 0,
                                    opacityDisabled: 1,
                                    fiveCard: 53,
                                    cardNo: fiveCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //Six Card

                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 32.0.h,top: rummyProvider.cardUp[5]?5:15),
                              child: SizeAnimatedWidget.tween(
                                enabled: sixCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: sixCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(0, -(50.0.w)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 200),
                                  child: RummySixCardWidget(
                                    sixCardFliped: sixCardFliped,
                                    opacityEnabled: 1,
                                    opacityDisabled: 0,
                                    sixCard: sixCardNo,
                                    cardNo: sixCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            child: Container(
                              margin: EdgeInsets.only(left: 32.0.h,top: rummyProvider.cardUp[5]?5:15),
                              alignment: Alignment.bottomLeft,
                              child: SizeAnimatedWidget.tween(
                                enabled: sixCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: sixCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(-(15.0.h), -(60.0.w)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 200),
                                  child: RummySixCardWidget(
                                    sixCardFliped: sixCardFliped,
                                    opacityEnabled: 0,
                                    opacityDisabled: 1,
                                    sixCard: 53,
                                    cardNo: sixCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //Seven Card

                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 36.0.h,top: rummyProvider.cardUp[6]?5:15),
                              child: SizeAnimatedWidget.tween(
                                enabled: sevenCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: sevenCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(0, -(50.0.w)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 200),
                                  child: RummySevenCardWidget(
                                    sevenCardFliped: sevenCardFliped,
                                    opacityEnabled: 1,
                                    opacityDisabled: 0,
                                    sevenCard: sevenCardNo,
                                    cardNo: sevenCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            child: Container(
                              margin: EdgeInsets.only(left: 36.0.h,top: rummyProvider.cardUp[6]?5:15),
                              alignment: Alignment.bottomLeft,
                              child: SizeAnimatedWidget.tween(
                                enabled: sevenCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: sevenCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(-(20.0.h), -(55.0.w)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 200),
                                  child: RummySevenCardWidget(
                                    sevenCardFliped: sevenCardFliped,
                                    opacityEnabled: 0,
                                    opacityDisabled: 1,
                                    sevenCard: 53,
                                    cardNo: sevenCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //Eight Card

                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 40.0.h,top: rummyProvider.cardUp[7]?5:15),
                              child: SizeAnimatedWidget.tween(
                                enabled: eightCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: eightCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(0, -(50.0.w)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 200),
                                  child: RummyEightCardWidget(
                                    eightCardFliped: eightCardFliped,
                                    opacityEnabled: 1,
                                    opacityDisabled: 0,
                                    eightCard: eightCardNo,
                                    cardNo: eightCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            child: Container(
                              margin: EdgeInsets.only(left: 40.0.h,top: rummyProvider.cardUp[7]?5:15),
                              alignment: Alignment.bottomLeft,
                              child: SizeAnimatedWidget.tween(
                                enabled: eightCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: eightCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(-(25.0.h), -(55.0.w)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 200),
                                  child: RummyEightCardWidget(
                                    eightCardFliped: eightCardFliped,
                                    opacityEnabled: 0,
                                    opacityDisabled: 1,
                                    eightCard: 53,
                                    cardNo: eightCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),


                          Container(
                            width: 163,
                            height: 15,
                            margin: EdgeInsets.only(left: 25.5.h,top: 8.0.h),
                            color: Colors.redAccent,
                            child: Center(child: Text("2'st Life")),
                          )
                        ],
                      ),
                    ):Container(),
                    rummyProvider.isSortCard?Container(
                      child: Stack(
                        children: [

                          //Nine Card

                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 48.0.h,top: rummyProvider.cardUp[8]?5:15),
                              child: SizeAnimatedWidget.tween(
                                enabled: nineCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: nineCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(0, -(50.0.w)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 200),
                                  child: RummyNineCardWidget(
                                    nineCardFliped: nineCardFliped,
                                    opacityEnabled: 1,
                                    opacityDisabled: 0,
                                    nineCard: nineCardNo,
                                    cardNo: nineCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            child: Container(
                              margin: EdgeInsets.only(left: 48.0.h,top: rummyProvider.cardUp[8]?5:15),
                              alignment: Alignment.bottomLeft,
                              child: SizeAnimatedWidget.tween(
                                enabled: nineCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: nineCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(-(33.0.h), -(50.0.w)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 200),
                                  child: RummyNineCardWidget(
                                    nineCardFliped: nineCardFliped,
                                    opacityEnabled: 0,
                                    opacityDisabled: 1,
                                    nineCard: 53,
                                    cardNo: nineCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //Ten Card

                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 52.0.h,top: rummyProvider.cardUp[9]?5:15),
                              child: SizeAnimatedWidget.tween(
                                enabled: tenCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: tenCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(0, -(50.0.w)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 200),
                                  child: RummyTenCardWidget(
                                    tenCardFliped: tenCardFliped,
                                    opacityEnabled: 1,
                                    opacityDisabled: 0,
                                    tenCard: tenCardNo,
                                    cardNo: tenCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            child: Container(
                              margin: EdgeInsets.only(left: 52.0.h,top: rummyProvider.cardUp[9]?5:15),
                              alignment: Alignment.bottomLeft,
                              child: SizeAnimatedWidget.tween(
                                enabled: tenCardServed,
                                duration: const Duration(milliseconds: 200),
                                sizeEnabled: Size(14.0.w, 20.0.w),
                                sizeDisabled: Size(0, 0),
                                curve: Curves.ease,
                                child: TranslationAnimatedWidget.tween(
                                  enabled: tenCardServed,
                                  delay: const Duration(milliseconds: 500),
                                  translationEnabled: const Offset(0, 0),
                                  translationDisabled: Offset(-(38.0.h), -(50.0.w)),
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 200),
                                  child: RummyTenCardWidget(
                                    tenCardFliped: tenCardFliped,
                                    opacityEnabled: 0,
                                    opacityDisabled: 1,
                                    tenCard: 53,
                                    cardNo: tenCardNo,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //Eleven Card

                          // Align(
                          //   alignment: Alignment.bottomLeft,
                          //   child: Container(
                          //     margin: EdgeInsets.only(left: 56.0.h,top: rummyProvider.cardUp[10]?5:15),
                          //     child: SizeAnimatedWidget.tween(
                          //       enabled: elevenCardServed,
                          //       duration: const Duration(milliseconds: 200),
                          //       sizeEnabled: Size(14.0.w, 20.0.w),
                          //       sizeDisabled: Size(0, 0),
                          //       curve: Curves.ease,
                          //       child: TranslationAnimatedWidget.tween(
                          //         enabled: elevenCardServed,
                          //         delay: const Duration(milliseconds: 500),
                          //         translationEnabled: const Offset(0, 0),
                          //         translationDisabled: Offset(0, -(50.0.w)),
                          //         curve: Curves.ease,
                          //         duration: const Duration(milliseconds: 200),
                          //         child: RummyElevenCardWidget(
                          //           elevenCardFliped: elevenCardFliped,
                          //           opacityEnabled: 1,
                          //           opacityDisabled: 0,
                          //           elevenCard: elevenCardNo,
                          //           cardNo: elevenCardNo,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Align(
                          //   child: Container(
                          //     margin: EdgeInsets.only(left: 56.0.h,top: rummyProvider.cardUp[10]?5:15),
                          //     alignment: Alignment.bottomLeft,
                          //     child: SizeAnimatedWidget.tween(
                          //       enabled: elevenCardServed,
                          //       duration: const Duration(milliseconds: 200),
                          //       sizeEnabled: Size(14.0.w, 20.0.w),
                          //       sizeDisabled: Size(0, 0),
                          //       curve: Curves.ease,
                          //       child: TranslationAnimatedWidget.tween(
                          //         enabled: elevenCardServed,
                          //         delay: const Duration(milliseconds: 500),
                          //         translationEnabled: const Offset(0, 0),
                          //         translationDisabled: Offset(-(46.0.h), -(50.0.w)),
                          //         curve: Curves.ease,
                          //         duration: const Duration(milliseconds: 200),
                          //         child: RummyElevenCardWidget(
                          //           elevenCardFliped: elevenCardFliped,
                          //           opacityEnabled: 0,
                          //           opacityDisabled: 1,
                          //           elevenCard: 53,
                          //           cardNo: elevenCardNo,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),



                          Container(
                            width: 105,
                            height: 15,
                            margin: EdgeInsets.only(left: 49.5.h,top: 8.0.h),
                            color: Colors.lightGreen,
                            child: Center(child: Text("3'st Life")),
                          )
                        ],
                      ),
                    ):Container(),
                    rummyProvider.isSortCard?Container(
                      child: Stack(
                        children: [

                          //Twelve Card

                          // Align(
                          //   alignment: Alignment.bottomLeft,
                          //   child: Container(
                          //     margin: EdgeInsets.only(left: 64.0.h,top: rummyProvider.cardUp[11]?5:15),
                          //     child: SizeAnimatedWidget.tween(
                          //       enabled: twelveCardServed,
                          //       duration: const Duration(milliseconds: 200),
                          //       sizeEnabled: Size(14.0.w, 20.0.w),
                          //       sizeDisabled: Size(0, 0),
                          //       curve: Curves.ease,
                          //       child: TranslationAnimatedWidget.tween(
                          //         enabled: twelveCardServed,
                          //         delay: const Duration(milliseconds: 500),
                          //         translationEnabled: const Offset(0, 0),
                          //         translationDisabled: Offset(0, -(50.0.w)),
                          //         curve: Curves.ease,
                          //         duration: const Duration(milliseconds: 200),
                          //         child: RummyTwelveCardWidget(
                          //           twelveCardFliped: twelveCardFliped,
                          //           opacityEnabled: 1,
                          //           opacityDisabled: 0,
                          //           twelveCard: twelveCardNo,
                          //           cardNo: twelveCardNo,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Align(
                          //   child: Container(
                          //     margin: EdgeInsets.only(left: 64.0.h,top: rummyProvider.cardUp[11]?5:15),
                          //     alignment: Alignment.bottomLeft,
                          //     child: SizeAnimatedWidget.tween(
                          //       enabled: twelveCardServed,
                          //       duration: const Duration(milliseconds: 200),
                          //       sizeEnabled: Size(14.0.w, 20.0.w),
                          //       sizeDisabled: Size(0, 0),
                          //       curve: Curves.ease,
                          //       child: TranslationAnimatedWidget.tween(
                          //         enabled: twelveCardServed,
                          //         delay: const Duration(milliseconds: 500),
                          //         translationEnabled: const Offset(0, 0),
                          //         translationDisabled: Offset(-(56.0.h), -(50.0.w)),
                          //         curve: Curves.ease,
                          //         duration: const Duration(milliseconds: 200),
                          //         child: RummyTwelveCardWidget(
                          //           twelveCardFliped: twelveCardFliped,
                          //           opacityEnabled: 0,
                          //           opacityDisabled: 1,
                          //           twelveCard: 53,
                          //           cardNo: twelveCardNo,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          //Thirteen Card

                          // Align(
                          //   alignment: Alignment.bottomLeft,
                          //   child: Container(
                          //     margin: EdgeInsets.only(left: 68.0.h,top: rummyProvider.cardUp[12]?5:15),
                          //     child: SizeAnimatedWidget.tween(
                          //       enabled: thirteenCardServed,
                          //       duration: const Duration(milliseconds: 200),
                          //       sizeEnabled: Size(14.0.w, 20.0.w),
                          //       sizeDisabled: Size(0, 0),
                          //       curve: Curves.ease,
                          //       child: TranslationAnimatedWidget.tween(
                          //         enabled: thirteenCardServed,
                          //         delay: const Duration(milliseconds: 500),
                          //         translationEnabled: const Offset(0, 0),
                          //         translationDisabled: Offset(0, -(50.0.w)),
                          //         curve: Curves.ease,
                          //         duration: const Duration(milliseconds: 200),
                          //         child: RummyThirteenCardWidget(
                          //           thirteenCardFliped: thirteenCardFliped,
                          //           opacityEnabled: 1,
                          //           opacityDisabled: 0,
                          //           thirteenCard: thirteenCardNo,
                          //           cardNo: thirteenCardNo,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Align(
                          //   child: Container(
                          //     margin: EdgeInsets.only(left: 68.0.h,top: rummyProvider.cardUp[12]?5:15),
                          //     alignment: Alignment.bottomLeft,
                          //     child: SizeAnimatedWidget.tween(
                          //       enabled: thirteenCardServed,
                          //       duration: const Duration(milliseconds: 200),
                          //       sizeEnabled: Size(14.0.w, 20.0.w),
                          //       sizeDisabled: Size(0, 0),
                          //       curve: Curves.ease,
                          //       child: TranslationAnimatedWidget.tween(
                          //         enabled: thirteenCardServed,
                          //         delay: const Duration(milliseconds: 500),
                          //         translationEnabled: const Offset(0, 0),
                          //         translationDisabled: Offset(-(64.0.h), -(50.0.w)),
                          //         curve: Curves.ease,
                          //         duration: const Duration(milliseconds: 200),
                          //         child: RummyThirteenCardWidget(
                          //           thirteenCardFliped: thirteenCardFliped,
                          //           opacityEnabled: 0,
                          //           opacityDisabled: 1,
                          //           thirteenCard: 53,
                          //           cardNo: thirteenCardNo,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),



                          Container(
                            width: 78,
                            height: 15,
                            margin: EdgeInsets.only(left: 65.5.h,top: 8.0.h),
                            color: Colors.redAccent,
                            child: Center(child: Text("4'st Life")),
                          )
                        ],
                      ),
                    ):Container(),

                  ],
                ),
              ),
            );
          }),
          Container(
            child: Image.asset(
              userProfileImage,
              height: 8.3.h,
              width: 8.3.h,
            ),
          ),
        ],
      ),
    );
  }
}
