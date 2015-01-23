@CS = {}

$ ->
  $('#go-to-about').click window.CS.scrollToEl

  $release = $('#release')
  request = $.get 'https://api.github.com/repos/centresource/generator-playbook/tags'
  request.success (data) -> $release.html data[0]['name']
  request.error (jqXHR, textStatus, errorThrown) ->
    $release.html 'available on <a href="https://www.github.com/centresource/generator-playbook/tags">Github</a>'


CS.scrollToEl = (e) ->
  e.preventDefault()
  hash = $(e.currentTarget).attr('href')
  history.pushState(null, null, hash) if history.pushState

  $('html, body').animate
    scrollTop: $('#about').offset().top,
  2000
