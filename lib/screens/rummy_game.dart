import 'dart:async';
import 'dart:math';
import 'package:card_game_serve_and_flip_animation/constants/image_constants.dart';
import 'package:card_game_serve_and_flip_animation/provider/rummy_provider.dart';
import 'package:card_game_serve_and_flip_animation/provider/socket_provider.dart';
import 'package:card_game_serve_and_flip_animation/utils/Sockets.dart';
import 'package:card_game_serve_and_flip_animation/widgets/complete_play_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class RummyGameScreen extends StatefulWidget {
  RummyGameScreen({Key? key}) : super(key: key);

  @override
  _RummyGameScreenState createState() => _RummyGameScreenState();
}

class _RummyGameScreenState extends State<RummyGameScreen> {
  bool sizeChange = false;
  List<bool> _servedPages = [false, false, false,false,false, false, false,false,false, false,false];
  List<bool> _jokerServedPages = [false];
  List<bool> _jokerFlipedPages = [false];
  List<bool> _flipedPages = [false, false, false,false,false, false, false,false,false, false,false];
  List<int> _cardPageNumber = [];
  Timer? servingTimer;
  Timer? flipingTimer;
  Timer? jokerServingTimer;
  Timer? jokerFlipingTimer;
  int min = 1;
  int max = 53;
  int searchNumber = 53;

  @override
  void initState() {
    _cardPageNumber.clear();
    var socketProvider = Provider.of<SocketProvider>(context,listen: false);
    Sockets.connectAndListen();
    createGame();
    upCard(context);
    downCard(context);
    handCard(context);
    turnTime(context);
    countDown();

    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    sizeChangeAnimation();
  }


  void createGame() async {
    Sockets.socket.emit("game","game1");
    Sockets.socket.on("game", (data) {
      print("***** GAME **** $data");
    });
  }

  void drawCard() async {
    Sockets.socket.emit("draw","up");
    Sockets.socket.on("draw", (data) {});
  }

  void upCard(BuildContext context) async {
    Sockets.socket.on("up", (data) {
      print('*** UP *** ${data}');
      var rummyProvider = Provider.of<RummyProvider>(context,listen: false);

      String value = data['value'];
      String suit = data['suit'];

      for(int i = 0; i< rummyProvider.cardList.length;i++){
        if(rummyProvider.cardList[i]['value'] == value){
          if(rummyProvider.cardList[i]['suit'] == suit){
            Future.delayed(Duration(seconds: 6),(){
              Provider.of<RummyProvider>(context,listen: false).setCardListIndex(i+1);
            });
          }
        }
      }
    });
  }

  void downCard(BuildContext context) async {
    Sockets.socket.on("down", (data) {
      print("*** DOWN ** ${data}");
      Provider.of<RummyProvider>(context,listen: false).setTotalDownCard(data);
    });
  }

  void handCard(BuildContext context) async {
    Sockets.socket.on("hand", (data) {
      var rummyProvider = Provider.of<RummyProvider>(context,listen: false);
      List<int> newCardData= [];
      rummyProvider.setSequenceData(data);
      List<Map<String,dynamic>> data2 = [];
      for(int i = 0; i < data.length; i++){
        Map<String,dynamic> data3 = data[i];
        data2.add(data3);
      }
      for(int i = 0; i < data2.length; i++){
        Map<String,dynamic> singleCard = data2[i];
        String singleCardValue = singleCard["value"];
        String singleCardSuit = singleCard["suit"];
        for(int j = 0; j < rummyProvider.cardList.length; j++){
          Map<String,dynamic> sCard = rummyProvider.cardList[j];
          String sCardValue = sCard["value"];
          String sCardSuit = sCard["suit"];
          if(singleCardValue == sCardValue && singleCardSuit == sCardSuit){
            newCardData.add(j + 1);
          }
        }
      }

      setState(() {
        _cardPageNumber = newCardData;
      });

    });
  }

  void turnTime(BuildContext context) async {
    Sockets.socket.on("turn", (data) {
      print("**** TURN *** ${data}");

      if(data['timeOut'] !=null){
        Provider.of<RummyProvider>(context,listen: false).initTimer();
        Provider.of<RummyProvider>(context,listen: false).startTimer(context);
      }
    });
  }

  void countDown() async {
    Sockets.socket.on("count down", (data) {
      print("**** COUNT DOWN **** $data");
    });
  }

  void gameOver() async {
    Sockets.socket.on("game over", (data) {
      print("**** COUNT DOWN **** $data");
    });
  }

  void roomMessage() async {
    Sockets.socket.on("room message", (data) {
      print("**** ROOM MESSAGE **** $data");
    });
  }

  void turnMessage() async {
    Sockets.socket.on("turn message", (data) {
      print("**** TURN MESSAGE **** $data");
    });
  }
  
  void onlyMessage() async {
    Sockets.socket.on("message", (data) {
      print("**** MESSAGE **** $data");
    });
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
      if (serveCounter == 10) {
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
            if (flipCounter == 10) {
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
            child:_cardPageNumber.isNotEmpty ? Stack(
              children: [
                _cardPageNumber.isNotEmpty ? CompletePlayTableWidget(
                  servedPages: _servedPages,
                  flipedPages: _flipedPages,
                  cardPage: _cardPageNumber,
                  jokerFlipedPages: _jokerFlipedPages,
                  jokerServedPages: _jokerServedPages,
                ) : CompletePlayTableWidget(
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
                        value: rummyProvider.secondsRemaining/10,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                        strokeWidth: 3,
                        backgroundColor: rummyProvider.secondsRemaining <= 3 ?Colors.red:Colors.green,
                      ),
                      Text('${rummyProvider.secondsRemaining.toString()}',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ],
            )  : Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
