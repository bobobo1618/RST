$(document).ready ()->
    now.userName = prompt 'Enter a username:', ''

    now.receiveMessage = (groupname, sendinguser, message)->
        $('#messages').append '<br/>&lt;'+groupname+':'+sendinguser+'&gt;'+message