import 'dart:async';
import 'dart:math';
import 'package:card_game_serve_and_flip_animation/constant/image_constants.dart';
import 'package:card_game_serve_and_flip_animation/provider/rummy_provider.dart';
import 'package:card_game_serve_and_flip_animation/provider/socket_provider.dart';
import 'package:card_game_serve_and_flip_animation/screens/rummy_palyer_table/five_player_table.dart';
import 'package:card_game_serve_and_flip_animation/screens/rummy_palyer_table/four_player_table.dart';
import 'package:card_game_serve_and_flip_animation/screens/rummy_palyer_table/one_player_table.dart';
import 'package:card_game_serve_and_flip_animation/screens/rummy_palyer_table/six_player_table.dart';
import 'package:card_game_serve_and_flip_animation/screens/rummy_palyer_table/three_player_table.dart';
import 'package:card_game_serve_and_flip_animation/screens/rummy_palyer_table/two_player_table.dart';
import 'package:card_game_serve_and_flip_animation/utils/Sockets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class RummyGameScreen extends StatefulWidget {
  String gameId;
  String userId;
  RummyGameScreen({Key? key,required this.userId,required this.gameId}) : super(key: key);

  @override
  _RummyGameScreenState createState() => _RummyGameScreenState();
}

class _RummyGameScreenState extends State<RummyGameScreen> {
  bool sizeChange = false;
  List<bool> _servedPages = [false, false, false,false,false, false, false,false,false, false,false,false];
  List<bool> _jokerServedPages = [false];
  List<bool> _jokerFlipedPages = [false];
  List<bool> _flipedPages = [false, false, false,false,false, false, false,false,false, false,false,false];
  Timer? servingTimer;
  Timer? flipingTimer;
  Timer? jokerServingTimer;
  Timer? jokerFlipingTimer;

  @override
  void initState() {
    Sockets.connectAndListen(context,widget.gameId,widget.userId);

    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    sizeChangeAnimation();
  }
  @override
  void dispose() {
    servingTimer?.cancel();
    flipingTimer?.cancel();
    jokerServingTimer?.cancel();
    jokerFlipingTimer?.cancel();
    super.dispose();
  }

  sizeChangeAnimation() {
    int serveCounter = 0;
    int jokerServeCounter = 0;
    int flipCounter = 0;
    int jokerFlipCounter = 0;
    servingTimer = Timer.periodic(Duration(milliseconds: 200), (serveTimer) {
      if (!mounted) return;
      setState(() {
        _servedPages[serveCounter] = true;
      });
      serveCounter++;
      if (serveCounter == 11) {
        serveTimer.cancel();
        servingTimer?.cancel();
        Future.delayed(Duration(seconds: 1),(){
          Provider.of<RummyProvider>(context,listen: false).setFilpCard(false);
          flipingTimer = Timer.periodic(Duration(milliseconds: 200), (flipTimer) {
            if (!mounted) return;
            setState(() {
              _flipedPages[flipCounter] = true;
            });
            flipCounter++;
            if (flipCounter == 11) {
              flipTimer.cancel();
              flipingTimer?.cancel();
            }
          });
        });

      }
    });
    Future.delayed(Duration(seconds: 6),(){
      jokerServingTimer = Timer.periodic(Duration(milliseconds: 500), (jokerServeTimer) {
        if (!mounted) return;
        setState(() {
          _jokerServedPages[jokerServeCounter] = true;
        });
        jokerServeCounter++;
        if (jokerServeCounter == 1) {
          jokerServeTimer.cancel();
          jokerServingTimer?.cancel();
          Future.delayed(Duration(seconds: 1),(){
            jokerFlipingTimer = Timer.periodic(Duration(milliseconds: 200), (jokerFlipTimer) {
              if (!mounted) return;
              setState(() {
                _jokerFlipedPages[jokerFlipCounter] = true;
              });
              jokerFlipCounter++;
              if (jokerFlipCounter == 1) {
                jokerFlipTimer.cancel();
                jokerFlipingTimer?.cancel();
              }
            });
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RummyProvider>(
        builder: (context,rummyProvider,_){
          return Container(
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConst.bgHome),
                fit: BoxFit.fill,
              ),
            ),
            child: rummyProvider.playerCount == 1
                ? Stack(
              alignment: Alignment.center,
              children: [

                rummyProvider.newIndexData.isNotEmpty
                    ? OnePlayerTableWidget(
                  servedPages: _servedPages,
                  flipedPages: _flipedPages,
                  cardPage: rummyProvider.newIndexData,
                  jokerFlipedPages: _jokerFlipedPages,
                  jokerServedPages: _jokerServedPages,
                )
                    : OnePlayerTableWidget(
                  servedPages: [],
                  flipedPages: [],
                  cardPage: [],
                  jokerFlipedPages: [],
                  jokerServedPages: [],
                ),
                Positioned(
                  top: 4.5.h,
                  left: MediaQuery.of(context).size.width - 50,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: rummyProvider.secondsRemaining/30,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                        strokeWidth: 3,
                        backgroundColor: rummyProvider.secondsRemaining <= 10 ?Colors.red:Colors.green,
                      ),
                      Text('${rummyProvider.secondsRemaining.toString()}',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),

              ],
            )
                : rummyProvider.playerCount == 2
                ? Stack(
              alignment: Alignment.center,
              children: [

                rummyProvider.newIndexData.isNotEmpty
                    ? TwoPlayerTableWidget(
                  servedPages: _servedPages,
                  flipedPages: _flipedPages,
                  cardPage: rummyProvider.newIndexData,
                  jokerFlipedPages: _jokerFlipedPages,
                  jokerServedPages: _jokerServedPages,
                )
                    : TwoPlayerTableWidget(
                  servedPages: [],
                  flipedPages: [],
                  cardPage: [],
                  jokerFlipedPages: [],
                  jokerServedPages: [],
                ),
                Positioned(
                  top: 4.5.h,
                  left: MediaQuery.of(context).size.width - 50,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: rummyProvider.secondsRemaining/30,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                        strokeWidth: 3,
                        backgroundColor: rummyProvider.secondsRemaining <= 10 ?Colors.red:Colors.green,
                      ),
                      Text('${rummyProvider.secondsRemaining.toString()}',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),

              ],
            )
                : rummyProvider.playerCount == 3
                ? Stack(
              alignment: Alignment.center,
              children: [

                rummyProvider.newIndexData.isNotEmpty
                    ? ThreePlayerTableWidget(
                  servedPages: _servedPages,
                  flipedPages: _flipedPages,
                  cardPage: rummyProvider.newIndexData,
                  jokerFlipedPages: _jokerFlipedPages,
                  jokerServedPages: _jokerServedPages,
                )
                    : ThreePlayerTableWidget(
                  servedPages: [],
                  flipedPages: [],
                  cardPage: [],
                  jokerFlipedPages: [],
                  jokerServedPages: [],
                ),
                Positioned(
                  top: 4.5.h,
                  left: MediaQuery.of(context).size.width - 50,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: rummyProvider.secondsRemaining/30,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                        strokeWidth: 3,
                        backgroundColor: rummyProvider.secondsRemaining <= 10 ?Colors.red:Colors.green,
                      ),
                      Text('${rummyProvider.secondsRemaining.toString()}',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),

              ],
            )
                : rummyProvider.playerCount == 4
                ? Stack(
              alignment: Alignment.center,
              children: [
                rummyProvider.newIndexData.isNotEmpty
                    ? FourPlayerTableWidget(
                  servedPages: _servedPages,
                  flipedPages: _flipedPages,
                  cardPage: rummyProvider.newIndexData,
                  jokerFlipedPages: _jokerFlipedPages,
                  jokerServedPages: _jokerServedPages,
                )
                    : FourPlayerTableWidget(
                  servedPages: [],
                  flipedPages: [],
                  cardPage: [],
                  jokerFlipedPages: [],
                  jokerServedPages: [],
                ),
                Positioned(
                  top: 4.5.h,
                  left: MediaQuery.of(context).size.width - 50,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: rummyProvider.secondsRemaining/30,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                        strokeWidth: 3,
                        backgroundColor: rummyProvider.secondsRemaining <= 10 ?Colors.red:Colors.green,
                      ),
                      Text('${rummyProvider.secondsRemaining.toString()}',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),

              ],
            )
                : rummyProvider.playerCount == 5
                ? Stack(
              alignment: Alignment.center,
              children: [
                rummyProvider.newIndexData.isNotEmpty
                    ? FivePlayerTableWidget(
                  servedPages: _servedPages,
                  flipedPages: _flipedPages,
                  cardPage: rummyProvider.newIndexData,
                  jokerFlipedPages: _jokerFlipedPages,
                  jokerServedPages: _jokerServedPages,
                )
                    : FivePlayerTableWidget(
                  servedPages: [],
                  flipedPages: [],
                  cardPage: [],
                  jokerFlipedPages: [],
                  jokerServedPages: [],
                ),
                Positioned(
                  top: 4.5.h,
                  left: MediaQuery.of(context).size.width - 50,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: rummyProvider.secondsRemaining/30,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                        strokeWidth: 3,
                        backgroundColor: rummyProvider.secondsRemaining <= 10 ?Colors.red:Colors.green,
                      ),
                      Text('${rummyProvider.secondsRemaining.toString()}',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),

              ],
            )
                : rummyProvider.playerCount == 6
                ? Stack(
              alignment: Alignment.center,
              children: [
                rummyProvider.newIndexData.isNotEmpty
                    ? SixPlayerTableWidget(
                  servedPages: _servedPages,
                  flipedPages: _flipedPages,
                  cardPage: rummyProvider.newIndexData,
                  jokerFlipedPages: _jokerFlipedPages,
                  jokerServedPages: _jokerServedPages,
                )
                    : SixPlayerTableWidget(
                  servedPages: [],
                  flipedPages: [],
                  cardPage: [],
                  jokerFlipedPages: [],
                  jokerServedPages: [],
                ),
                Positioned(
                  top: 4.5.h,
                  left: MediaQuery.of(context).size.width - 50,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: rummyProvider.secondsRemaining/30,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                        strokeWidth: 3,
                        backgroundColor: rummyProvider.secondsRemaining <= 10 ?Colors.red:Colors.green,
                      ),
                      Text('${rummyProvider.secondsRemaining.toString()}',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),

              ],
            )
                : Stack(
              alignment: Alignment.center,
              children: [

                rummyProvider.newIndexData.isNotEmpty
                    ? OnePlayerTableWidget(
                  servedPages: _servedPages,
                  flipedPages: _flipedPages,
                  cardPage: rummyProvider.newIndexData,
                  jokerFlipedPages: _jokerFlipedPages,
                  jokerServedPages: _jokerServedPages,
                )
                    : OnePlayerTableWidget(
                  servedPages: [],
                  flipedPages: [],
                  cardPage: [],
                  jokerFlipedPages: [],
                  jokerServedPages: [],
                ),
                Positioned(
                  top: 4.5.h,
                  left: MediaQuery.of(context).size.width - 50,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: rummyProvider.secondsRemaining/30,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                        strokeWidth: 3,
                        backgroundColor: rummyProvider.secondsRemaining <= 10 ?Colors.red:Colors.green,
                      ),
                      Text('${rummyProvider.secondsRemaining.toString()}',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }

  openAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(height: 50,width: 50,decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,border: Border.all(color: Colors.red),
                  ),child: Center(child: Icon(Icons.person)),),
                  SizedBox(
                    height: 5.0,
                  ),
                  Center(child: Text('Winner Name',style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),)),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Container(
                      height: 40,
                      child: Text('Winner Message',style: TextStyle(color: Colors.black,fontSize: 15),)),
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0)),
                      ),
                      child: Text(
                        "Quit Game",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
