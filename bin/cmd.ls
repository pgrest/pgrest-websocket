``#!/usr/bin/env node``
require! pgrest
pgrest-websocket = require \../
pgrest.use pgrest-websocket
app <- pgrest.cli! {}, {}, [], null, null
