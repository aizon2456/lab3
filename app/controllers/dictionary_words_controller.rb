require "#{Rails.root}/app/models/web_spellchecker.rb"
require 'json'
class DictionaryWordsController < ApplicationController
  def spellcheck
    spellchecker = WebSpellchecker.new
    input_word = params[:term]
    hash_results = {
      "term" => input_word,
      "known" => spellchecker.known(input_word).any?,
      "suggestions" => spellchecker.correct(input_word)
    }
    render json: hash_results
  end
end
