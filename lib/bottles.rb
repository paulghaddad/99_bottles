require 'pry'
class Bottles
  MAX_BOTTLE = 99
  MIN_BOTTLE = 0

  def verse(bottles_remaining)
    phrase(bottles_remaining)
  end

  def verses(high_bottle, low_bottle)
    [*low_bottle..high_bottle].reverse.inject("") do |song, bottle_number|
      song += "#{verse(bottle_number)}"
      song += "\n" unless last_bottle?(bottle_number, low_bottle)
      song
    end
  end

  def song
    verses(MAX_BOTTLE, MIN_BOTTLE)
  end

  private

  def phrase(bottles_remaining)
    if bottles_remaining > 1
    <<-VERSE
#{bottles_remaining} bottles of beer on the wall, #{bottles_remaining} bottles of beer.
Take one down and pass it around, #{bottles_remaining - 1} #{pluralize_bottles(bottles_remaining - 1)} of beer on the wall.
VERSE
    elsif bottles_remaining == 1
    <<-VERSE
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
VERSE
    elsif bottles_remaining == 0
    <<-VERSE
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
    VERSE
    end
  end

  def pluralize_bottles(number_of_bottles)
    number_of_bottles > 1 ? "bottles" : "bottle"
  end

  def last_bottle?(bottle_number, low_bottle)
    bottle_number == low_bottle
  end
end
