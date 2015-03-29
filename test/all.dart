// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library all_tests;

import 'dartless_server_test.dart' as dartless_server_test;
import 'gamelogic/card_test.dart' as card_test;
import 'gamelogic/board_test.dart' as board_test;

import 'resources/game_resources_test.dart' as game_resources_test;

import 'actors/game_actor_test.dart' as game_actor_test;

void main() {
  dartless_server_test.main();
  card_test.main();
  board_test.main();
  
  game_resources_test.main();
  
  game_actor_test.main();
  
  print("Tests Successful");
}
