Pusher.log = function(message) {
      if (window.console && window.console.log) {
        window.console.log(message);
      }
    };

    var pusher = new Pusher('58cfbb27046afbc265f1');
    var channel = pusher.subscribe('the_force');
    channel.bind('new_photo', function(data) {
      alert(data);
    });
