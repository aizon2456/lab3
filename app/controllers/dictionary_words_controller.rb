require "#{Rails.root}/app/models/web_spellchecker.rb"
class DictionaryWordsController < ApplicationController
  def spellcheck
    spellchecker = WebSpellchecker.new
    input_word = params[:term]
    results = spellchecker.correct(input_word)
    hash_results = {
      "term" => input_word,
      "known" => true,
      "suggestions" => results
    }
    render :json => "#{hash_results}"
  end
end
