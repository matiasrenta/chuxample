# init datatables

square = () ->
  # event.preventDefault()
  # alert "page has loaded!"
  $('table').DataTable
    autoWidth: false
    info: false
    searching: false
    ordering: false
    paging: false

    responsive:
      details:
        renderer: (api, rowIdx) ->
          data = (api.cells rowIdx, ':hidden').eq(0).map( (cell) ->
            header = $((api.column cell.column).header())
            "<p>#{header.text()}: #{(api.cell cell).data()}</p>"
          ).toArray().join('');
          false
          return if data? then $('<table/>').append( data ) else false

#square()
setTimeout(square, 100)
