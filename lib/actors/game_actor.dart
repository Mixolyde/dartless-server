part of dartless_server;

void game_actor(SendPort initialReplyTo) {
  final GameData gData = new GameData.newGame();
  final num gameId = 1;
  
  var port = new ReceivePort();
  initialReplyTo.send(port.sendPort);
  
  port.listen((msg) {
    var data = msg[0];
    SendPort replyTo = msg[1];
    
    log("Game Actor $gameId received message: $data");
    
    replyTo.send(gameId.toString());
    
  });
}