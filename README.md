# Socket.io plugin for pgrest

## Getting Started

PgREST can handle socket.io connection with --websocket flag

    pgrest-websocket --db test --websocket

## Socket.io

You can connect to PgREST with socket.io-client.
All REST api is exposed to socket.io client as well. check [test](test/socket.ls) for usage.

    <script src="http://HOST:PORT/socket.io/socket.io.js"></script>

    <script>
    var socket = io.connect('http://HOST:PORT');
    socket.on("complete", function (data) {
      // data = REST API return value
    });
    socket.emit("GET:foo");
    </script>
    
More importantly, socket.io client can subscribe to a collection. Any new item being inserted into the collection will notify the client.

    var socket = io.connect('http://HOST:PORT');
    s.on("CHANNEL:foo", function (data) {
      // called every time something is inserted into foo
    });
    s.emit("SUBSCRIBE:foo");

## PgBase

PgBase is an attempt to built a firebase-compatible API on top of PgREST

    var ref = new PgBase("http://127.0.0.1:3000/foo");
    ref.on("child_added", function(it) {
        $("#log").append(it.info.bar);
    });

    ref.push({_id:3, info: { bar: "Ke"}});

check out example/pgbase/pgbase.html and client/ref.ls for some infomation.

Document coming soon.

# Used in PgRest APP.

```
require! pgrest
require! pgrest-websocket
pgrest.use pgrest-websocket
app <- pgrest.cli! {}, {}, [], null, null
```

