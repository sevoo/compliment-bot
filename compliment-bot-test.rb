require 'minitest/autorun'

require_relative 'compliment-bot'
require_relative 'words'

class ComplimentBotTest < Minitest::Test
  def setup
    @words = Words.new
    @bot = ComplimentBot.new(@words)
  end

  def test_compliment
    assert @bot.compliment != nil
  end

  def test_you_are_my_fave_c
    assert @bot.you_are_my_fave_c.start_with?("You are ")
  end

  def test_your_adj_noun_c
    assert @bot.your_adj_noun_c.start_with?("Your")
  end

  def test_you_are_adj_c
    assert @bot.you_are_adj_c.start_with?("You are")
  end

  def test_love_how_you_are_c
    assert @bot.love_how_you_are_c.include?("how you're")
  end

  def test_you_are_like_c
    assert @bot.you_are_like_c.start_with?("You are like")
  end

  def test_pick_unlike
    assert @bot.pick_unlike('no', ['yes','no']) == 'yes'
  end

end
