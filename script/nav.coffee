$ ->
  html$     = $('html')
  sections$ = $('nav sections')

  # We also need to make sure that the sections are display: none'd when
  # invisible, so that they don't screw with tap to top behavior on iPhones &
  # iPods.
  should_hide_sections = false
  sections$.on 'transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd', ->
    return unless should_hide_sections
    sections$.children().css display: 'none'

  $('nav menu action').on 'click', (evt) ->
    should_hide_sections = false

    return unless target_section = $(evt.target).data('target-section')

    if html$.hasClass('nav-expanded') and sections$.hasClass("#{target_section}-active")
      should_hide_sections = true
      return html$.removeClass('nav-expanded')

    unless html$.hasClass('nav-expanded')
      sections$.children().cssNoTrans display: 'block'
      html$.addClass('nav-expanded')

    for section in (sections$.children().map (i,n) -> n.nodeName.toLowerCase())
      sections$.removeClass("#{section}-active")

    sections$.addClass("#{target_section}-active")
