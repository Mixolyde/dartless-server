library game_data_test;

import 'package:unittest/unittest.dart';
import 'package:dartless_server/dartless_server.dart';

void main() {
  group('new game data tests', () {
    test('new game data values', () {
      var data = new GameData.newGame();
      expectNewGame(data);
    });
    test('new game data values after reset', () {
      var data = new GameData.newGame();
      data.addPlayer("name1");
      data.addPlayer("name2");
      data.addPlayer("name3");
      data.resetGame();
      expectNewGame(data);
    });
  });
  
  group('add player data tests', () {
    test('add six new players', () {
      var data = new GameData.newGame();
      for (var i = 1; i < 7; i++) {
        data.addPlayer("Test Player: $i");
        expect(data.players.keys.length, equals(i));
      }
    });
    test('ignore after six players', () {
      var data = new GameData.newGame();
      for (var i = 1; i < 8; i++) {
        data.addPlayer("Test Player: $i");
      }
      
      expect(data.players.keys.length, equals(6));

    });

  });
  
  group('start game data tests', () {
    test('two players', () {
      var data = new GameData.newGame();
      for (var i = 1; i < 3; i++) {
        data.addPlayer("Test Player: $i");
        expect(data.players.keys.length, equals(i));
      }
      data.startGame();
      //TODO test data 
    });
    test('six players', () {
      var data = new GameData.newGame();
      for (var i = 1; i < 7; i++) {
        data.addPlayer("Test Player: $i");
        expect(data.players.keys.length, equals(i));
      }
      data.startGame();
      //TODO test data 
    });

  });
}

void expectNewGame(GameData data){
  expect(data.state, equals(GameState.NEW));
  expect(data.players.keys.length, equals(0));
  expect(data.winner, isNull);
  expect(data.moveState, isNull);  
}
