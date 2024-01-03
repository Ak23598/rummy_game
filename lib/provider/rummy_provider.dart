import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../utils/Sockets.dart';

class RummyProvider extends ChangeNotifier{
  int _isDropOneCard = 0;
  int _stopCountDown = 1;
  int _isDropTwoCard = 0;
  int _isDropThreeCard = 0;
  int _playerCount = 0;
  int _isDropFourCard = 0;
  int _isDropFiveCard = 0;
  int _isDropSixCard = 0;
  int _countDown  = 0;
  int _isDropSevenCard = 0;
  int _isDropEightCard = 0;
  int _isDropNineCard = 0;
  int _isDropTenCard = 0;
  int _isDropElevenCard = 0;
  int _isDropTwelveCard = 0;
  int _isDropThirteenCard = 0;
  List _cardListIndex = [];
  List _acceptCardListIndex = [];
  List<bool> _cardUp = [];
  bool _isSortCard = false;
  bool _isOneAcceptCard = false;
  List _isAcceptCardList = [0,0,0,0,0,0,0,0,0,0,0,0,0];
  List<int> _newIndexData = [];
  bool _isFilpCard= true;
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
  int _secondsRemaining = 30;
  Timer? _timer;
  Timer? _timerDown;
  int _totalDownCard = 0;
  int get playerCount => _playerCount;
  List<dynamic> _checkSetSequence = [];
  List<dynamic> _reArrangeData = [];
  int get countDown => _countDown;
  int get stopCountDown => _stopCountDown;
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
  List get acceptCardListIndex => _acceptCardListIndex;
  List get cardUp => _cardUp;
  bool get isSortCard => _isSortCard;
  bool get isFilpCard => _isFilpCard;
  bool get isOneAcceptCard => _isOneAcceptCard;
  List get isAcceptCardList => _isAcceptCardList;
  List<Map<String,dynamic>> get cardList => _cardList;
  int get secondsRemaining => _secondsRemaining;
  int get totalDownCard => _totalDownCard;
  List<dynamic> get checkSetSequence => _checkSetSequence;
  List<int> get newIndexData => _newIndexData;
  List get reArrangeData => _reArrangeData;


  void dropCard(Map<String,dynamic> data) async {
    print('Drop Card :-   $data');
    Sockets.socket.emit("drop","$data");
    print("*** DROP EMIT ***");
  }

  setNewData(int value){
    _newIndexData.add(value);

  }

  setNewRemoveData(){
    _newIndexData.clear();
    notifyListeners();
  }

  setPlayerCount(int value){
    _playerCount  = value;
    notifyListeners();
  }

  setNewRemoveIndex(int index){
    _newIndexData.removeAt(index);
    print('Rummy Provider Data :-   ${_newIndexData.length}');
    notifyListeners();
  }


  setRomoveAndIndexData(int newIndex,int oldIndex){
    final itemCard = _newIndexData.removeAt(oldIndex);
    _newIndexData.insert(newIndex, itemCard);
    _reArrangeData.clear();

    for(int i=0;i<_newIndexData.length;i++){

      for(int j=0;j < _cardList.length;j++){
        if(_newIndexData[i] == j){
          _reArrangeData.add(_cardList[j -1]);
        }
      }
    }
    rearrangeData(_reArrangeData);
    checkSetSequenceData(_reArrangeData);

    notifyListeners();
  }

  void checkSetSequenceData(List<dynamic> checkData) async {
    Sockets.socket.emit("check set sequences",jsonEncode(checkData));
    Sockets.socket.on("check set sequences", (data) {
      print("^^^^ DATA ^^^^ $data");
    });
  }

  void rearrangeData(List rearrange)async{
    print("*** RE-ARRANGE *** ${jsonEncode(rearrange)}");
    Sockets.socket.emit("re arrange","${jsonEncode(rearrange)}");
    print("*** RE-ARRANGE ***");
  }

  void setSequenceData(List<dynamic> data){
    _checkSetSequence = data;
    print('New Data   :_   ${_checkSetSequence}');
    notifyListeners();
  }

  setDropOneCard(int value){
    _isDropOneCard = value;
    notifyListeners();
  }

  setFilpCard(bool value){
    _isFilpCard = value;
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

  setOneAcceptCardList(int value,int index){
    _isAcceptCardList[index] = value;
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

  setOneAcceptCard(bool value){
    _isOneAcceptCard = value;
    notifyListeners();
  }

  setCardListIndex(int value){
    _cardListIndex.add(value);
    notifyListeners();
  }

  setAcceptListIndex(int value){
    _acceptCardListIndex.add(value);
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

  setCountDown(int count){
    _countDown = count;
    notifyListeners();

    if(count == 0){
      _stopCountDown = 0;
      notifyListeners();
    }
  }

  startTimer(BuildContext context,{int secondsRemaining=30}) {
    _secondsRemaining=secondsRemaining;
    notifyListeners();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (_secondsRemaining != 0) {
        _secondsRemaining--;
        notifyListeners();
      } else {
        initTimer();
        closeTimer();
        notifyListeners();
      }
    });
  }

  setTotalDownCard(int value){
    _totalDownCard=value;
    notifyListeners();
  }

  closeTimer(){
    _timer?.cancel();
  }

  void initTimer(){
    _secondsRemaining = 30;
    notifyListeners();
  }


}