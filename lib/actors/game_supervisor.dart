part of dartless_server;

//TODO create singleton getter for game_actor sendPort

class GameSupervisor{
  static SendPort _gamePort;
  
  static GameData _serverGame = new GameData.newGame();
  
  static SendPort getGameActor(){
    if (_gamePort == null){
      log("gamePort is null, spawning actor");
      var response = new ReceivePort();
      Future<Isolate> remote = 
          Isolate.spawn(game_actor, response.sendPort);
      
      remote.then((actor){
        log("remote returned actor");
        _gamePort = actor.controlPort;
        
      });
      
    }
    log("Returning game actor control port $_gamePort");
    return _gamePort;

  }
  
  static GameData getGame(){
    return _serverGame;
  }
  
}
