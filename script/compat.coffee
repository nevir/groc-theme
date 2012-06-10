$ ->
  scrollbar_metrics = ClientDetect.scrollbarMetrics()
  
  $('nav > *').cssNoTrans right: scrollbar_metrics.width
