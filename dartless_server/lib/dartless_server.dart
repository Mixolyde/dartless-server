// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The dartless_server library.
library dartless_server;

import 'package:redstone/server.dart' as app;

@app.Route('/serverStatus')
Map getServerStatus()
{
  Map statusMap = {};
  try
  {
    statusMap['running'] = true;
  }
  catch(e){log("Error getting server status: $e");}
  return statusMap;
}

void log(String message)
{
  print("(${new DateTime.now().toString()}) $message");
}

