#!/usr/bin/env lsc -cj
author:
  name: ['Chieh Po']
  email: 'poga.po@gmail.com'
name: 'pgrest-websocket'
description: 'pgrest plugin for websocket'
version: '0.0.1'
main: \lib/index.js
bin:
  pgrest: 'bin/cmd.js'
repository:
  type: 'git'
#TODO
  url: 'git://github.com/clkao/pgrest.git'
scripts:
  test: """
    mocha
  """
#TODO
  prepublish: """
    lsc -cj package.ls &&
    lsc -bpc bin/cmd.ls > bin/cmd.js &&
    chmod 755 bin/cmd.js &&
    lsc -bc -o lib src &&
    lsc -bc client/ref.ls &&
    browserify client/index.js -o client/dist/pgbase.js
  """
engines: {node: '*'}
dependencies:
  async: \0.2.x
  "socket.io": \*
  "socket.io-client": \*
peerDependencies:
  pgrest: \*
devDependencies:
  mocha: \*
  chai: \*
  LiveScript: \1.2.x
  browserify: \*
  express: \*
  pgrest: \*
