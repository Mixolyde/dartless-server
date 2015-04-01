part of dartless_server;

enum GameState {NEW, PLAYING, ENDED}

class GameData {
  var players = new Map<Character, PlayerData>();
  String winner = null;
  MoveState moveState = null;
  GameState state = GameState.NEW;
  
  
  WinningCards winners = const WinningCards(
      Room.HALL,
      Weapon.KNIFE,
      Character.GREEN);
  
  GameData.newGame(){
    //TODO randomize winning cards
    resetGame();
  }
  
  void resetGame(){
    state = GameState.NEW;
    players = new Map<Character, PlayerData>();
    String winner = null;
    MoveState moveState = null;
  }
  
  void addPlayer(String name){
    //TODO add new player to game
    if (players.keys.length <= 6){
      var charsAvailable = Character.all.where((char) => !players.keys.contains(char));
      log("charsAvailable: $charsAvailable");
      var randomChar = charsAvailable[getServerRandom().nextInt(charsAvailable.length)];
      log("randomChar: $randomChar");
    }
    
  }
  
  void startGame(){
    //TODO check for valid number of players
    
    //TODO initialize winning cards
    //TODO initialize player hands
    //TODO initialize player locations
    //TODO initialize initial move state
    
    state = GameState.PLAYING;
  }
  
  //TODO return real game data json
  toJSON() => exampleGameJSON();
}

class PlayerData {
  final String name;
  final Character char;
  final Set<Card> hand;
  
  BoardLocation boardLocation;
  
  PlayerData(this.name, this.char, this.hand){
    boardLocation = Board.getStart(char);
    
  }
}

enum MovePhase {MOVE, SUGGESTION, ACCUSATION, CHOOSE_CARD}

class MoveState {
  Character character;
  MovePhase phase;
  MoveState(this.character, this.phase);
}
