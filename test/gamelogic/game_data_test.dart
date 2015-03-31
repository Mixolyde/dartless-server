library game_data_test;

import 'package:unittest/unittest.dart';
import 'package:dartless_server/dartless_server.dart';

void main() {
  group('new game data tests', () {
    test('new game data values', () {
      var data = new GameData.newGame();
      expectNewGame(GameData data);
    });
  });

}

void expectNewGame(GameData data){
  expect(data.state, equals(GameState.NEW));
  expect(data.players.keys.length, equals(0));
  expect(data.winner, isNull);
  expect(data.moveState, isNull);  
}
