# dartless_server

A RESTful server implementation for the Clueless project in Dart.

##What is this?##

This repository contains a simple RESTful server implementation for
playing a modified version of Clue called Clue-less. It was created for
a software engineering class.

##Getting Started##
1. Download the <a href="https://www.dartlang.org/">Dart Editor</a>
2. In the Dart Editor, go to File -> "Open Existing Folder" and open this project folder
3. Make sure you have the required dependencies specified in pubspec.yaml. If you're missing
any of these, try selecting a file in the project, and then running Tools > Pub Get.

##Running##
1. To run the server right-click on the `main.dart` file and select Run to start the server on your
local machine.
2. Go to http://localhost:8080/serverStatus to test that your server is returning data. See `server.dart`
for other routes.

##Routes##
Plan for routes to be implemented:

    GET     /                     # Index page, welcome message
    GET     /games                # Get a list of games in progress
    POST    /games
    GET     /games/:id
    DELETE  /games/:id
    PUT     /games/:id/player
    PUT     /games/:id/start
    GET     /games/:id/move
    PUT     /games/:id/move

##Build Status##
[ ![Codeship Status for Mixolyde/dartless_server](https://codeship.com/projects/b7c9d290-b46e-0132-a073-4e3657f9ca7f/status?branch=master)](https://codeship.com/projects/70470)
