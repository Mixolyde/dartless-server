part of dartless_server;

class GameData {
  var players = new Map<Character, PlayerData>();
  String winner = null;
  MoveState moveState = null;
  
  GameData(this.players, this.moveState);
}

var players: Map[Character, PlayerData] = Map()
var winner: Option[String] = None
var moveState: Option[MoveState] = None


case class PlayerData {
  final String name;
  final Set<Card> hand;
  
  BoardLocation boardLocation;
  
  PlayerData(this.name, this.hand, this.boardLocation);
}

enum MovePhase {MOVE, SUGGESTION, ACCUSATION, CHOOSE_CARD}

class MoveState {
  Character character;
  MovePhase phase;
  MoveState(this.character, this.phase);
}
