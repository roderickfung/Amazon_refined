// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  $(document).on('turbolinks:load', function(){
    var reset_class = function(){
      $('#star-5 i, #star-4 i,#star-3 i, #star-2 i, #star-1 i').attr('class', 'glyphicon glyphicon-star-empty');
    };

    $('#star-1').click(function(){
      reset_class();
      $('#star-1 i').toggleClass('glyphicon-star-empty glyphicon-star');
      $('#star-count').val('1');
    });

    $('#star-2').click(function(){
      reset_class();
      $('#star-2 i, #star-1 i').toggleClass('glyphicon-star-empty glyphicon-star');
      $('#star-count').val('2');
    });

    $('#star-3').click(function(){
      reset_class();
      $('#star-3 i, #star-2 i, #star-1 i').toggleClass('glyphicon-star-empty glyphicon-star');
      $('#star-count').val('3');
    });

    $('#star-4').click(function(){
      reset_class();
      $('#star-4 i, #star-3 i, #star-2 i, #star-1 i').toggleClass('glyphicon-star-empty glyphicon-star');
      $('#star-count').val('4');
    });

    $('#star-5').click(function(){
      reset_class();
      $('#star-5 i, #star-4 i, #star-3 i, #star-2 i, #star-1 i').toggleClass('glyphicon-star-empty glyphicon-star');
      $('#star-count').val('5');
    });
  });
});
