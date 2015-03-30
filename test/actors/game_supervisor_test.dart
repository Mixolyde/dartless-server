library game_supervisor_test;

import 'dart:async';
import 'dart:isolate';
import 'package:unittest/unittest.dart';

import 'package:dartless_server/dartless_server.dart';

void main() {

  supervisorTests();
}

void supervisorTests() {
  group('game actor', () {
    test('send get game status message to new game data actor', () {
      
      sendReceive(GameSupervisor.getGameActor(), const GetGameData())
      .then((msg) {
        print("game actor unit test received: $msg");
        expect(msg, containsPair("winner", "mustard"));
        
      });
    });
  });

}

Future sendReceive(SendPort port, msg) {
  ReceivePort response = new ReceivePort();
  port.send([msg, response.sendPort]);
  return response.first;
}