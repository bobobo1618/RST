require 'coffee-script'
express = require 'express'
now = require 'now'

config = require './Config'

app = express.createServer()

app.configure ()->
    app.use '/static', express.static __dirname + '/Static'
    app.use express.logger()
    app.use express.bodyParser {uploadDir: './Uploads', keepExtensions: true}
    app.set setting, value for setting, value of config.esettings

everyone = now.initialize app

app.get '/', (req, res)->
    res.render 'Home'

everyone.now.sendMessage = (groupname, message)->
    group = now.getGroup groupname
    sendinguser = now.userName
    group.getUsers (users)->
        user.receiveMessage groupname, sendinguser, message for user in users

everyone.now.joinGroup = (id, groupname)->
    group = now.getGroup groupname
    group.addUser id

app.listen config.port, config.host

console.log 'Listening on '+config.host.toString()+':'+config.port.toString()