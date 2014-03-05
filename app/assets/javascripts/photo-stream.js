Pusher.log = function(message) {
  if (window.console && window.console.log) {
    window.console.log(message);
  }
};

var pusher = new Pusher('58cfbb27046afbc265f1');
var channel = pusher.subscribe('the_force');

channel.bind('new_photo', function(data) {
  var photoStream = $('#photo-stream').first();
  if (photoStream) {
    var newSection = $('<section>');
    var img = $('<img>').attr('src', data.url);
    var description = $('<p>').html(data.description);
    newSection.append(img).append(description);
    photoStream.prepend(newSection);
  }
});

// Bring also the link tag so it can be clicked
