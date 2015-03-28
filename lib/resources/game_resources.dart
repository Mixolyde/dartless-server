part of dartless_server;

@app.Route("/games")
Map getGamesList() => 
    //TODO pull list of games from global location
    {1 : "List of games."};

@app.Route("/games", methods: const [app.POST])
Map createGame() { 
  //TODO allow more than one game
  //TODO store game in global location
  var gameId = 1;
  return {gameId : "Created gameId: " + gameId.toString()};
}
        
@app.Route("/games/:gameId")
Map getGameData(int gameId) => 
    //TODO pull data for game id from global
    {gameId : "Data for gameId: " + gameId.toString()};

@app.Route("/games/:gameId/start", methods: const [app.PUT])
Map startGame(int gameId) => 
    //TODO start game if it has valid players
    {gameId : "Starting gameId: " + gameId.toString()};
    
@app.Route("/games/:gameId/player/:playerName", methods: const [app.PUT])
Map addPlayer(int gameId, String playerName) => 
    {gameId : "Adding $playerName to gameId: " + gameId.toString()};
    