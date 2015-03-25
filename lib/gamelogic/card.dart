part of dartless_server;

enum Character {SCARLET, MUSTARD, WHITE, GREEN, PEACOCK, PLUM}
enum Room {HALL, STUDY, LIBRARY, CONSERVATORY, BALL_ROOM,
  BILLIARD_ROOM, LOUNGE, DINING_ROOM, KITCHEN}
enum Weapon {KNIFE, CANDLESTICK, PIPE, PISTOL, ROPE, POISON }

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
  List<Weapon> weapons = Weapon.values;
  List<Character> chars = Character.values;
  
  for(var room in rooms){
    cards.add(new Room_Card(room));
  }
  
  for(var weapon in weapons){
    cards.add(new Weapon_Card(weapon));
  }
  
  for(var char in chars){
    cards.add(new Character_Card(char));
  }
  
  return cards;
}
