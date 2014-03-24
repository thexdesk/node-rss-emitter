request = require 'request'
feedparser = require 'feedparser'
levelup = require 'levelup'

{EventEmitter} = require 'events'

class RssEmitter extends EventEmitter
  constructor: (dbName) ->

    @db = levelup dbName

  import: (url) ->

    fp = new feedparser addmeta: false
    self = this

    req = request(url)
    pipe = req.pipe(fp)
    pipe.on 'readable', ->
      item = this.read()

      self.db.get item.guid, (err, value) ->
        if err
          self.db.put item.guid, '.', (err) ->
            self.emit 'item:new', item.guid, item
        else
          self.emit 'item:skipped', item.guid

module.exports = RssEmitter
