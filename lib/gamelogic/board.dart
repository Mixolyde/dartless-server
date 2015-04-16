part of dartless_server;

// The board is a 5x5 grid, setup like this:
//   1 2 3 4 5      X Direction
// 1 R H R H R
// 2 H   H   H
// 3 R H R H R
// 4 H   H   H
// 5 R H R H R
// Y Direction

// Where Rs are rooms, and Hs are Hallways
// A room can contain any number of players, but Hallways can only hold one
// Board_Rooms have a name and x,y pair
// Hallways have two Board_Rooms and an x,y pair
// Passages connect the corner Board_Rooms, but are not locations on the board

abstract class BoardLocation {
  const BoardLocation(this.x, this.y);
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
  
  static const List<Board_Room> ALL_ROOMS = const [
    Board_Room.STUDY, Board_Room.KITCHEN,
    Board_Room.HALL, Board_Room.LIBRARY,
    Board_Room.BALL_ROOM, Board_Room.BILLIARD_ROOM,
    Board_Room.DINING_ROOM,
    Board_Room.CONSERVATORY, Board_Room.LOUNGE];
    
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
