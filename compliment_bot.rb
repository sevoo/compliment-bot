require 'rubygems'
require 'bundler/setup'

require 'mastodon'

require './dummy-client'

if BEARER_TOKEN = ENV['CB_BEARER_TOKEN']
  client = Mastodon::REST::Client.new(base_url: "https://botsin.space", bearer_token: BEARER_TOKEN)
else
  client = DummyClient.new
end

class ComplimentBot
  def initialize
    @nouns = ["elbow", "fashion sense", "intuition", "favorite", "sunset", "protocol", "hand", "nose", "toot"]
    @adjectives = ["nifty", "lovely", "creative", "my favorite", "epic", "super", "cool", "superb", "spectacular"]
  end

  def compliment(subject)
    noun = @nouns.sample
    adj = @adjectives.sample
    "#{subject} #{noun} is #{adj}!"
  end

  def praise
    # pick a name
    compliment("#{name}'s")
  end

end

bot = ComplimentBot.new

while true
  client.create_status(bot.compliment("Your"))
  sleep(3600)
end
