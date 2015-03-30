/// The dartless_server library.
library dartless_server;

import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'dart:math';
import 'package:redstone/server.dart' as app;

//actor concurrenct parts
part 'actors/game_actor.dart';
part 'actors/game_supervisor.dart';

//game logic parts
part 'gamelogic/board.dart';
part 'gamelogic/card.dart';
part 'gamelogic/game_data.dart';

//route resource parts
part 'resources/game_resources.dart';
part 'resources/move_resources.dart';

@app.Route("/")
helloWorld() => "Welcome to the dartless server!";

@app.Route('/serverStatus')
Map getServerStatus()
{
  Map statusMap = {};
  try
  {
    statusMap['running'] = true;
  }
  catch(e){log("Error getting server status: $e");}
  return statusMap;
}

void log(String message)
{
  print("(${new DateTime.now().toString()}) $message");
}

Random _random;
 
Random getServerRandom(){
  if (_random == null){
    var seed = new DateTime.now().millisecondsSinceEpoch;
    _random = new Random(seed);
  }
  
  return _random;
  
}

