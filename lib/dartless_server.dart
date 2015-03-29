/// The dartless_server library.
library dartless_server;

import 'package:redstone/server.dart' as app;
import 'dart:convert';
import 'dart:isolate';
import 'dart:math';

//actor concurrenct parts
part 'actors/game_actor.dart';

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

