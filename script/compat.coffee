$ ->
  scrollbar_metrics = ClientDetect.scrollbarMetrics()

  # Make sure that the menu is properly offset if we have a document scroll bar
  $('nav > *').cssNoTrans right: scrollbar_metrics.width

  $('document').scrollFix()

DISABLE_TRANSITION = """
  -webkit-transition: none !important;
  -moz-transition:    none !important;
  -o-transition       none !important;
  -ms-transition      none !important;
  transition:         none !important;
"""

Zepto.fn.cssNoTrans = (args...) ->
  @css args...
  finalStyle = @attr 'style'
  finalStyle = '' if finalStyle instanceof CSSStyleDeclaration

  # Apparently setting the JS style properties doesn't catch; so we set the
  # style attribute directly.
  @attr 'style', "#{finalStyle}; #{DISABLE_TRANSITION}"

  # Allow transitions after this run loop iteration
  setTimeout (=> @attr 'style', finalStyle), 0

# Adapted from https://raw.github.com/joelambert/ScrollFix (MIT Licensed)
Zepto.fn.scrollFix = ->
  @each (i, node) ->
    node$ = $(node)
    node$.on 'touchstart', (evt) ->      
      node.scrollTop = 1 if node.scrollTop <= 0

      if node.scrollTop + node.offsetHeight >= node.scrollHeight
        node.scrollTop = node.scrollHeight - node.offsetHeight - 1
