library card_test;

import 'package:unittest/unittest.dart';

import 'package:dartless_server/dartless_server.dart';

void main() {
  
  group('deck tests', () {
    test('new deck', () {
      List<Card> testDeck = newDeck();
      expect(testDeck.length, equals(21));
      expect(testDeck, contains(Room.HALL));
      expect(testDeck, contains(Weapon.POISON));
      expect(testDeck, contains(Character.PLUM));
    });
    test('game deck has winning cards removed', () {
      WinningCards winners = new WinningCards(Room.BALLROOM, 
          Weapon.CANDLESTICK, Character.GREEN);

      List<Card> testDeck = gameDeck(winners);
      
      expect(testDeck.length, equals(18));
      expect(testDeck, contains(Room.HALL));
      expect(testDeck, contains(Weapon.POISON));
      expect(testDeck, contains(Character.PLUM));
      expect(testDeck, isNot(contains(Room.BALLROOM)));
      expect(testDeck, isNot(contains(Weapon.CANDLESTICK)));
      expect(testDeck, isNot(contains(Character.GREEN)));
    });
  });
}