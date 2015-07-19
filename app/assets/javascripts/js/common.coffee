# init datatables

$('table').DataTable
  autoWidth: false
  paging: false
  searching: false
  info: false
  ordering: false

  responsive:
    details:
      renderer: (api, rowIdx) ->
        data = (api.cells rowIdx, ':hidden').eq(0).map( (cell) ->
          header = $((api.column cell.column).header())
          "<p style='color:#00A'>#{header.text()}: #{(api.cell cell).data()}</p>"
        ).toArray().join('');

        return if data? then $('<table/>').append( data ) else false
