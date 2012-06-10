window.ClientDetect =
  # Detect the size of the browser's scroll bar.
  scrollbarMetrics: ->
    # **This is an expensive function**, use it only when necessary!
    div$ = $('<div>').css
      width:    '1000px'
      height:   '1000px'
      overflow: 'scroll'
      position: 'absolute'
      left:     '-2000px'
      top:      '-2000px'

    $('body').append div$

    result =
      width:  div$.width() - div$[0].clientWidth
      height: div$.height() - div$[0].clientHeight

    div$.remove()

    result
