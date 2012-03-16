(function() {

  $(document).ready(function() {
    now.userName = prompt('Enter a username:', '');
    return now.receiveMessage = function(groupname, sendinguser, message) {
      return $('#messages').append('<br/>&lt;' + groupname + ':' + sendinguser + '&gt;' + message);
    };
  });

}).call(this);
