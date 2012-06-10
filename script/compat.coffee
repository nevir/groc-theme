$ ->
  scrollbar_metrics = ClientDetect.scrollbarMetrics()

  # Make sure that the menu is properly offset if we have a document scroll bar
  $('nav > *').cssNoTrans right: scrollbar_metrics.width
