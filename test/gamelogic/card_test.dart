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
      WinningCards winners = new WinningCards(Room.BALL_ROOM, 
          Weapon.CANDLESTICK, Character.GREEN);

      List<Card> testDeck = gameDeck(winners);
      
      expect(testDeck.length, equals(18));
      expect(testDeck, contains(Room.HALL));
      expect(testDeck, contains(Weapon.POISON));
      expect(testDeck, contains(Character.PLUM));
      expect(testDeck, isNot(contains(Room.BALL_ROOM)));
      expect(testDeck, isNot(contains(Weapon.CANDLESTICK)));
      expect(testDeck, isNot(contains(Character.GREEN)));
    });
    test('two game decks are shuffled differently', () {
      WinningCards winners = new WinningCards(Room.BALL_ROOM, 
          Weapon.CANDLESTICK, Character.GREEN);

      List<Card> testDeck = gameDeck(winners);
      List<Card> testDeck2 = gameDeck(winners);

      bool sameOrder = true;
      for(var index=0; index < testDeck.length; index++){
        if(testDeck[index] != testDeck2[index]) {
          sameOrder = false;
          break;
        }
      }
      expect(sameOrder, isFalse);
    });
    
  });
}

