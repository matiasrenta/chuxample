jQuery ->
  $('.notification_panel').scroll ->
    url = $('.notification_panel a[rel=next]').attr('href')
    if url && $('.notification_panel').scrollTop() > 250 # > 315 # como la ventanita es alto fijo lo he hardcodeado al 315 (la ventana es de 365)
      $('.notification_panel .pagination').text("Fetching more products...")
      $.getScript(url)
  $('.notification_panel').scroll()
