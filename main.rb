require 'rubygems'
require 'bundler/setup'

require 'mastodon'

require_relative 'dummy-client'
require_relative 'compliment-bot'
require_relative 'words'

if BEARER_TOKEN = ENV['CB_BEARER_TOKEN']
  client = Mastodon::REST::Client.new(base_url: "https://botsin.space", bearer_token: BEARER_TOKEN)
  polite_time_period = 3600 # seconds in an hour
else
  client = DummyClient.new
  polite_time_period = 5 # you can spam STDOUT every 15-30 seconds
end

words = Words.new
bot = ComplimentBot.new(words)

# unless the command-line specifies otherwise, wait before posting
sleep(ARGV.length > 0 ? ARGV[0].to_i : polite_time_period)

while true
  client.create_status(bot.compliment)
  # $stderr.puts("posted " + Time.now.ctime)
  # default when online: wait between 3 and 6 hours
  sleep((rand(3.0)+3)*polite_time_period)
end
