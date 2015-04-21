part of dartless_server;

// The board is a 5x5 grid, setup like this:
//   1 2 3 4 5      X Direction
// 1 R H R H R      Study, Hall, Lounge
// 2 H   H   H
// 3 R H R H R      Library, Billiard, Dining
// 4 H   H   H
// 5 R H R H R      Consveratory, Ballroom, Kitchen
// Y Direction

// Where Rs are rooms, and Hs are Hallways
// A room can contain any number of players, but Hallways can only hold one
// Board_Rooms have a name and x,y pair
// Hallways have two Board_Rooms and an x,y pair
// Passages connect the corner Board_Rooms, but are not locations on the board

abstract class BoardLocation {
  final int x;
  final int y;
  const BoardLocation(this.x, this.y);
}

class Hallway extends BoardLocation {
  const Hallway(x, y) : super(x, y);
  
  String toString() => "Hallway at ($x, $y)";
}

class Board_Room extends BoardLocation {
  final Room room;
  const Board_Room._(x, y, this.room) : super(x, y);
  static const Board_Room HALL =
    const Board_Room._(1, 1, Room.HALL);
  static const Board_Room STUDY =
    const Board_Room._(1, 1, Room.STUDY);
  static const Board_Room LIBRARY =
    const Board_Room._(1, 1, Room.LIBRARY);
  static const Board_Room CONSERVATORY =
    const Board_Room._(1, 1, Room.CONSERVATORY);
  static const Board_Room BALL_ROOM =
    const Board_Room._(1, 1, Room.BALL_ROOM);
  static const Board_Room BILLIARD_ROOM =
    const Board_Room._(1, 1, Room.BILLIARD_ROOM);
  static const Board_Room LOUNGE =
    const Board_Room._(1, 1, Room.LOUNGE);
  static const Board_Room DINING_ROOM =
    const Board_Room._(1, 1, Room.DINING_ROOM);
  static const Board_Room KITCHEN =
    const Board_Room._(1, 1, Room.KITCHEN);    
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
    
  static const List<Hallway> ALL_HALLWAYS = const [
    const Hallway(2, 1),
    const Hallway(4, 1),
    const Hallway(1, 2),
    const Hallway(3, 2),
    const Hallway(5, 2),
    const Hallway(2, 3),
    const Hallway(4, 3),
    const Hallway(1, 4),
    const Hallway(3, 4),
    const Hallway(5, 4)];
    
  //starting locations
  static const Map<Character, Hallway> START_LOCATIONS = const {
    Character.SCARLET : const Hallway(2, 1),
    Character.MUSTARD : const Hallway(2, 1),
    Character.WHITE   : const Hallway(2, 1),
    Character.GREEN   : const Hallway(2, 1),
    Character.PEACOCK : const Hallway(2, 1),
    Character.PLUM    : const Hallway(2, 1)
  };
  
  static Hallway getStart(Character char) => START_LOCATIONS[char];
}
