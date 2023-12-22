import 'package:flutter/cupertino.dart';

import '../utils/Sockets.dart';

class RummyProvider extends ChangeNotifier{
  int _isDropOneCard = 0;
  int _isDropTwoCard = 0;
  int _isDropThreeCard = 0;
  int _isDropFourCard = 0;
  int _isDropFiveCard = 0;
  int _isDropSixCard = 0;
  int _isDropSevenCard = 0;
  int _isDropEightCard = 0;
  int _isDropNineCard = 0;
  int _isDropTenCard = 0;
  int _isDropElevenCard = 0;
  int _isDropTwelveCard = 0;
  int _isDropThirteenCard = 0;
  List _cardListIndex = [];
  List<bool> _cardUp = [];
  bool _isSortCard = false;
  List<Map<String,dynamic>> _cardList = [
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

  int get isDropOneCard => _isDropOneCard;
  int get isDropTwoCard => _isDropTwoCard;
  int get isDropThreeCard => _isDropThreeCard;
  int get isDropFourCard => _isDropFourCard;
  int get isDropFiveCard => _isDropFiveCard;
  int get isDropSixCard => _isDropSixCard;
  int get isDropSevenCard => _isDropSevenCard;
  int get isDropEightCard => _isDropEightCard;
  int get isDropNineCard => _isDropNineCard;
  int get isDropTenCard => _isDropTenCard;
  int get isDropElevenCard => _isDropElevenCard;
  int get isDropTwelveCard => _isDropTwelveCard;
  int get isDropThirteenCard => _isDropThirteenCard;
  List get cardListIndex => _cardListIndex;
  List get cardUp => _cardUp;
  bool get isSortCard => _isSortCard;
  List<Map<String,dynamic>> get cardList => _cardList;


  void dropCard(Map<String,dynamic> data) async {
    Sockets.socket.emit("drop","$data");
    print("*** DROP EMIT ***");
  }

  void checkSetSequence(List<Map<String,dynamic>> checkData) async {
    Sockets.socket.emit("check set sequences",checkData);
    Sockets.socket.on("check set sequences", (data) {
      print("^^^^ DATA ^^^^ $data");
    });
  }

  setDropOneCard(int value){
    _isDropOneCard = value;
    notifyListeners();
  }

  setDropTwoCard(int value){
    _isDropTwoCard = value;
    notifyListeners();
  }

  setDropThreeCard(int value){
    _isDropThreeCard = value;
    notifyListeners();
  }

  setDropFourCard(int value){
    _isDropFourCard = value;
    notifyListeners();
  }

  setDropFiveCard(int value){
    _isDropFiveCard = value;
    notifyListeners();
  }

  setDropSixCard(int value){
    _isDropSixCard = value;
    notifyListeners();
  }

  setDropSevenCard(int value){
    _isDropSevenCard = value;
    notifyListeners();
  }

  setDropEightCard(int value){
    _isDropEightCard = value;
    notifyListeners();
  }

  setDropNineCard(int value){
    _isDropNineCard = value;
    notifyListeners();
  }

  setDropTenCard(int value){
    _isDropTenCard = value;
    notifyListeners();
  }

  setDropElevenCard(int value){
    _isDropElevenCard = value;
    notifyListeners();
  }

  setDropTwelveCard(int value){
    _isDropTwelveCard = value;
    notifyListeners();
  }

  setDropThirteenCard(int value){
    _isDropThirteenCard = value;
    notifyListeners();
  }

  setCardListIndex(int value){
    _cardListIndex.add(value);
    notifyListeners();
  }

  setCardUpFalse(){
    for(int i = 0; i< 14;i++){
      _cardUp.add(false);
    }
  }

  setCardUpTrue(int index){
    _cardUp[index] = !_cardUp[index];
    notifyListeners();
  }

  setSortAllCard(){
    _isSortCard = !_isSortCard;
    notifyListeners();
  }

}