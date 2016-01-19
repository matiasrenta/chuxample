// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

// TODO add page-specific assets

function export_list() {
    alert($("form[name='form_filter']").attr('action') )
  $("form[name='form_filter']").attr('action', $("form[name='form_filter']").attr('action') + '.xlsx');
    alert($("form[name='form_filter']").attr('action') )
  $('#thing_search').submit();
}
