part of dartless_server;

abstract class BoardLocation {}

class Hallway extends BoardLocation {
  Room room1;
  Room room2;
  Hallway(this.room1, this.room2);
}

class Board_Room extends BoardLocation {
  Room room;
  Board_Room(this.room);
}

class Passage{
  Room room1;
  Room room2;
  Passage(this.room1, this.room2);
}
