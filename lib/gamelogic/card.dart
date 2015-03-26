part of dartless_server;


abstract class Card {
  const Card();
}

enum Character_Enum {SCARLET, MUSTARD, WHITE, GREEN, PEACOCK, PLUM}
class Character extends Card {
  final Character_Enum character;
  
  const Character._(this.character);
  
  static final Character SCARLET =
      const Character._(Character_Enum.SCARLET);
  static final Character MUSTARD =
      const Character._(Character_Enum.MUSTARD);
  static final Character WHITE =
      const Character._(Character_Enum.WHITE);
  static final Character GREEN =
      const Character._(Character_Enum.GREEN);
  static final Character PEACOCK =
      const Character._(Character_Enum.PEACOCK);
  static final Character PLUM =
      const Character._(Character_Enum.PLUM);  
}

enum Room_Enum {HALL, STUDY, LIBRARY, CONSERVATORY, BALLROOM, BILLIARDROOM, LOUNGE, DININGROOM, KITCHEN}
class Room extends Card {
  final Room_Enum room;
  
  const Room._(Room_Enum this.room);
  
  static final Room HALL =
      const Room._(Room_Enum.HALL);
  static final Room STUDY =
      const Room._(Room_Enum.STUDY);
  static final Room LIBRARY =
      const Room._(Room_Enum.LIBRARY);
  static final Room CONSERVATORY =
      const Room._(Room_Enum.CONSERVATORY);
  static final Room BALLROOM =
      const Room._(Room_Enum.BALLROOM);
  static final Room BILLIARDROOM =
      const Room._(Room_Enum.BILLIARDROOM);
  static final Room LOUNGE =
      const Room._(Room_Enum.LOUNGE);
  static final Room DININGROOM =
      const Room._(Room_Enum.DININGROOM);
  static final Room KITCHEN =
      const Room._(Room_Enum.KITCHEN);
}

enum Weapon_Enum {KNIFE, CANDLESTICK, PIPE, PISTOL, ROPE, POISON }
class Weapon extends Card {
  final Weapon_Enum weapon;
  const Weapon._(this.weapon);
  static final Weapon KNIFE =
      const Weapon._(Weapon_Enum.KNIFE);
  static final Weapon CANDLESTICK =
      const Weapon._(Weapon_Enum.CANDLESTICK);
  static final Weapon PIPE =
      const Weapon._(Weapon_Enum.PIPE);
  static final Weapon PISTOL =
      const Weapon._(Weapon_Enum.PISTOL);
  static final Weapon ROPE =
      const Weapon._(Weapon_Enum.ROPE);
  static final Weapon POISON =
      const Weapon._(Weapon_Enum.POISON);
}

class WinningCards{
  final Room room; 
  final Weapon weapon; 
  final Character character;
  WinningCards(this.room, this.weapon, this.character);
}

List<Card> newDeck(){
  List<Card> cards = [];

  cards.add(Room.BALLROOM);
  cards.add(Room.BILLIARDROOM);
  cards.add(Room.CONSERVATORY);
  cards.add(Room.DININGROOM);
  cards.add(Room.HALL);
  cards.add(Room.KITCHEN);
  cards.add(Room.LIBRARY);
  cards.add(Room.LOUNGE);
  cards.add(Room.STUDY);
  
  cards.add(Weapon.CANDLESTICK);
  cards.add(Weapon.KNIFE);
  cards.add(Weapon.PIPE);
  cards.add(Weapon.PISTOL);
  cards.add(Weapon.POISON);
  cards.add(Weapon.ROPE);
  
  cards.add(Character.SCARLET);
  cards.add(Character.MUSTARD);
  cards.add(Character.WHITE);
  cards.add(Character.GREEN);
  cards.add(Character.PEACOCK);
  cards.add(Character.PLUM);
    
  return cards;
}

List<Card> gameDeck(WinningCards winners){
  List<Card> cards;
  
  cards.removeAt(cards.indexOf(winners.room));
  cards.removeAt(cards.indexOf(winners.weapon));
  cards.removeAt(cards.indexOf(winners.character));
  
  return cards;
}
