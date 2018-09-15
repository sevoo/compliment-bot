class Words

  attr_reader :nouns, :adjectives, :adverbs, :superlatives

  def initialize
    @nouns = ['abundance', 'accomplishment', 'aesthetic',
      'attitude', 'avatar', 'awoo',
      'bravery', 'boldness', 'bounty', 'calculation', 'charm',
      'choice', 'collective', 'commentary', 'cosmology',
      'constellation', 'conviction', 'creation', 'creativity',
      'decision', 'deduction', 'devotion', 'dedication', 'dinosaur', 'elbow',
      'fashion sense', 'favorite', 'foundation', 'friendliness',
      'generosity', 'gestalt',
      'hand', 'hypothesis', 'imagination', 'ingenuity', 'intuition',
      'kindness', 'look', 'loyalty',
      'manifestation', 'meditation', 'meow', 'method',
      'mood', 'nature', 'nose', 'passion for justice', 'philosophy', 'polish',
      'praxis', 'protocol', 'persona', 'quirk', 'rawr',
      'refinement', 'respect', 'resolution', 'sense of humor',
      'smile', 'solidarity', 'sunset', 'sincerity', 'shoulder', 'solidarity',
      'thoughtfulness', 'toot', 'toy', 'typography', 'unicorn',
      'variety', 'walk', 'work',
    ]
    @adjectives = ['abundant', 'admirable', 'amazing', 'amiable',
      'astonishing', 'awe-inspiring',
      'breathtaking', 'beneficial', 'brave', 'breathtaking', 'bodacious', 'bold',
      'buoyant', 'charming', 'creative', 'compassionate', 'cool', 'dazzling',
      'defined', 'delightful', 'decisive', 'diverse', 'distinguished',
      'enchanting', 'enduring', 'elegant', 'epic', 'ethical',
      'exquisite', 'excellent', 'exceptional', 'fantastic', 'fascinating',
      'friendly', 'fun', 'good', 'gracious', 'heartening', 'hilarious', 'humane',
      'ideal', 'impressive', 'immaculate', 'incisive', 'inclusive',
      'inimitable', 'inspiring', 'interstellar', 'invigorating', 'judicious',
      'kind', 'lively', 'lovely', 'fetching', 'fresh', 'grand',
      'loyal', 'majestic', 'nifty', 'nurturing', 'organic',
      'peaceful', 'phenomenal', 'pleasant', 'polished', 'pragmatic',
      'probable', 'pure', 'refreshing', 'reliable', 'respectful',
      'sagacious', 'sensational',
      'sensible', 'serene', 'smooth', 'soothing', 'solid', 'sparkly',
      'spectacular', 'spellbinding', 'spirited', 'stellar',
      'striking', 'stunning', 'stylish',
      'super', 'superb', 'steadfast', 'thoughtful', 'trusty', 'tubular',
      'unique', 'vibrant', 'vital', 'warm', 'welcoming', 'well-informed',
      'well-maintained', 'wholesome', 'wise', 'wonderful', 'wondrous',
      ]

      @adverbs = ['so ', 'so ', 'so ', 'just ', 'just ',
        'totally ',  'MEGA-', 'really ', 'courteously ', 'truly ', 'perfectly',
        '', '', '','','','',] #don't adverb everything

      @superlatives = ['my favorite', 'the coolest', 'the neatest', 'the best',
              'a super', ]

  end
end
