Pusher.log = function(message) {
  if (window.console && window.console.log) {
    window.console.log(message);
  }
};

var pusher = new Pusher('58cfbb27046afbc265f1');
var channel = pusher.subscribe('the_force');

channel.bind('new_photo', function(data) {
  var newSection = $('<section>');
  var link = $('<a>').attr('href', "/photos/" + data.id);
  var img = $('<img>').attr('src', data.url);
  var description = $('<p>').html(data.description);
  link.append(img);
  newSection.append(link).append(description);
  $('#photo-stream').prepend(newSection);
});


