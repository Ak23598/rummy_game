import 'package:flutter/cupertino.dart';

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