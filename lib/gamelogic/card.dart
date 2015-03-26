part of dartless_server;


abstract class Card {
  const Card();
}

class Character extends Card {
  final String character; 
  
  const Character._(this.character);
  
  static final Character SCARLET =
      const Character._("SCARLET");
  static final Character MUSTARD =
      const Character._("MUSTARD");
  static final Character WHITE =
      const Character._("WHITE");
  static final Character GREEN =
      const Character._("GREEN");
  static final Character PEACOCK =
      const Character._("PEACOCK");
  static final Character PLUM =
      const Character._("PLUM");  
}

class Room extends Card {
  final String room;
  
  const Room._(this.room);
  
  static final Room HALL =
      const Room._("HALL");
  static final Room STUDY =
      const Room._("STUDY");
  static final Room LIBRARY =
      const Room._("LIBRARY");
  static final Room CONSERVATORY =
      const Room._("CONSERVATORY");
  static final Room BALLROOM =
      const Room._("BALLROOM");
  static final Room BILLIARDROOM =
      const Room._("BILLIARDROOM");
  static final Room LOUNGE =
      const Room._("LOUNGE");
  static final Room DININGROOM =
      const Room._("DININGROOM");
  static final Room KITCHEN =
      const Room._("KITCHEN");
}

class Weapon extends Card {
  final String weapon;
  const Weapon._(this.weapon);
  static final Weapon KNIFE =
      const Weapon._("KNIFE");
  static final Weapon CANDLESTICK =
      const Weapon._("CANDLESTICK");
  static final Weapon PIPE =
      const Weapon._("PIPE");
  static final Weapon PISTOL =
      const Weapon._("PISTOL");
  static final Weapon ROPE =
      const Weapon._("ROPE");
  static final Weapon POISON =
      const Weapon._("POISON");
}

class WinningCards{
  final Room room; 
  final Weapon weapon; 
  final Character character;
  WinningCards(this.room, this.weapon, this.character);
}

List<Card> newDeck(){
  List<Card> cards = [];

  cards.add(Character.SCARLET);
  cards.add(Character.MUSTARD);
  cards.add(Character.WHITE);
  cards.add(Character.GREEN);
  cards.add(Character.PEACOCK);
  cards.add(Character.PLUM);
    
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
  
  return cards;
}

List<Card> gameDeck(WinningCards winners){
  List<Card> cards;
  
  cards.removeAt(cards.indexOf(winners.room));
  cards.removeAt(cards.indexOf(winners.weapon));
  cards.removeAt(cards.indexOf(winners.character));
  
  return cards;
}
