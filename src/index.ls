{mount-socket} = require \./socket
var plx

# plugin interfaces
export function process-opts (opts)
  opts.websocket = opts.argv.websocket or opts.cfg.websocket

export function isactive (opts)
  opts.websocket?

export function initialize (opts)
  null

export function posthook-cli-create-plx (opts, _plx)
  plx := _plx

export function posthook-cli-create-server (opts, server)
  io = try require 'socket.io'
  throw 'socket.io is required for enabling websocket' unless io
  io = io.listen server
  io.set "log level", 1
  <- mount-socket plx, opts.schema, io

