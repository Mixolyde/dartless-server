part of dartless_server;

//TODO create singleton getter for game_actor sendPort

class GameSupervisor{
  static SendPort gamePort;
  
  static SendPort getGameActor(){
    if (gamePort == null){
      log("gamePort is null, spawning actor");
      var response = new ReceivePort();
      Future<Isolate> remote = 
          Isolate.spawn(game_actor, response.sendPort);
      
      remote.then((actor){
        log("remote returned actor");
        gamePort = actor.controlPort;
        
      });
      
    }
    log("Returning game actor control port $gamePort");
    return gamePort;

  }
  
}