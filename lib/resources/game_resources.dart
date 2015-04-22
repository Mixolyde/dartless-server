part of dartless_server;

@app.Route("/games")
Map getGamesList(){
  //TODO pull list of games from global location
  return {};
}

@app.Route("/games", methods: const [app.POST])
Map createGame() { 
  //TODO allow more than one game
  //TODO store game in global location
  var gameId = 1;
  return {"$gameId" : "Created gameId: $gameId"};
}
        
@app.Route("/games/:gameId")
Map getGameData(int gameId) => 
    //TODO pull data for game id from global
    {"$gameId" : GameSupervisor.getGame().toMap()};

@app.Route("/games/:gameId/start", methods: const [app.PUT])
Map startGame(int gameId) => 
    //TODO start game if it has valid players
    {"error" : "Error starting gameId: $gameId. Not enough players."};
    
@app.Route("/games/:gameId/player/:playerName", methods: const [app.PUT])
Map addPlayer(int gameId, String playerName) => 
    {"$gameId" : "Added $playerName to gameId: $gameId"};
    
exampleGameJSON() => JSON.decode("""
      {"gameId":1,
      "board":{"knife":"3,3","candlestick":"4,5","pipe":"4,5"},
      "move_state":{"player":"scarlett","phase":"move|suggestion|accusation|choose_card_to_show"},
      "players":[
      {"name":"Brian","character":"mustard","active":true,"cards":["knife","dining","plum"],"position":"1,1"},
      {"name":"John","character":"white","active":false,"cards":["candlestick","pool"],"position":"1,3"}],
      "winner":"mustard"}
      """);
    
