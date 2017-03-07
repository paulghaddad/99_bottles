require 'pry'
class Bottles
  def verse(bottles_remaining)
    phrase(bottles_remaining)
  end

  def verses(high_bottle, low_bottle)
    song = ""
    high_bottle.downto(low_bottle) do |bottle_number|
      song += "#{verse(bottle_number)}"
      song += "\n" unless bottle_number == low_bottle
    end

    song
  end

  def song
    verses(99, 0)
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
    if number_of_bottles > 1
      "bottles"
    else
      "bottle"
    end
  end
end
