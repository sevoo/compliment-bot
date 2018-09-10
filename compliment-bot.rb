class ComplimentBot
  def initialize
    @nouns = ['abundance', 'accomplishment', 'aesthetic',
      'attitude', 'avatar', 'awoo',
      'bravery', 'boldness', 'bounty', 'calculation', 'charm',
      'choice', 'collective', 'commentary', 'cosmology',
      'constellation', 'conviction', 'creation', 'creativity',
      'decision', 'deduction', 'devotion', 'dedication', 'dinosaur', 'elbow',
      'fashion sense', 'favorite', 'foundation', 'friendliness', 'gestalt',
      'hand', 'hypothesis', 'imagination', 'ingenuity', 'intuition',
      'look', 'loyalty', 'manifestation', 'meditation', 'meow', 'method', 'mood',
      'nose', 'passion for justice', 'philosophy', 'polish',
      'praxis', 'protocol', 'persona', 'quirk', 'rawr',
      'refinement', 'respect', 'resolution', 'sense of humor',
      'smile', 'solidarity', 'sunset', 'sincerity', 'shoulder', 'solidarity',
      'toot', 'typography', 'unicorn', 'variety', 'walk', 'work',
    ]
    @adjectives = ['abundant', 'amazing', 'astonishing', 'awe-inspiring',
      'breathtaking', 'beneficial', 'brave', 'bold', 'buoyant',
      'charming', 'creative', 'cool',
      'defined', 'delightful', 'decisive', 'diverse', 'distinguished',
      'enduring', 'elegant', 'epic', 'ethical',
      'exquisite', 'excellent', 'exceptional',
      'friendly', 'fun', 'gracious', 'hilarious', 'humane',
      'ideal', 'immaculate', 'incisive', 'inclusive',
      'inimitable', 'interstellar', 'invigorating', 'judicious',
      'kind', 'lively', 'lovely', 'fetching', 'fresh', 'grand',
      'loyal', 'majestic', 'nifty', 'nurturing', 'organic',
      'peaceful', 'pleasant', 'polished', 'pragmatic', 'probable', 'pure',
      'refreshing', 'reliable', 'respectful',
      'sensible', 'serene', 'smooth', 'soothing', 'solid', 'sparkly',
      'spectacular', 'spirited', 'stellar', 'striking', 'stunning', 'stylish',
      'super', 'superb', 'steadfast', 'thoughtful', 'trusty', 'tubular',
      'unique', 'vibrant', 'vital', 'warm', 'welcoming', 'well-informed',
      'well-maintained', 'wholesome', 'wise', 'wonderful', 'wondrous',
      ]

      @adverbs = ['so ', 'so ', 'so ', 'just ', 'just ',
        'totally ',  'MEGA-', 'really ', 'courteously ', 'truly ',
        '', '', '','','','',] #don't adverb everything

      @superlatives = ['my favorite', 'the coolest', 'the neatest', 'the best',
              'a super', ]

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
    adj = @adjectives.sample
    noun = pick_unlike(adj, @nouns)

    "#{subject} #{noun} is #{adj}!"
  end

  def love_how_you_are_c
    adj = @adjectives.sample
    verb =['like', 'love', 'appreciate'].sample
    "I #{verb} how you're #{adj}."
  end

  def you_are_like_c
    adj = @adjectives.sample
    noun = pick_unlike(adj, @nouns)
    article = 'aAeEiIoOuU'.include?(adj.chars.first) ? 'an' : 'a'
    "You are like #{article} #{adj} #{noun}."
  end

  def you_are_adj_c
    adj = @adjectives.sample
    adverb = @adverbs.sample
    "You are #{adverb}#{adj}!"
  end

    def you_are_my_fave_c
      adj = @adjectives.sample
      noun = pick_unlike(adj, @nouns)
      sup = @superlatives.sample
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
