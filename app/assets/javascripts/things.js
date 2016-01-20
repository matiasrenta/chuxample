// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

// TODO add page-specific assets

function export_list() {
  var actionOrigin = $("form[name='filter_form']").attr('action');
  $("form[name='filter_form']").attr('action', actionOrigin + '.xlsx').submit();
  var actionNew = $("form[name='filter_form']").attr('action').slice(0,-5);
  $("form[name='filter_form']").attr('action', actionNew);
}
