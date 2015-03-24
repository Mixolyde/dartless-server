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