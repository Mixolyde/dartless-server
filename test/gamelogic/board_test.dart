library board_test;

import 'package:unittest/unittest.dart';
import 'package:dartless_server/dartless_server.dart';

void main() {
  group('board static data', () {
    test('contains passage', () {
      expect(Board.ALL_PASSAGES, contains(const Passage(Board_Room.STUDY, Board_Room.KITCHEN)));
      expect(Board.ALL_PASSAGES, contains(const Passage(Board_Room.CONSERVATORY, Board_Room.LOUNGE)));
    });
    test('contains hallways', () {
      expect(Board.ALL_HALLWAYS, contains(const Hallway(Board_Room.STUDY, Board_Room.HALL)));
      expect(Board.ALL_HALLWAYS, contains(const Hallway(Board_Room.HALL, Board_Room.LOUNGE)));
    });
    test('Scarlet starts in the hall/lounge hallway', () {
      expect(Board.getStart(Character.SCARLET),
          equals(const Hallway(Board_Room.HALL, Board_Room.LOUNGE)));
    });
  });
}
