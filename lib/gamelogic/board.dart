part of dartless_server;

abstract class BoardLocation {
  const BoardLocation();
}

class Hallway extends BoardLocation {
  final Board_Room room1;
  final Board_Room room2;
  const Hallway(this.room1, this.room2);
}

class Board_Room extends BoardLocation {
  final Room room;
  const Board_Room._(this.room);
  static const Board_Room HALL =
    const Board_Room._(Room.HALL);
  static const Board_Room STUDY =
    const Board_Room._(Room.STUDY);
  static const Board_Room LIBRARY =
    const Board_Room._(Room.LIBRARY);
  static const Board_Room CONSERVATORY =
    const Board_Room._(Room.CONSERVATORY);
  static const Board_Room BALL_ROOM =
    const Board_Room._(Room.BALL_ROOM);
  static const Board_Room BILLIARD_ROOM =
    const Board_Room._(Room.BILLIARD_ROOM);
  static const Board_Room LOUNGE =
    const Board_Room._(Room.LOUNGE);
  static const Board_Room DINING_ROOM =
    const Board_Room._(Room.DINING_ROOM);
  static const Board_Room KITCHEN =
    const Board_Room._(Room.KITCHEN);    
}

class Passage{
  final Board_Room room1;
  final Board_Room room2;
  const Passage(this.room1, this.room2);
 
}

abstract class Board {
  static const List<Character> TURN_ORDER = 
      const [Character.SCARLET, Character.MUSTARD, Character.WHITE, 
        Character.GREEN, Character.PEACOCK, Character.PLUM];
  
  static const List<Passage> ALL_PASSAGES = const [
  const Passage(Board_Room.STUDY, Board_Room.KITCHEN),
    const Passage(Board_Room.CONSERVATORY, Board_Room.LOUNGE)];
    
  static const List<Passage> ALL_HALLWAYS = const [
    const Hallway(Board_Room.STUDY, Board_Room.HALL),
    const Hallway(Board_Room.HALL, Board_Room.LOUNGE)];
    
  //starting locations
  static const Map<Character, Hallway> START_LOCATIONS = const {
    Character.SCARLET : const Hallway(Board_Room.HALL, Board_Room.LOUNGE),
    Character.MUSTARD : const Hallway(Board_Room.LOUNGE, Board_Room.DINING_ROOM),
    Character.WHITE   : const Hallway(Board_Room.BALL_ROOM, Board_Room.KITCHEN),
    Character.GREEN   : const Hallway(Board_Room.CONSERVATORY, Board_Room.BALL_ROOM),
    Character.PEACOCK : const Hallway(Board_Room.LIBRARY, Board_Room.CONSERVATORY),
    Character.PLUM    : const Hallway(Board_Room.STUDY, Board_Room.LIBRARY)
  };
  
  static Hallway getStart(Character char) => START_LOCATIONS[char];
}
