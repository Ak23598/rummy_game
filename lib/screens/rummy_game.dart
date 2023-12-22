import 'dart:async';
import 'dart:math';
import 'package:card_game_serve_and_flip_animation/constants/image_constants.dart';
import 'package:card_game_serve_and_flip_animation/utils/Sockets.dart';
import 'package:card_game_serve_and_flip_animation/widgets/complete_play_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RummyGameScreen extends StatefulWidget {
  RummyGameScreen({Key? key}) : super(key: key);

  @override
  _RummyGameScreenState createState() => _RummyGameScreenState();
}

class _RummyGameScreenState extends State<RummyGameScreen> {
  bool sizeChange = false;
  List<bool> _servedPages = [false, false, false,false,false, false, false,false,false, false, false,false,false];
  List<bool> _jokerServedPages = [false];
  List<bool> _jokerFlipedPages = [false];
  List<bool> _flipedPages = [false, false, false,false,false, false, false,false,false, false, false,false,false];
  List<int> _cardPageNumber = [];
  Timer? servingTimer;
  Timer? flipingTimer;
  Timer? jokerServingTimer;
  Timer? jokerFlipingTimer;
  int min = 1;
  int max = 53;
  int searchNumber = 53;
  List<Map<String,dynamic>> cardList = [
    {"value":"A","suit":"Spades"},
    {"value":"2","suit":"Spades"},
    {"value":"3","suit":"Spades"},
    {"value":"4","suit":"Spades"},
    {"value":"5","suit":"Spades"},
    {"value":"6","suit":"Spades"},
    {"value":"7","suit":"Spades"},
    {"value":"8","suit":"Spades"},
    {"value":"9","suit":"Spades"},
    {"value":"10","suit":"Spades"},
    {"value":"J","suit":"Spades"},
    {"value":"Q","suit":"Spades"},
    {"value":"K","suit":"Spades"},
    {"value":"A","suit":"Hearts"},
    {"value":"2","suit":"Hearts"},
    {"value":"3","suit":"Hearts"},
    {"value":"4","suit":"Hearts"},
    {"value":"5","suit":"Hearts"},
    {"value":"6","suit":"Hearts"},
    {"value":"7","suit":"Hearts"},
    {"value":"8","suit":"Hearts"},
    {"value":"9","suit":"Hearts"},
    {"value":"10","suit":"Hearts"},
    {"value":"J","suit":"Hearts"},
    {"value":"Q","suit":"Hearts"},
    {"value":"K","suit":"Hearts"},
    {"value":"A","suit":"Clubs"},
    {"value":"2","suit":"Clubs"},
    {"value":"3","suit":"Clubs"},
    {"value":"4","suit":"Clubs"},
    {"value":"5","suit":"Clubs"},
    {"value":"6","suit":"Clubs"},
    {"value":"7","suit":"Clubs"},
    {"value":"8","suit":"Clubs"},
    {"value":"9","suit":"Clubs"},
    {"value":"10","suit":"Clubs"},
    {"value":"J","suit":"Clubs"},
    {"value":"Q","suit":"Clubs"},
    {"value":"K","suit":"Clubs"},
    {"value":"A","suit":"Diamonds"},
    {"value":"2","suit":"Diamonds"},
    {"value":"3","suit":"Diamonds"},
    {"value":"4","suit":"Diamonds"},
    {"value":"5","suit":"Diamonds"},
    {"value":"6","suit":"Diamonds"},
    {"value":"7","suit":"Diamonds"},
    {"value":"8","suit":"Diamonds"},
    {"value":"9","suit":"Diamonds"},
    {"value":"10","suit":"Diamonds"},
    {"value":"J","suit":"Diamonds"},
    {"value":"Q","suit":"Diamonds"},
    {"value":"K","suit":"Diamonds"},
  ];

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

    _cardPageNumber.add(2);
    _cardPageNumber.add(4);
    _cardPageNumber.add(3);
    _cardPageNumber.add(14);
    _cardPageNumber.add(18);
    _cardPageNumber.add(19);
    _cardPageNumber.add(23);
    _cardPageNumber.add(29);
    _cardPageNumber.add(54);
    _cardPageNumber.add(31);
    _cardPageNumber.add(40);
    _cardPageNumber.add(49);
    _cardPageNumber.add(14);

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

  // void dropCard() async {
  //   Sockets.socket.emit("drop","Card");
  //   Sockets.socket.on("drop", (data) {});
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
    });
  }

  // void checkSetSequence() async {
  //   Sockets.socket.emit("check set sequences",["card[]"]);
  //   Sockets.socket.on("check set sequences", (data) {});
  // }

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
      if (serveCounter == 13) {
        serveTimer.cancel();
        servingTimer?.cancel();
        Future.delayed(Duration(seconds: 1),(){
          flipingTimer = Timer.periodic(Duration(milliseconds: 200), (flipTimer) {
            if (!mounted) return;
            setState(() {
              _flipedPages[flipCounter] = true;
            });
            flipCounter++;
            if (flipCounter == 13) {
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
      body: Container(
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
      ),
    );
  }
}
