part of dartless_server;

@app.Route("/games/:gameId/move", methods: const [app.GET])
Map getMoves(int gameId) => 
    {gameId : "Getting moves for gameId: " + gameId.toString()};
    
@app.Route("/games/:gameId/move", methods: const [app.PUT])
Map submitMove(int gameId) => 
    {gameId : "Sending move for gameId: " + gameId.toString()};