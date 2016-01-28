class WebSpellchecker < Spellchecker

  # empty constructor
  def initialize
  end

  def known(words)
    return DictionaryWord.where(word: words).map{|x| x[:word]}
  end

end
