$ ->
  html$     = $('html')
  sections$ = $('nav sections')

  $('nav menu action').on 'click', (evt) ->
    return unless target_section = $(evt.target).data('target-section')

    if html$.hasClass('nav-expanded') and sections$.hasClass("#{target_section}-active")
      return html$.removeClass('nav-expanded')

    unless html$.hasClass('nav-expanded')
      sections$.children().cssNoTrans() 
      html$.addClass('nav-expanded')
    
    for section in (sections$.children().map (i,n) -> n.nodeName.toLowerCase())
      sections$.removeClass("#{section}-active")

    sections$.addClass("#{target_section}-active")
