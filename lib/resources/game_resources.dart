part of dartless_server;

@app.Route("/games")
Map getGamesList() => 
    {1 : "List of games."};
    
@app.Route("/games/:gameId")
Map getGameData(int gameId) => 
    {gameId : "Data for gameId: " + gameId.toString()};

@app.Route("/games/:gameId/start", methods: const [app.PUT])
Map startGame(int gameId) => 
    {gameId : "Starting gameId: " + gameId.toString()};