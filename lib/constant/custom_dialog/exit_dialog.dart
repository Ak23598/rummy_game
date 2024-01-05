import 'package:card_game_serve_and_flip_animation/provider/socket_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExitDialog {
  final String title;
  final String message;
  final String rightButton;
  final VoidCallback onTapRightButton;
  final String leftButton;
  final VoidCallback onTapLeftButton;

  ExitDialog({
    required this.title,
    required this.message,
    required this.rightButton,
    required this.onTapRightButton,
    required this.leftButton,
    required this.onTapLeftButton,
  });

  show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return _PopupCall(
            title: title,
            message: message,
            leftButton: leftButton,
            rightButton: rightButton,
            onTapLeftButton: onTapLeftButton,
            onTapRightButton: onTapRightButton);
      },
    );
  }
}

class _PopupCall extends StatefulWidget {
  final String title;
  final String message;
  final String rightButton;
  final VoidCallback onTapRightButton;
  final String leftButton;
  final VoidCallback onTapLeftButton;

  const _PopupCall(
      {Key? key,
        required this.title,
        required this.message,
        required this.rightButton,
        required this.onTapRightButton,
        required this.leftButton,
        required this.onTapLeftButton})
      : super(key: key);
  @override
  _PopupCallState createState() => _PopupCallState();
}

class _PopupCallState extends State<_PopupCall> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      backgroundColor: Colors.black87,
      titlePadding: EdgeInsets.all(0),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Align(
              alignment: Alignment.topRight,
              child:Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/r_image/cancelBack.png',height: 30,width: 30,),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              )

          ),
          Center(
            child: Text(widget.title,
                style: TextStyle(
                  fontFamily: 'TTNorms',
                  fontWeight: FontWeight.bold,
                  wordSpacing: 0,
                  letterSpacing: 0,
                  fontSize: 25,
                  color: Colors.yellow,
                )),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'TTNorms',
              fontWeight: FontWeight.w400,
              wordSpacing: 0,
              letterSpacing: 0,
              fontSize: 15,
              color: Colors.yellow,
            ),
          ),
        ],
      ),
      actions: [
        if (widget.leftButton != null)
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<SocketProvider>(context,listen: false).disconnectSocket(context);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow, width: 2.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          'Exit Game'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: 'TTNorms',
                            fontWeight: FontWeight.bold,
                            wordSpacing: 0,
                            letterSpacing: 0,
                            fontSize: 15,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10.0,
                  left: 10,
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Cancel'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: 'TTNorms',
                            fontWeight: FontWeight.bold,
                            wordSpacing: 0,
                            letterSpacing: 0,
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],)
      ],
    );
  }
}