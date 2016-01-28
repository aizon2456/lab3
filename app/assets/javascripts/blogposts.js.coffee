$(document).on 'page:change', -> 
  # initialize current word to an empty string.
  current_word = ""
  $("#blogpost_contents").keypress (e) -> 
    inp = String.fromCharCode(e.which)
    if (inp.match(/\w/i))
      current_word += inp
    else
      if (current_word.match(/\w+/i))
        $.get window.location.origin+"/spellcheck/"+current_word, (data) -> 
          if (!data.known and data.suggestions != null)
            single = data.suggestions.join(",")
            $("#suggest").text("Did you mean: " + single + "?")
          else
            $("#suggest").text("")
        current_word = ""
