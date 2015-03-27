part of dartless_server;

abstract class BoardLocation {
  const BoardLocation();
}

class Hallway extends BoardLocation {
  final Board_Room room1;
  final Board_Room room2;
  Hallway(this.room1, this.room2);
}

class Board_Room extends BoardLocation {
  final Room room;
  const Board_Room._(this.room);
  static final Board_Room HALL =
    const Board_Room._(Room.HALL);
  static final Board_Room STUDY =
    const Board_Room._(Room.STUDY);
  static final Board_Room LIBRARY =
    const Board_Room._(Room.LIBRARY);
  static final Board_Room CONSERVATORY =
    const Board_Room._(Room.CONSERVATORY);
  static final Board_Room BALL_ROOM =
    const Board_Room._(Room.BALL_ROOM);
  static final Board_Room BILLIARD_ROOM =
    const Board_Room._(Room.BILLIARD_ROOM);
  static final Board_Room LOUNGE =
    const Board_Room._(Room.LOUNGE);
  static final Board_Room DINING_ROOM =
    const Board_Room._(Room.DINING_ROOM);
  static final Board_Room KITCHEN =
    const Board_Room._(Room.KITCHEN);    
}

class Passage{
  final Board_Room room1;
  final Board_Room room2;
  Passage(this.room1, this.room2);
  
  
  
}

abstract class Board {
  static const List<Character> TURN_ORDER = [SCARLET, MUSTARD, WHITE, GREEN, PEACOCK, PLUM];
  
  static const Set<Passage> ALL_PASSAGES = new Set(
    new Passage(Board_Room.STUDY, Board_Room.KITCHEN),
    new Passage(Board_Room.CONSERVATORY, Board_Room.LOUNGE));
    
  static const Set<Passage> ALL_HALLWAYS = new Set(
    new Hallway(Board_Room.STUDY, Board_Room.HALL),
    new Hallway(Board_Room.HALL, Board_Room.LOUNGE));
    
  //starting locations
  static const  Map[Character, Hallway] START_LOCATIONS = {
    Character.SCARLET : Hallway(Board_Room.HALL, Board_Room.LOUNGE),
    Character.MUSTARD : Hallway(Board_Room.LOUNGE, Board_Room.DINING_ROOM),
    Character.WHITE   : Hallway(Board_Room.BALL_ROOM, Board_Room.KITCHEN),
    Character.GREEN   : Hallway(Board_Room.CONSERVATORY, Board_Room.BALL_ROOM),
    Character.PEACOCK : Hallway(Board_Room.LIBRARY, Board_Room.CONSERVATORY),
    Character.PLUM    : Hallway(Board_Room.STUDY, Board_Room.LIBRARY)
  }
}
