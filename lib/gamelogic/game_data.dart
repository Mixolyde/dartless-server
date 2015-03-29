part of dartless_server;

class GameData {
  var players = new Map<Character, PlayerData>();
  String winner = null;
  MoveState moveState = null;
  
  
  WinningCards winners = const WinningCards(
      Room.HALL,
      Weapon.KNIFE,
      Character.GREEN);
  
  GameData.newGame(){
    //TODO randomize winning cards
    
  }
  
  void addPlayer(String name){
    //TODO add new player to game
  }
  
  void startGame(){
    //TODO check for valid number of players
    
    //TODO initialize winning cards
    //TODO initialize player hands
    //TODO initialize player locations
    //TODO initialize initial move state
  }
  
  //TODO return real game data json
  toJSON() => exampleGameJSON();
}

class PlayerData {
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
