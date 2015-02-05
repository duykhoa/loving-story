ready = ->
  # to set summernote object
  # You should change '#page_content' to your textarea input id
  summer_note = $('#page_content')

  # to call summernote editor
  summer_note.summernote
    # to set options
    height:500
    lang: 'ko-KR'
    codemirror:
      lineNumbers: true
      tabSize: 2
      theme: "solarized light"

  # to set code for summernote
  summer_note.code summer_note.val()

  # to get code for summernote
  summer_note.closest('form').submit ->
    # alert $('#page_content').code()
    summer_note.val summer_note.code()
    true

$(document).ready(ready)
$(document).on('page:load', ready)
