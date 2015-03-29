library game_actor_test;

import 'dart:async';
import 'dart:isolate';
import 'package:unittest/unittest.dart';

import 'package:dartless_server/dartless_server.dart';


void main() {

  serverTests();
}

void serverTests() {
  group('game actor', () {
    test('create new game data actor', () {
      var response = new ReceivePort();
      Future<Isolate> remote = 
          Isolate.spawn(game_actor, response.sendPort);
      
      remote.then((_) => response.first).then((sendPort) {
        sendReceive(sendPort, "unit test message").then((msg) {
          print("game actor unit test received: $msg");
          expect(msg, equals("1"));
          
        });
      });
    });
    test('send get game status message to new game data actor', () {
      var response = new ReceivePort();
      Future<Isolate> remote = 
          Isolate.spawn(game_actor, response.sendPort);
      
      remote.then((_) => response.first).then((sendPort) {
        sendReceive(sendPort, const GetGameData()).then((msg) {
          print("game actor unit test received: $msg");
          expect(msg, containsPair("winner", "mustard"));
          
        });
      });
    });
    test('kill a new game data actor', () {
      var response = new ReceivePort();
      Future<Isolate> remote = 
          Isolate.spawn(game_actor, response.sendPort);
      
      remote.then((_) => response.first).then((sendPort) {
        sendReceive(sendPort, const EndGame()).then((msg) {
          print("game actor unit test received: $msg");
          expect(msg, contains("1"));
          expect(msg, contains("Ending Game"));
          
        });
      });
    });
  });
}

Future sendReceive(SendPort port, msg) {
  ReceivePort response = new ReceivePort();
  port.send([msg, response.sendPort]);
  return response.first;
}
