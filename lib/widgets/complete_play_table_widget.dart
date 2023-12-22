import 'dart:async';

import 'package:animated_widgets/widgets/size_animated.dart';
import 'package:animated_widgets/widgets/translation_animated.dart';
import 'package:card_game_serve_and_flip_animation/provider/rummy_provider.dart';
import 'package:card_game_serve_and_flip_animation/utils/card_sprite_utils.dart';
import 'package:card_game_serve_and_flip_animation/widgets/main_player_cards/rummy_joker_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../constants/image_constants.dart';
import 'main_player/main_seat_widget.dart';

class CompletePlayTableWidget extends StatefulWidget {
  final List<bool> servedPages;
  final List<bool> jokerServedPages;
  final List<bool> jokerFlipedPages;
  final List<bool> flipedPages;
  final List<int> cardPage;

  const CompletePlayTableWidget({
    required this.jokerFlipedPages,
    required this.jokerServedPages,
    required this.servedPages,
    required this.flipedPages,
    required this.cardPage,
  });

  @override
  State<CompletePlayTableWidget> createState() => _CompletePlayTableWidgetState();
}

class _CompletePlayTableWidgetState extends State<CompletePlayTableWidget> {
  List<bool> _moveOldServedPages = [];
  List<bool> _moveOldFlipedPages = [];
  Timer? moveOldServingTimer;
  Timer? moveOldFlipingTimer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var rummyProvider = Provider.of<RummyProvider>(context,listen: false);
    rummyProvider.setCardUpFalse();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RummyProvider>(builder: (context,rummyProvider,_){
      return Positioned(
        left: 0.0,
        right: 0.0,
        top: 20.00.w,
        child: Column(
          children: [
            Container(
              width: 85.0.h,
              height: 75.0.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConst.ic3PattiTable),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 12.0.h,
                    left: 50.0.w,
                    child: Container(
                      height: 65,
                      width: 65,
                      child: getSpriteImage(53),
                    ),
                  ),
                  Positioned(
                    top: 12.0.h,
                    left: 50.50.w,
                    child: Container(
                      height: 65,
                      width: 65,
                      child: getSpriteImage(53),
                    ),
                  ),
                  Positioned(
                    top: 12.0.h,
                    left: 51.0.w,
                    child: Container(
                      height: 65,
                      width: 65,
                      child: getSpriteImage(53),
                    ),
                  ),
                  Positioned(
                    top: 12.0.h,
                    left: 51.50.w,
                    child: Container(
                      height: 65,
                      width: 65,
                      child: getSpriteImage(53),
                    ),
                  ),
                  Positioned(
                    top: 12.0.h,
                    left: 52.0.w,
                    child: Container(
                      height: 65,
                      width: 65,
                      child: getSpriteImage(53),
                    ),
                  ),

                  //Joker Card

                  // Positioned(
                  //   top: 12.0.h,
                  //   left: 30.0.w,
                  //   child: Container(
                  //     child: SizeAnimatedWidget.tween(
                  //       enabled: widget.jokerServedPages[0],
                  //       duration: const Duration(milliseconds: 200),
                  //       sizeEnabled: Size(15.5.w, 20.0.w),
                  //       sizeDisabled: Size(0, 0),
                  //       curve: Curves.ease,
                  //       child: TranslationAnimatedWidget.tween(
                  //         enabled: widget.jokerServedPages[0],
                  //         delay: const Duration(milliseconds: 500),
                  //         translationEnabled: const Offset(0, 0),
                  //         translationDisabled: Offset(0, -(50.0.w)),
                  //         curve: Curves.ease,
                  //         duration: const Duration(milliseconds: 200),
                  //         child: RummyJokerCardWidget(
                  //           jokerCardFliped: widget.jokerFlipedPages[0],
                  //           opacityEnabled: 1,
                  //           opacityDisabled: 0,
                  //           jokerCard: widget.cardPage[12],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   top: 12.0.h,
                  //   left: 30.0.w,
                  //   child: Container(
                  //     alignment: Alignment.bottomLeft,
                  //     child: SizeAnimatedWidget.tween(
                  //       enabled: widget.jokerServedPages[0],
                  //       duration: const Duration(milliseconds: 200),
                  //       sizeEnabled: Size(15.5.w, 20.0.w),
                  //       sizeDisabled: Size(0, 0),
                  //       curve: Curves.ease,
                  //       child: TranslationAnimatedWidget.tween(
                  //         enabled: widget.jokerServedPages[0],
                  //         delay: const Duration(milliseconds: 500),
                  //         translationEnabled: const Offset(0, 0),
                  //         translationDisabled: Offset(18.0.h, 0.0),
                  //         curve: Curves.ease,
                  //         duration: const Duration(milliseconds: 200),
                  //         child: RummyJokerCardWidget(
                  //           jokerCardFliped: widget.jokerFlipedPages[0],
                  //           opacityEnabled: 0,
                  //           opacityDisabled: 1,
                  //           jokerCard: 53,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  Positioned(
                    top: 12.0.h,
                    left: 70.0.w,
                    child: DragTarget(
                      builder: (context, candidateData, rejectedData){
                      return Stack(
                          children: [

                             ...rummyProvider.cardListIndex.map((e) => InkWell(
                               onTap: (){
                                 int moveOldServeCounter = 0;
                                 int moveOldFlipCounter = 0;

                                 moveOldServingTimer = Timer.periodic(Duration(milliseconds: 500), (moveOldServeTimer) {
                                   if (!mounted) return;
                                   setState(() {
                                     _moveOldServedPages[moveOldServeCounter] = true;
                                   });
                                   moveOldServeCounter++;
                                   if (moveOldServeCounter == 1) {
                                     moveOldServeTimer.cancel();
                                     moveOldServingTimer?.cancel();
                                     Future.delayed(Duration(seconds: 1),(){
                                       moveOldFlipingTimer = Timer.periodic(Duration(milliseconds: 200), (moveOldFlipTimer) {
                                         if (!mounted) return;
                                         setState(() {
                                           _moveOldFlipedPages[moveOldFlipCounter] = true;
                                         });
                                         moveOldFlipCounter++;
                                         if (moveOldFlipCounter == 1) {
                                           moveOldFlipTimer.cancel();
                                           moveOldFlipingTimer?.cancel();
                                         }
                                       });
                                     });

                                   }
                                 });
                               },
                               child: Container(
                                 height: 68,
                                 width: 55,
                                 child: getSpriteImage(e),),
                             ),),
                            if(rummyProvider.cardListIndex.isEmpty)
                              Container(
                                height: 68,
                                width: 55,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                              )
                          ],
                      );
                    },
                      onAccept: (data){
                      rummyProvider.setCardListIndex(int.parse(data.toString()));
                      for(int i = 0; i < rummyProvider.cardList.length; i++){
                        Map<String,dynamic> singleData = rummyProvider.cardList[i];
                        if((i+1) == int.parse(data.toString())){
                          rummyProvider.dropCard(singleData);
                        }
                      }
                    },
                    ),
                  ),
                  Positioned(
                      top: 12.0.h,
                      left: 90.0.w,
                      child: Container(
                        height: 68,
                        width: 55,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(child: Text('Finish',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)),
                      )),

                  Positioned(
                      top: 13.5.h,
                      left: 110.0.w,
                      child: InkWell(
                        onTap: (){
                          // rummyProvider.setSortAllCard();

                        },
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          color: Colors.black.withOpacity(0.5),
                          elevation: 10,
                          child: Container(
                            height: 30,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(child: Text('Sort',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)),
                          ),
                        ),
                      )),

                  Player3SeatWidget(
                    userProfileImage: ImageConst.icProfilePic3,
                    oneCardServed: widget.servedPages[0],
                    twoCardServed: widget.servedPages[1],
                    threeCardServed: widget.servedPages[2],
                    fourCardServed: widget.servedPages[3],
                    fiveCardServed: widget.servedPages[4],
                    sixCardServed: widget.servedPages[5],
                    sevenCardServed: widget.servedPages[6],
                    eightCardServed: widget.servedPages[7],
                    nineCardServed: widget.servedPages[8],
                    tenCardServed: widget.servedPages[9],
                    // elevenCardServed: widget.servedPages[10],
                    // twelveCardServed: widget.servedPages[11],
                    // thirteenCardServed: widget.servedPages[12],
                    oneCardFliped: widget.flipedPages[9],
                    twoCardFliped: widget.flipedPages[8],
                    threeCardFliped: widget.flipedPages[7],
                    fourCardFliped: widget.flipedPages[6],
                    fiveCardFliped: widget.flipedPages[5],
                    sixCardFliped: widget.flipedPages[4],
                    sevenCardFliped: widget.flipedPages[3],
                    eightCardFliped: widget.flipedPages[2],
                    nineCardFliped: widget.flipedPages[1],
                    tenCardFliped: widget.flipedPages[0],
                    // elevenCardFliped: widget.flipedPages[2],
                    // twelveCardFliped: widget.flipedPages[1],
                    // thirteenCardFliped: widget.flipedPages[0],
                    oneCardNo: widget.cardPage[0],
                    twoCardNo: widget.cardPage[1],
                    threeCardNo: widget.cardPage[2],
                    fourCardNo: widget.cardPage[3],
                    fiveCardNo: widget.cardPage[4],
                    sixCardNo: widget.cardPage[5],
                    sevenCardNo: widget.cardPage[6],
                    eightCardNo: widget.cardPage[7],
                    nineCardNo: widget.cardPage[8],
                    tenCardNo: widget.cardPage[9],
                    // elevenCardNo: widget.cardPage[9],
                    // twelveCardNo: widget.cardPage[10],
                    // thirteenCardNo: widget.cardPage[11],
                    jokerCardFliped: widget.jokerFlipedPages[0],
                    jokerCardNo: widget.cardPage[0],
                    jokerCardServed: widget.jokerServedPages[0],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
