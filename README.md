# dartless_server

A RESTful server implementation for the Clueless project in Dart.

##What is this?##

This repository contains a simple RESTful server implementation for
playing a modified version of Clue called Clue-less. It was created for
a software engineering class.

##Getting Started##
1. Download the Dart Editor from [dartlang.org](https://www.dartlang.org).
2. Clone this project to a folder.
3. In the Dart Editor, go to File -> "Open Existing Folder" and open the cloned project folder
4. Make sure you have the required dependencies specified in `pubspec.yaml`. If you're missing
any of these, try selecting a file in the project, and then running Tools > Pub Get.

##Running##
1. To run the server right-click on the `main.dart` file and select Run to start the server on your
local machine.
2. Go to `http://localhost:8080/serverStatus` to test that your server is returning data. See `server.dart`
for other routes.

##Testing##
1. To run the unit tests right-click on the `test\all.dart` file and select Run.
You should see console output saying All X tests passed.

Project Status
--------------

### Completed

* Grabbed dart server template and setup in github
* Card and Board constant values
* Initial game data object
* Initial game state actor
* Initial REST routes for getting/submitting data

### Todo

* Lots of unit tests
* Game Logic (game data, players, move logic)
* Multiple simultaneous games allowed
* Move/game history log which stores/logs all moves played
* Server game state CRUD via messages
* Send game data as JSON object
* Receive player info and start game
* Receive move submissions
* Update state on move submission
* Possibly send out a "game over" message directly to clients
* Index web page with instructions and link to client
* Web GUI client
* AI players
* Watch AI-only game
* Auto-refreshing game viewer
* More codeship settings for deploying the server and running application tests

### Routes
Plan for routes to be implemented:

    GET     /                     # Index page, welcome message
    GET     /games                # Get a list of games in progress
    POST    /games                # Post a new game request
    GET     /games/:id            # Get data for a game
    DELETE  /games/:id            # End a game
    PUT     /games/:id/player     # Add a player to a game
    PUT     /games/:id/start      # Start a game if enough players
    GET     /games/:id/move       # Get allowable moves
    PUT     /games/:id/move       # Send a move

Development Tools
-----------------
* [Dart](https://www.dartlang.org) Dart programming language, SDK, and IDE from Google
* [Redstone](http://redstonedart.org) Dart package for doing RESTful web server routes
* [Github](https://github.com/Mixolyde/dartless_server) GIT version control repository
* [Postman](http://www.getpostman.com/) Easy and powerful REST API testing toolkit
* [Codeship](https://codeship.com) Easy automated build and deployment service

Continuous Integration
----------------------
See the current [build project](https://codeship.com/projects/70470), or use Codeship to create your own.

##Build Status##
[ ![Codeship Status for Mixolyde/dartless_server](https://codeship.com/projects/b7c9d290-b46e-0132-a073-4e3657f9ca7f/status?branch=master)](https://codeship.com/projects/70470)
