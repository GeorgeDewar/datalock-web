$(document).ready -> 
  $('[data-behaviour="datetimepicker"]').datetimepicker()


  maxPanelHeight = Math.max.apply(null, $('.dashboard-panel').map(->
    $(this).height()
    ).get())
  $('.dashboard-panel').css("height", maxPanelHeight)

  maxPanelBodyHeight = Math.max.apply(null, $('.dashboard-panel-body').map(->
    $(this).height()
    ).get())
  $('.dashboard-panel-body').css("height", maxPanelBodyHeight)

  $('#lock_image').click (e) -> 
    $(this).attr("src", "assets/green_lock.jpg")
    setTimeout ->
      $('#lock_image').attr("src", "assets/red_lock.jpg")
    , 1000
    e.preventDefault()