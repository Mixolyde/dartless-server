library game_resources_test;

import 'dart:convert';
import 'package:redstone/mocks.dart';
import 'package:redstone/server.dart' as app;
import 'package:unittest/unittest.dart';

import 'package:dartless_server/dartless_server.dart';


void main() {
  //load handlers in server library
  setUp(() => app.setUp([#dartless_server]));

  //remove all loaded handlers
  tearDown(() => app.tearDown());
  
  serverTests();
}

void serverTests() {
  group('GET game route tests', () {
    test('GET empty game list', () {
      //create a mock request
      var req = new MockRequest("/games");
      //dispatch the request
      return app.dispatch(req).then((resp) {
        //verify the response
        expect(resp.statusCode, equals(200));
        var content = JSON.decode(resp.mockContent);
        expect(content, isEmpty);
      });
    });
    test('GET game 1', () {
      //create a mock request
      var req = new MockRequest("/games/1");
      //dispatch the request
      return app.dispatch(req).then((resp) {
        //verify the response
        expect(resp.statusCode, equals(200));
        var content = JSON.decode(resp.mockContent);
        expect(content, contains("1"));
        print("test game content: $content");
        
        var gameData = content["1"];
        expect(gameData, isNotNull);
        expect(gameData, containsPair("winner", "mustard"));
        
      });
    });
  });
  group('PUT game route tests', () {
    test('PUT game start no players', () {
      //create a mock request
      var req = new MockRequest("/games/1/start", method: app.PUT);
      //dispatch the request
      return app.dispatch(req).then((resp) {
        //verify the response
        expect(resp.statusCode, equals(200));
        var content = JSON.decode(resp.mockContent);
        expect(content, 
            containsPair("error", 
                         "Error starting gameId: 1. Not enough players."));
      });
    });
    test('Put player Brian', () {
      //create a mock request
      var req = new MockRequest("/games/1/player/Brian", method: app.PUT);
      //dispatch the request
      return app.dispatch(req).then((resp) {
        //verify the response
        expect(resp.statusCode, equals(200));
        var content = JSON.decode(resp.mockContent);
        expect(content, contains("1"));
        expect(content, 
            containsPair("1", 
                         "Added Brian to gameId: 1"));
      });
    });
  });
}