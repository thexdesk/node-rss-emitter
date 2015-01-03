node-rss-emitter
================

Small module which import RSS feeds and emit events upon new entries

## install

With [npm](http://npmjs.org) do:

```
npm install rss-emitter
```

## example

In JavaScript

```javascript
var RssEmitter = require('rss-emitter');

var emitter = new RssEmitter('feeds.db');

emitter.on('item:new', function(guid, item) {
   return console.log("adding: " + guid, item);
});

emitter.on('item:skipped', function(guid) {
   return console.log("skipping: " + guid);
});

emitter.import('http://thegamelab.tumblr.com/rss');
```

In CoffeeScript

```coffee
RssEmitter = require 'rss-emitter'

emitter = new RssEmitter 'feeds.db'

emitter.on 'item:new', (guid, item) ->
  console.log "adding: #{guid}", item

emitter.on 'item:skipped', (guid) ->
  console.log "skipping: #{guid}"

emitter.import 'http://thegamelab.tumblr.com/rss'
```
