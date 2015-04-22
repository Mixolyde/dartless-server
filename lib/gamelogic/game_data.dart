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
      List<Character> chars = players.keys.toList();
      for(handIndex = 0;handIndex < count; handIndex++){
        log("Assigning hand number: $handIndex to ${players[chars[handIndex]].name}");
        log("Cards in hand: ${hands[handIndex]}");
        players[chars[handIndex]] = new PlayerData(
            players[chars[handIndex]].name,
            players[chars[handIndex]].char,
            hands[handIndex].toSet());
      }
      
      //TODO initialize initial move state
      var firstPlayer = Board.TURN_ORDER.firstWhere(
          (char) => players.keys.contains(char));
      log("$firstPlayer gets first move");
      moveState = new MoveState(firstPlayer, MovePhase.MOVE);
      state = GameState.PLAYING;
      
    }
    
  }
  
  Map toMap() {
    	Map gameDataMap = {};
      try
      {
        gameDataMap['gameState'] = state;
        if (moveState == null) {
          gameDataMap['moveState'] = "";
        } else {
          gameDataMap['moveState'] = 
            {
              "player" : moveState.player,
              "phase" : moveState.phase
            };
        }
        gameDataMap['winner'] = winner;
        
        List<Map> playerData = [];
        for(PlayerData pd in players.values){
          playerData.add(
            {
              "name" : pd.name,
              "character" : pd.char,
              "active" : pd.isActive,
              "moved" : pd.hasMoved,
              "position" : "${pd.boardLocation.x},${pd.boardLocation.y}",
              "hand" : pd.hand
            });
        }
        gameDataMap['players'] = playerData;

      }
      catch(e){log("Error getting game data map: $e");}
      return gameDataMap;
  }
  
  //TODO return real game data json
  toJSON() => exampleGameJSON();
}

class PlayerData {
  final String name;
  final Character char;
  final Set<Card> hand;
  
  BoardLocation boardLocation;
  bool isActive = true;
  bool hasMoved = false;
  
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
