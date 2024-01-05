import 'package:card_game_serve_and_flip_animation/constant/custom_dialog/winner_dialog.dart';
import 'package:card_game_serve_and_flip_animation/provider/rummy_provider.dart';
import 'package:card_game_serve_and_flip_animation/utils/Sockets.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SocketProvider extends ChangeNotifier{

  List<int> _cardNumberList =[];

  List<int> get cardNumberList => _cardNumberList;

  void createGame(String gameID,BuildContext context) async {
    Sockets.socket.emit("game",gameID);
    Sockets.socket.on("game", (data) {
     print('Socket In Game Event Completed ***** game *****  $data');
    });
  }

  void drawCard(BuildContext context) async {
  Sockets.socket.emit("draw","up");
  Sockets.socket.on("draw", (data) {
    print('Socket In Draw Event Completed ***** draw *****  $data');
  });
}

  void upCard(BuildContext context) async {
    Sockets.socket.on("up", (data) {
      print('Socket In Up Event Completed ***** up *****  $data');
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
      print('Socket In Down Event Completed ***** down *****  $data');
      Provider.of<RummyProvider>(context,listen: false).setTotalDownCard(data);
    });
  }

  void handCard(BuildContext context) async {
    Sockets.socket.on("hand", (data) {
      print('Socket In Hand Event Completed ***** hand *****  $data');
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


        rummyProvider.setNewRemoveData();
        _cardNumberList = newCardData;
        for(int i = 0; i< _cardNumberList.length;i++){
          rummyProvider.setNewData(_cardNumberList[i]);
          rummyProvider.checkSetSequenceData(data);
        }
      });
  }

  void turnTime(BuildContext context) async {
    Sockets.socket.on("turn", (data) {
      print('Socket In Turn Event Completed ***** turn *****  $data');

      if(data['timeOut'] !=null){
        if(data['timeOut'] == 0){
          Provider.of<RummyProvider>(context,listen: false).closeTimer();
          Provider.of<RummyProvider>(context,listen: false).initTimer();
          Provider.of<RummyProvider>(context,listen: false).setMyTurn(false);
        }else{
          Provider.of<RummyProvider>(context,listen: false).setMyTurn(true);
          Provider.of<RummyProvider>(context,listen: false).closeTimer();
          Provider.of<RummyProvider>(context,listen: false).initTimer();
          Provider.of<RummyProvider>(context,listen: false).startTimer(context);
        }
      }
    });
  }

  void countDown(BuildContext context) async {
    Sockets.socket.on("count down", (data) {
      print("**** COUNT DOWN **** $data");

      Provider.of<RummyProvider>(context,listen: false).setCountDown(data);

      if(data == 0){
        if(Provider.of<RummyProvider>(context,listen: false).playerCount == 1){
          Sockets.socket.disconnect();
          Navigator.pop(context);
        }
      }
    });
  }

  void gameOver(BuildContext context,ConfettiController controller) async {
    Sockets.socket.on("game over", (data) {
      print("**** Game Over **** $data");
      WinnerDialog(
        title: 'You are Winner',
        message: data['message'],
        leftButton: 'Cancel',
        rightButton: 'Exit',
        controller: controller,
        onTapLeftButton: () {
          Navigator.pop(context);
        },
        onTapRightButton: () {

        },
      ).show(context);
    });
  }

  void roomMessage(BuildContext context) async {
    Sockets.socket.on("room message", (data) {
      print("**** ROOM MESSAGE **** $data");

      var rummyProvider = Provider.of<RummyProvider>(context,listen: false);
      rummyProvider.setPlayerCount(data['playerCount']);
    });
  }

  void turnMessage(BuildContext context,String userId) async {
    Sockets.socket.on("turn message", (data) {
      print("**** TURN MESSAGE **** $data");
      var rummyProvider = Provider.of<RummyProvider>(context,listen: false);

      if(data['userId'] == userId){

      }else{
        rummyProvider.setMyTurn(false);
      }
    });
  }

  void onlyMessage(BuildContext context) async {
    Sockets.socket.on("message", (data) {
      print("**** MESSAGE **** $data");
    });
  }

  setRemoveIndex(int index){
    _cardNumberList.removeAt(index);
    notifyListeners();
  }

  setNewIndex(int index,int value){
    _cardNumberList.insert(index,value);
    notifyListeners();
  }

  disconnectSocket(BuildContext context){
  Sockets.socket.disconnect();
  Navigator.pop(context);
  }

  openAlertBox(BuildContext context) {
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