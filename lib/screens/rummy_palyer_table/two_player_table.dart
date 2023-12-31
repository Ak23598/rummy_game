import 'dart:async';
import 'package:card_game_serve_and_flip_animation/constant/image_constants.dart';
import 'package:card_game_serve_and_flip_animation/provider/rummy_provider.dart';
import 'package:card_game_serve_and_flip_animation/provider/socket_provider.dart';
import 'package:card_game_serve_and_flip_animation/utils/Sockets.dart';
import 'package:card_game_serve_and_flip_animation/utils/card_sprite_utils.dart';
import 'package:card_game_serve_and_flip_animation/widgets/main_player/new_main_set_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class TwoPlayerTableWidget extends StatefulWidget {
  final List<bool> servedPages;
  final List<bool> jokerServedPages;
  final List<bool> jokerFlipedPages;
  final List<bool> flipedPages;
  final List<int> cardPage;

  const TwoPlayerTableWidget({
    required this.jokerFlipedPages,
    required this.jokerServedPages,
    required this.servedPages,
    required this.flipedPages,
    required this.cardPage,
  });

  @override
  State<TwoPlayerTableWidget> createState() => _TwoPlayerTableWidgetState();
}

class _TwoPlayerTableWidgetState extends State<TwoPlayerTableWidget> {
  List<bool> _moveOldServedPages = [];
  List<bool> _moveOldFlipedPages = [];
  Timer? moveOldServingTimer;
  Timer? moveOldFlipingTimer;

  @override
  void initState() {
    super.initState();
    var rummyProvider = Provider.of<RummyProvider>(context,listen: false);
    rummyProvider.setCardUpFalse();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<RummyProvider,SocketProvider>(builder: (context,rummyProvider,socketProvider,_){
      return Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            top: MediaQuery.of(context).size.height * 0.11,
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
                  child: rummyProvider.stopCountDown == 1
                      ? Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.transparent,Colors.grey,Colors.transparent])),
                        child: Center(child: Text('Start Game in ${rummyProvider.countDown} Seconds...',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),),
                      ),
                    ],
                  )
                      : Stack(
                    clipBehavior: Clip.none,
                    children: [

                      Positioned(
                          top: 09.5.h,
                          left: 51.0.w,
                          child: Text('Down : ${rummyProvider.totalDownCard}',style: TextStyle(color: Colors.white,fontSize: 12),)),
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
                        child: InkWell(
                          onTap: (){
                            if(rummyProvider.isMyTurn){
                              Sockets.socket.emit("draw","down");
                            print('draw emit down done');}else{
                              showToast("It's not your turn,please wait for your Turn".toUpperCase(),
                                context: context,
                                animation: StyledToastAnimation.slideFromTop,
                                reverseAnimation: StyledToastAnimation.fade,
                                position: StyledToastPosition.top,
                                animDuration: Duration(seconds: 1),
                                duration: Duration(seconds: 4),
                                curve: Curves.elasticOut,
                                textStyle: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
                                backgroundColor: Colors.red.withOpacity(0.8),
                                reverseCurve: Curves.linear,
                              );
                            }

                          },
                          child: Container(
                            height: 65,
                            width: 65,
                            child: getSpriteImage(53),
                          ),
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
                                    if(rummyProvider.isMyTurn){
                                      if(rummyProvider.newIndexData ==11){
                                        Sockets.socket.emit("draw","up");
                                        print('draw emit up done');
                                      }else{
                                        showToast("Pick Up a Card".toUpperCase(),
                                          context: context,
                                          animation: StyledToastAnimation.slideFromTop,
                                          reverseAnimation: StyledToastAnimation.fade,
                                          position: StyledToastPosition.top,
                                          animDuration: Duration(seconds: 1),
                                          duration: Duration(seconds: 4),
                                          curve: Curves.elasticOut,
                                          textStyle: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
                                          backgroundColor: Colors.red.withOpacity(0.8),
                                          reverseCurve: Curves.linear,
                                        );
                                      }
                                    }else{
                                      showToast("It's not your turn,please wait for your Turn".toUpperCase(),
                                        context: context,
                                        animation: StyledToastAnimation.slideFromTop,
                                        reverseAnimation: StyledToastAnimation.fade,
                                        position: StyledToastPosition.top,
                                        animDuration: Duration(seconds: 1),
                                        duration: Duration(seconds: 4),
                                        curve: Curves.elasticOut,
                                        textStyle: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
                                        backgroundColor: Colors.red.withOpacity(0.8),
                                        reverseCurve: Curves.linear,
                                      );
                                    }
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
                            if(rummyProvider.isMyTurn){
                              if(rummyProvider.newIndexData.length ==11){
                                rummyProvider.setNoDropCard(false);
                                rummyProvider.setCardListIndex(int.parse(data.toString()));
                                for(int i = 0; i < rummyProvider.cardList.length; i++){
                                  Map<String,dynamic> singleData = rummyProvider.cardList[i];
                                  if((i+1) == int.parse(data.toString())){
                                    rummyProvider.dropCard(singleData);
                                  }
                                }
                                for(int j = 0; j < rummyProvider.newIndexData.length;j++){
                                  print('New ******  :-  $data  :-   ${rummyProvider.newIndexData}');
                                  if(rummyProvider.newIndexData[j] == data){
                                    rummyProvider.setNewRemoveIndex(j);
                                    rummyProvider.setOneAcceptCardList(2,j);
                                  }
                                }
                              }else{

                                showToast("Pick Up a Card".toUpperCase(),
                                  context: context,
                                  animation: StyledToastAnimation.slideFromTop,
                                  reverseAnimation: StyledToastAnimation.fade,
                                  position: StyledToastPosition.top,
                                  animDuration: Duration(seconds: 1),
                                  duration: Duration(seconds: 4),
                                  curve: Curves.elasticOut,
                                  textStyle: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
                                  backgroundColor: Colors.red.withOpacity(0.8),
                                  reverseCurve: Curves.linear,
                                );
                                for(int j = 0; j < rummyProvider.newIndexData.length;j++){
                                  if(rummyProvider.newIndexData[j] == data){
                                    rummyProvider.setOneAcceptCardList(2,j);
                                  }
                                }
                              }
                            }else{
                              showToast("It's not your turn,please wait for your Turn".toUpperCase(),
                                context: context,
                                animation: StyledToastAnimation.slideFromTop,
                                reverseAnimation: StyledToastAnimation.fade,
                                position: StyledToastPosition.top,
                                animDuration: Duration(seconds: 1),
                                duration: Duration(seconds: 4),
                                curve: Curves.elasticOut,
                                textStyle: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
                                backgroundColor: Colors.red.withOpacity(0.8),
                                reverseCurve: Curves.linear,
                              );
                              for(int j = 0; j < rummyProvider.newIndexData.length;j++){

                                if(rummyProvider.newIndexData[j] == data){
                                  rummyProvider.setOneAcceptCardList(2,j);
                                }
                              }
                            }
                          },
                        ),
                      ),
                      /*Positioned(
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
                              rummyProvider.checkSetSequenceData(rummyProvider.reArrangeData);
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
                          )),*/

                      NewPlayer3SeatWidget(
                        userProfileImage: ImageConst.icProfilePic3,
                        // oneCardServed: widget.servedPages[0],
                        // twoCardServed: widget.servedPages[1],
                        // threeCardServed: widget.servedPages[2],
                        // fourCardServed: widget.servedPages[3],
                        // fiveCardServed: widget.servedPages[4],
                        // sixCardServed: widget.servedPages[5],
                        // sevenCardServed: widget.servedPages[6],
                        // eightCardServed: widget.servedPages[7],
                        // nineCardServed: widget.servedPages[8],
                        // tenCardServed: widget.servedPages[9],
                        // oneCardFliped: widget.flipedPages[9],
                        // twoCardFliped: widget.flipedPages[8],
                        // threeCardFliped: widget.flipedPages[7],
                        // fourCardFliped: widget.flipedPages[6],
                        // fiveCardFliped: widget.flipedPages[5],
                        // sixCardFliped: widget.flipedPages[4],
                        // sevenCardFliped: widget.flipedPages[3],
                        // eightCardFliped: widget.flipedPages[2],
                        // nineCardFliped: widget.flipedPages[1],
                        // tenCardFliped: widget.flipedPages[0],
                        // oneCardNo: widget.cardPage[0],
                        // twoCardNo: widget.cardPage[1],
                        // threeCardNo: widget.cardPage[2],
                        // fourCardNo: widget.cardPage[3],
                        // fiveCardNo: widget.cardPage[4],
                        // sixCardNo: widget.cardPage[5],
                        // sevenCardNo: widget.cardPage[6],
                        // eightCardNo: widget.cardPage[7],
                        // nineCardNo: widget.cardPage[8],
                        // tenCardNo: widget.cardPage[9],
                        // jokerCardFliped: widget.jokerFlipedPages[0],
                        // jokerCardNo: widget.cardPage[0],
                        // jokerCardServed: widget.jokerServedPages[0],
                        Served: widget.servedPages,
                        Fliped: widget.flipedPages,
                        CardNo: widget.cardPage,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 15.0,

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 2.0.h),
                  child: Image.asset(
                    ImageConst.icProfilePic1,
                    height: 8.3.h,
                    width: 8.3.h,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
