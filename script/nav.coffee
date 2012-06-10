$ ->
  html$     = $('html')
  sections$ = $('nav sections > *')

  $('nav menu action').on 'click', (evt) ->
    return unless target_section = $(evt.target).data('target-section')
    active_section = sections$.filter('.active')[0]?.nodeName.toLowerCase()

    if html$.hasClass('nav-expanded') and active_section == target_section
      return html$.removeClass('nav-expanded')

    html$.addClass('nav-expanded')

    sections$.removeClass('active')
    sections$.filter(target_section).addClass('active')
