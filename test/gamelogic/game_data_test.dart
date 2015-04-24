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
      data.startGame();
      
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
      expect(data.moveState.phase, equals(MovePhase.MOVE));
      expectRunningGame(data);
    });
    test('six players', () {
      var data = new GameData.newGame();
      for (var i = 1; i < 7; i++) {
        data.addPlayer("Test Player: $i");
        expect(data.players.keys.length, equals(i));
      }
      data.startGame();
      expect(data.moveState.phase, equals(MovePhase.MOVE));
      expectRunningGame(data);
      
      expect(data.moveState.character, equals(Character.SCARLET));
    });

  });
}

void expectNewGame(GameData data){
  expect(data.state, equals(GameState.NEW));
  expect(data.players.keys.length, equals(0));
  expect(data.winner, isNull);
  expect(data.moveState, isNull);  
}

void expectRunningGame(GameData data){
  expect(data.state, equals(GameState.PLAYING));
  expect(data.players.keys.length, greaterThan(1));
  expectAllCardsDealt(data);
  
}

void expectAllCardsDealt(GameData data){
  int cardCount = 0;
  Set<Card> dealtCards = new Set<Card>();
  for(var player in data.players.values){
    cardCount += player.hand.length;
    dealtCards.addAll(player.hand);
  }
  
  expect(cardCount, equals(18));
  expect(dealtCards.length, equals(18));
}
