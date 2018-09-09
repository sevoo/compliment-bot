require 'rubygems'
require 'bundler/setup'

require 'mastodon'

require './dummy-client'

if BEARER_TOKEN = ENV['CB_BEARER_TOKEN']
  client = Mastodon::REST::Client.new(base_url: "https://botsin.space", bearer_token: BEARER_TOKEN)
  polite_time_period = 3600 # seconds in an hour
else
  client = DummyClient.new
  polite_time_period = 5 # you can spam STDOUT every 15-30 seconds
end

class ComplimentBot
  def initialize
    @nouns = ["accomplishment", "attitude", "avatar", "awoo",
      "choice", "color", "commentary", "conviction", "creation",
      "decision", "dinosaur", "elbow",
      "fashion sense", "favorite",
      "hand", "intuition", "sense of humor", "kerning",
      "look", "meow", "mood", "nose", "object permanence",
      "passion for justice", "protocol", "persona", "quirk", "respect",
      "smile", "sunset", "sincerity", "shoulder",
      "toot", "typography", "unicorn", "walk", "work",
    ]
    @adjectives = ["amazing", "astonishing", "breathtaking", "brave", "bold",
      "charming", "creative", "cool", "delightful", "distinguished",
      "elegant", "epic", "ethical", "exquisite", "friendly", "fun", "gracious",
      "hilarious", "incisive", "inclusive", "inimitable", "lovely", "fetching",
      "majestic", "my favorite", "nifty",
      "polished", "pure", "refined", "respectful", "sparkly",
      "spectacular", "spirited", "striking", "stunning", "super", "superb",
      "unique", "well-maintained", "wonderful", "wondrous"
      ]
      @intensifiers = ["so ", "so ", "so ", "just ", "just ",
        "totally ",  "MEGA-",
        "", "", "", "", "", "", ""]
  end

  def compliment
    self.public_send(['your_adj_noun_c',
      'you_are_adj_c',
      'love_how_you_are_c',
      'you_are_like_c'].sample)
  end

  def your_adj_noun_c
    adj_noun_compliment("Your")
  end

  def adj_noun_compliment(subject)
    noun = @nouns.sample
    adj = @adjectives.sample
    "#{subject} #{noun} is #{adj}!"
  end

  def you_are_adj_c
    adj = @adjectives.sample
    intensifier = ["so ", "so ", "totally ", "just ", "", "", "", ""].sample
    "You are #{intensifier}#{adj}!"
  end

  def love_how_you_are_c
    adj = @adjectives.sample
    "I love how you're #{adj}."
  end

  def you_are_like_c
    noun = @nouns.sample
    adj = @adjectives.sample
    article = 'aAeEiIoOuU'.include?(adj.chars.first) ? 'an' : 'a'
    "You are like #{article} #{adj} #{noun}."
  end

#  def name_is_adj_compliment(subject)
#    adj = @adjectives.sample
#    "#{subject} is so #{adj}!"
#  end

end

bot = ComplimentBot.new

sleep(ARGV.length > 0 ? ARGV[0].to_i : 0)

while true
  client.create_status(bot.compliment)
  # default when online: wait between 3 and 6 hours
  sleep(rand(3.0)+3*polite_time_period)
end
