part of dartless_server;

enum Character {SCARLET, MUSTARD, WHITE, GREEN, PEACOCK, PLUM}
enum Room {HALL, KITCHEN}
enum Weapon {KNIFE}

abstract class Card {}

class Character_Card extends Card {
  Character character;
  Character_Card(this.character);
}

class Room_Card extends Card {
  Room room;
  Room_Card(this.room);
}

class Weapon_Card extends Card {
  Weapon weapon;
  Weapon_Card(this.weapon);
}

List<Card> newDeck(){
  List<Card> cards = [];
  List<Room> rooms = Room.values;
  
  
  return cards;
}