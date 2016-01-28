class DictionaryWordsController < ApplicationController
  def spellcheck
    input_word = params[:terms]
    puts("we want to check the word" + input_word)
  end
end
