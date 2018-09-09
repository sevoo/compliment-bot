require 'rubygems'
require 'bundler/setup'

require 'mastodon'

require './dummy-client'
require './compliment-bot.rb'

if BEARER_TOKEN = ENV['CB_BEARER_TOKEN']
  client = Mastodon::REST::Client.new(base_url: "https://botsin.space", bearer_token: BEARER_TOKEN)
  polite_time_period = 3600 # seconds in an hour
else
  client = DummyClient.new
  polite_time_period = 5 # you can spam STDOUT every 15-30 seconds
end

bot = ComplimentBot.new

sleep(ARGV.length > 0 ? ARGV[0].to_i : 0)

while true
  client.create_status(bot.compliment)
  # default when online: wait between 3 and 6 hours
  sleep(rand(3.0)+3*polite_time_period)
end
