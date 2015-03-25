// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library dartless_server_test;

import 'dart:convert';
import 'package:redstone/mocks.dart';
import 'package:redstone/server.dart' as app;
import 'package:unittest/unittest.dart';

import 'package:dartless_server/dartless_server.dart';


void main() {
  //load handlers in server library
  setUp(() => app.setUp([#dartless_server]));

  //remove all loaded handlers
  tearDown(() => app.tearDown());
  
  serverTests();
}

void serverTests() {
  group('server tests', () {
    test('GET server status', () {
      //create a mock request
      var req = new MockRequest("/serverStatus");
      //dispatch the request
      return app.dispatch(req).then((resp) {
        //verify the response
        expect(resp.statusCode, equals(200));
        var content = JSON.decode(resp.mockContent);
        expect(content, containsPair("running", true));
      });
    });
    test('GET index', () {
      //create a mock request
      var req = new MockRequest("/");
      //dispatch the request
      return app.dispatch(req).then((resp) {
        //verify the response
        expect(resp.statusCode, equals(200));
        var content = JSON.decode(resp.mockContent);
        expect(content, "Welcome to the dartless server!");
      });
    });
  });
}
