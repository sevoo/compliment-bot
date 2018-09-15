class ComplimentBot
  def initialize(words)
    @words = words
  end

  def compliment
    self.public_send(['your_adj_noun_c',
      'you_are_adj_c',
      'love_how_you_are_c',
      'you_are_like_c',
      'you_are_my_fave_c',
      ].sample)
  end

  def your_adj_noun_c
    adj_noun_compliment("Your")
  end

  def adj_noun_compliment(subject)
  adj = @words.adjectives.sample
    noun = pick_unlike(adj, @words.nouns)

    "#{subject} #{noun} is #{adj}!"
  end

  def love_how_you_are_c
    adj = @words.adjectives.sample
    verb =['like', 'love', 'appreciate'].sample
    "I #{verb} how you're #{adj}."
  end

  def you_are_like_c
    adj = @words.adjectives.sample
    noun = pick_unlike(adj, @words.nouns)
    article = 'aAeEiIoOuU'.include?(adj.chars.first) ? 'an' : 'a'
    "You are like #{article} #{adj} #{noun}."
  end

  def you_are_adj_c
    adj = @words.adjectives.sample
    adverb = @words.adverbs.sample
    "You are #{adverb}#{adj}!"
  end

    def you_are_my_fave_c
      adj = @words.adjectives.sample
      noun = pick_unlike(adj, @words.nouns)
      sup = @words.superlatives.sample
      "You are #{sup} #{adj} #{noun}."
    end

#  def name_is_adj_compliment(subject)
#    adj = @adjectives.sample
#    "#{subject} is so #{adj}!"
#  end

  def pick_unlike(substring, set)
    #avoid "boldness is bold" and "creativity is creative" (imperfectly)
    choice = set.sample
    choice = set.sample while choice.include?(substring[0...-1])

    choice
  end

end
