part of dartless_server;

void game_actor(SendPort initialReplyTo) {
  final GameData gData = new GameData.newGame();
  final int gameId = 1;
  
  var port = new ReceivePort();
  initialReplyTo.send(port.sendPort);
  
  port.listen((msg) {
    var data = msg[0];
    SendPort replyTo = msg[1];
    
    log("Game Actor $gameId received message: $data");
    
    if(data is GetGameData){
      replyTo.send(gData.toJSON());
    }
    else if (data is NewPlayer){
      gData.addPlayer(data.username);
      
    } 
    else if (data is EndGame){
      //TODO close ports and end isolate
      replyTo.send([gameId.toString(), "Ending Game"]);
      Isolate.current.kill();
    } 
    else {
      replyTo.send(gameId.toString());
    }
    
  });
}

class NewPlayer{
  final String username;
  const NewPlayer(this.username);
}

class GetGameData {
  const GetGameData();
}

class EndGame {
  const EndGame();
}