jQuery ->
  $('.notification_panel').scroll ->
    url = $('.notification_panel a[rel=next]').attr('href')
    if url && $('.notification_panel').scrollTop() > $('#pindonga').height() - $('.notification_panel').height() - 50
      $('.notification_panel .pagination').text("Fetching more products...")
      $.getScript(url)
  $('.notification_panel').scroll()
