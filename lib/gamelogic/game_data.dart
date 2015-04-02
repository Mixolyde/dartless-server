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
    resetGame();
  }
  
  void resetGame(){
    state = GameState.NEW;
    players = new Map<Character, PlayerData>();
    String winner = null;
    MoveState moveState = null;
  }
  
  void addPlayer(String name){
    if (players.keys.length < 6){
      var charsAvailable = Character.all.where((char) => !players.keys.contains(char));
      var randomChar = charsAvailable.elementAt(
        getServerRandom().nextInt(charsAvailable.length));
      players[randomChar] = new PlayerData(name, randomChar, new Set<Card>());
      log("Added player, updated players: $players");
    }
    
  }
  
  void startGame(){
    if (players.keys.length > 1){
      var winningWeapon = Weapon.all.elementAt(
              getServerRandom().nextInt(Weapon.all.length));
      var winningCharacter = Character.all.elementAt(
                    getServerRandom().nextInt(Character.all.length));
      var winningRoom = Room.all.elementAt(
                    getServerRandom().nextInt(Room.all.length));
      winners = new WinningCards(winningRoom, winningWeapon, winningCharacter);
      
      //TODO initialize player hands
      var deck = gameDeck(winners);
      //deal cards
      int handIndex = 0;
      var count = players.keys.length;
      var hands = new List<Set<Card>>(count);
      //initialize empty hands
      for (var index = 0;index < count;index++){
        hands[index] = new Set<Card>();
      }
      
      //deal cards
      for (var cardInDeck in deck){
        hands[handIndex].add(cardInDeck);
        handIndex = (handIndex + 1) % count;
        
      }
      //assign hands
      List<PlayerData> playerDatas = players.values.toList();
      for(handIndex = 0;handIndex < count;handIndex++){
        playerDatas[handIndex] = new PlayerData(
            playerDatas[handIndex].name,
            playerDatas[handIndex].char,
            hands[handIndex]);
      }
      
      //TODO initialize initial move state
      var firstPlayer = Board.TURN_ORDER.firstWhere(
          (char) => players.keys.contains(char));
      log("$firstPlayer gets first move");
      moveState = new MoveState(firstPlayer, MovePhase.MOVE);
      state = GameState.PLAYING;
      
    }
    
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
  
  String toString() => "Player: $name, Character: $char, at: $boardLocation, holding: $hand";
}

enum MovePhase {MOVE, SUGGESTION, ACCUSATION, CHOOSE_CARD}

class MoveState {
  Character character;
  MovePhase phase;
  MoveState(this.character, this.phase);
}
