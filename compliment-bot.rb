class ComplimentBot
  def initialize
    @nouns = ['accomplishment', 'aesthetic', 'attitude', 'avatar', 'awoo',
      'bravery', 'boldness', 'calculation', 'charm',
      'choice', 'collective', 'color', 'commentary', 'cosmology',
      'conviction', 'creation', 'creativity',
      'decision', 'deduction', 'dinosaur', 'elbow',
      'fashion sense', 'favorite', 'foundation', 'gestalt',
      'hand', 'hypothesis', 'imagination', 'ingenuity', 'intuition',
      'kerning', 'look', 'meditation', 'meow', 'method', 'mood',
      'nose', 'passion for justice', 'philosophy', 'polish',
      'praxis', 'protocol', 'persona', 'quirk',
      'refinement', 'respect', 'resolution', 'sense of humor',
      'smile', 'sunset', 'sincerity', 'shoulder',
      'toot', 'typography', 'unicorn', 'variety', 'walk', 'work',
    ]
    @adjectives = ['amazing', 'astonishing', 'awe-inspiring',
      'breathtaking', 'brave', 'bold',
      'charming', 'creative', 'cool',
      'defined', 'delightful', 'decisive', 'diverse', 'distinguished',
      'enduring', 'elegant', 'epic', 'ethical',
      'exquisite', 'excellent', 'exceptional',
      'friendly', 'fun', 'gracious', 'harmonious', 'hilarious',
      'ideal', 'immaculate', 'incisive', 'inclusive',
      'inimitable', 'interstellar', 'judicious',
      'kind', 'lively', 'lovely', 'fetching', 'fresh', 'grand',
      'majestic', 'nifty', 'organic',
      'pleasant', 'polished', 'pragmatic', 'probable', 'pure',
      'realiable', 'respectful',
      'sensible', 'serene', 'smooth', 'soothing', 'solid', 'sparkly',
      'spectacular', 'spirited', 'stellar', 'striking', 'stunning', 'stylish',
      'super', 'superb', 'thoughtful',
      'unique', 'vibrant', 'warm', 'welcoming',
      'well-maintained', 'wholesome', 'wonderful', 'wondrous',
      ]
      @intensifiers = ['so ', 'so ', 'so ', 'just ', 'just ',
        'totally ',  'MEGA-', 'really ', 'super-',
        '', '', '',]

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
    noun = @nouns.sample
    adj = pick_unlike(noun, @adjectives)

    "#{subject} #{noun} is #{adj}!"
  end

  def you_are_adj_c
    adj = @adjectives.sample
    intensifier = @intensifiers.sample
    "You are #{intensifier}#{adj}!"
  end

  def love_how_you_are_c
    adj = @adjectives.sample
    "I love how you're #{adj}."
  end

  def you_are_like_c
    noun = @nouns.sample
    adj = pick_unlike(noun, @adjectives)
    article = 'aAeEiIoOuU'.include?(adj.chars.first) ? 'an' : 'a'
    "You are like #{article} #{adj} #{noun}."
  end

#  def name_is_adj_compliment(subject)
#    adj = @adjectives.sample
#    "#{subject} is so #{adj}!"
#  end

  def you_are_my_fave_c
    noun = @nouns.sample
    adj = pick_unlike(noun, @adjectives)
    sup = @superlatives.sample
    "You are #{sup} #{adj} #{noun}."
  end

  def pick_unlike(substring, set)
    #avoid "boldness is bold" and "creativity is creative" (imperfectly)
    choice = set.sample
    choice = set.sample while choice.include?(substring[0...-1])

    choice
  end

end
