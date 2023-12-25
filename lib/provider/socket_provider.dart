import 'package:card_game_serve_and_flip_animation/provider/rummy_provider.dart';
import 'package:card_game_serve_and_flip_animation/utils/Sockets.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SocketProvider extends ChangeNotifier{

  List<int> _cardNumberList =[];

  List<int> get cardNumberList => _cardNumberList;

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

      _cardNumberList = newCardData;
      notifyListeners();

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

  setRemoveIndex(int index){
    _cardNumberList.removeAt(index);
    notifyListeners();
  }

  setNewIndex(int index,int value){
    _cardNumberList.insert(index,value);
    notifyListeners();
  }
}