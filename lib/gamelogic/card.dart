part of dartless_server;

enum Character_Enum {SCARLET, MUSTARD, WHITE, GREEN, PEACOCK, PLUM}
enum Room_Enum {HALL, STUDY, LIBRARY, CONSERVATORY, BALL_ROOM,
  BILLIARD_ROOM, LOUNGE, DINING_ROOM, KITCHEN}
enum Weapon_Enum {KNIFE, CANDLESTICK, PIPE, PISTOL, ROPE, POISON }

abstract class Card {}

class Character extends Card {
  Character_Enum character;
  Character(this.character);
}

class Room extends Card {
  Room_Enum room;
  Room(this.room);
}

class Weapon extends Card {
  Weapon_Enum weapon;
  Weapon(this.weapon);
}

class WinningCards{
  Room room; Weapon weapon; Character character;
  WinningCards(this.room, this.weapon, this.character);
}

List<Card> newDeck(){
  List<Card> cards = [];

  for(var room in Room_Enum.values){
    cards.add(new Room(room));
  }
  
  for(var weapon in Weapon_Enum.values){
    cards.add(new Weapon(weapon));
  }
  
  for(var char in Character_Enum.values){
    cards.add(new Character(char));
  }
  
  return cards;
}

List<Card> gameDeck(WinningCards winners){
  List<Card> cards;
  
  cards.removeAt(cards.indexOf(winners.room));
  cards.removeAt(cards.indexOf(winners.weapon));
  cards.removeAt(cards.indexOf(winners.character));
  
  return cards;
}
