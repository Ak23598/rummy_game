import 'package:card_game_serve_and_flip_animation/constant/socket_constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class Sockets{

  static IO.Socket socket = IO.io('${SocketConstant.socketUrl}${SocketConstant.user2}',
      OptionBuilder()
          .setTransports(['websocket']).build());

  static void connectAndListen(){

print("socket connect and listen ");
    if(socket.connected){
      socket.emit('initializeGame', "game1");
      print("socket connected");
    }else{
      print("not connected");
      socket.connect();
    }
    socket.onConnect((_) {
      print("on connect");
      socket.emit('initializeGame', "game1");
    });

    socket.onDisconnect((_) {
      print('disconnect  ${_}');
    });
    socket.onError((data) {
      print('error  ${data.toString()}');
    });




  }

}