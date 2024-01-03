import 'dart:async';
import 'package:card_game_serve_and_flip_animation/constant/image_constants.dart';
import 'package:card_game_serve_and_flip_animation/provider/rummy_provider.dart';
import 'package:card_game_serve_and_flip_animation/provider/socket_provider.dart';
import 'package:card_game_serve_and_flip_animation/utils/Sockets.dart';
import 'package:card_game_serve_and_flip_animation/utils/card_sprite_utils.dart';
import 'package:card_game_serve_and_flip_animation/widgets/complete_play_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class RummyGameScreen extends StatefulWidget {
  String gameId;
  String userId;
  RummyGameScreen({Key? key,required this.gameId,required this.userId}) : super(key: key);

  @override
  _RummyGameScreenState createState() => _RummyGameScreenState();
}

class _RummyGameScreenState extends State<RummyGameScreen> {
  bool sizeChange = false;
  List<bool> _servedPages = [false, false, false,false,false, false, false,false,false, false,false,false,false];
  List<bool> _jokerServedPages = [false];
  List<bool> _jokerFlipedPages = [false];
  List<bool> _flipedPages = [false, false, false,false,false, false, false,false,false, false,false,false,false];
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
    upCard(context);
    downCard(context);
    handCard(context);
    turnTime(context);
    countDown();
    gameOver();
    roomMessage();
    turnMessage();
    onlyMessage();


    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    sizeChangeAnimation();
  }


  void createGame() async {
    Sockets.socket.emit("game",widget.gameId);
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
      print('New Data :-   ${data}');
      var rummyProvider = Provider.of<RummyProvider>(context,listen: false);
      List<int> newCardData= [];
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
        rummyProvider.closeTimer();
        rummyProvider.setNewRemoveData();
        _cardPageNumber = newCardData;
        print('New Data ***** :-   ${_cardPageNumber.length}');
        for(int i = 0; i< _cardPageNumber.length;i++){
          rummyProvider.setNewData(_cardPageNumber[i]);
        }
      });

    });
  }

  void turnTime(BuildContext context) async {
    Sockets.socket.on("turn", (data) {
      print("**** TURN *** ${data}");


      if(data['timeOut'] !=null){
        if(data['timeOut'] == 0){
          Provider.of<RummyProvider>(context,listen: false).closeTimer();
          Provider.of<RummyProvider>(context,listen: false).initTimer();
        }else{
          Provider.of<RummyProvider>(context,listen: false).closeTimer();
          Provider.of<RummyProvider>(context,listen: false).initTimer();
          Provider.of<RummyProvider>(context,listen: false).startTimer(context);
        }
      }
    });
  }

  void countDown() async {
    Sockets.socket.on("count down", (data) {
      print("**** COUNT DOWN **** $data");
      var rummyProvider = Provider.of<RummyProvider>(context,listen: false);

        rummyProvider.setCountDown(data);

    });
  }

  void gameOver() async {
    Sockets.socket.on("game over", (data) {
      print("**** Game Over **** $data");
      openAlertBox();
    });
  }

  void roomMessage() async {
    Sockets.socket.on("room message", (data) {
      print("**** ROOM MESSAGE **** $data");
    });
  }

  void turnMessage() async {
    Sockets.socket.on("turn message", (data) {
      print("**** TURN MESSAGE **** $data  ${widget.userId}");
      if(data['userId'] == widget.userId) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: Center(
            child: Stack(

              children: [
                Container(
                  width: 300,
                  padding: EdgeInsets.all(16),height: 55,decoration: BoxDecoration(color: Colors.red.withOpacity(0.5),borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(width: 48,),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(data['message'],style: TextStyle(color: Colors.black,fontSize: 18),),
                        ],
                      ))
                    ],
                  ),
                ),
                Positioned(
                    bottom: -10,
                    right: -10,
                    child:ClipRRect(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),child: Stack(
                      children: [
                        Image.asset('assets/images/snackBar.png',height: 50,width: 50)
                      ],
                    ),)),

              ],
            ),
          ),));
      }
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
            child:Stack(
              children: [
                _cardPageNumber.isNotEmpty ? CompletePlayTableWidget(
                  servedPages: _servedPages,
                  flipedPages: _flipedPages,
                  cardPage: rummyProvider.newIndexData,
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
