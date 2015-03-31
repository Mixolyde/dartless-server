library game_data_test;

void main() {
  group('new game data tests', () {
    test('new game data values', () {
      var data = GameData.newGame();
      
      expect(data.state, equals(GameState.NEW));
      expect(data.players.keys.length, equals(0));
      expect(data.winner, isNull);
      expect(data.moveState, isNull);
    });
  });

}
