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
  
  static const Set<Passage> all = new Set(new Passage(Board_Room.STUDY, Board_Room.KITCHEN));
  
}

static const List<Character> TURN_ORDER = [SCARLET, MUSTARD, WHITE, GREEN, PEACOCK, PLUM];


