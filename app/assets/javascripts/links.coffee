# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#sortlist, #links').sortable(
    axis: 'y'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
      # result = $(this).sortable("serialize");
      # alert(result);
  );
