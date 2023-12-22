import 'dart:async';
import 'dart:math';
import 'package:card_game_serve_and_flip_animation/constants/image_constants.dart';
import 'package:card_game_serve_and_flip_animation/provider/rummy_provider.dart';
import 'package:card_game_serve_and_flip_animation/utils/Sockets.dart';
import 'package:card_game_serve_and_flip_animation/widgets/complete_play_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RummyGameScreen extends StatefulWidget {
  RummyGameScreen({Key? key}) : super(key: key);

  @override
  _RummyGameScreenState createState() => _RummyGameScreenState();
}

class _RummyGameScreenState extends State<RummyGameScreen> {
  bool sizeChange = false;
  List<bool> _servedPages = [false, false, false,false,false, false, false,false,false, false];
  List<bool> _jokerServedPages = [false];
  List<bool> _jokerFlipedPages = [false];
  List<bool> _flipedPages = [false, false, false,false,false, false, false,false,false, false];
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
    Sockets.connectAndListen();
    createGame();
    upCard();
    downCard();
    handCard();
    turnTime();

    /* for(int i =0;i< 14;i++){
      Random rnd = new Random();
      int r = min + rnd.nextInt(max - min);
      _cardPageNumber.add(r);
    }
    
    if(_cardPageNumber.contains(53)){
      int index = _cardPageNumber.indexWhere((item) => item == searchNumber);
      _cardPageNumber.insert(index, 54);
    }*/

    // _cardPageNumber.add(2);
    // _cardPageNumber.add(4);
    // _cardPageNumber.add(3);
    // _cardPageNumber.add(14);
    // _cardPageNumber.add(18);
    // _cardPageNumber.add(19);
    // _cardPageNumber.add(23);
    // _cardPageNumber.add(29);
    // _cardPageNumber.add(54);
    // _cardPageNumber.add(31);
    // _cardPageNumber.add(40);
    // _cardPageNumber.add(49);
    // _cardPageNumber.add(14);

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

  // void drawCard() async {
  //   Sockets.socket.emit("draw","up");
  //   Sockets.socket.on("draw", (data) {});
  // }

  void upCard() async {
    Sockets.socket.on("up", (data) {
      print('**** UP **** $data');
    });
  }

  void downCard() async {
    Sockets.socket.on("down", (data) {
      print("**** DOWN *** $data");
    });
  }

  // void reArrangeCard() async {
  //   Sockets.socket.emit("re arrange",["card[]"]);
  //   Sockets.socket.on("re arrange", (data) {});
  // }

  void handCard() async {
    Sockets.socket.on("hand", (data) {
      print("**** HAND **** $data");
      var rummyProvider = Provider.of<RummyProvider>(context,listen: false);
      _cardPageNumber.clear();
      List<Map<String,dynamic>> data2 = [];
      for(int i = 0; i < data.length; i++){
        Map<String,dynamic> data3 = data[i];
        data2.add(data3);
      }
      print('&&&&&&&&& $data2');
      for(int i = 0; i < data2.length; i++){
        Map<String,dynamic> singleCard = data2[i];
        String singleCardValue = singleCard["value"];
        String singleCardSuit = singleCard["suit"];
        for(int j = 0; j < rummyProvider.cardList.length; j++){
          Map<String,dynamic> sCard = rummyProvider.cardList[j];
          String sCardValue = sCard["value"];
          String sCardSuit = sCard["suit"];
          if(singleCardValue == sCardValue && singleCardSuit == sCardSuit){
            _cardPageNumber.add(j + 1);
            // print('%%%%%% INDEX ${j + 1}');
          }
        }
      }
    });
  }

  void turnTime() async {
    Sockets.socket.on("turn", (data) {
      print("***** TURN **** $data");
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
      body: _cardPageNumber.isNotEmpty ? Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConst.bgHome),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            CompletePlayTableWidget(
              servedPages: _servedPages,
              flipedPages: _flipedPages,
              cardPage: _cardPageNumber,
              jokerFlipedPages: _jokerFlipedPages,
              jokerServedPages: _jokerServedPages,
            ),
          ],
        ),
      ) : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
