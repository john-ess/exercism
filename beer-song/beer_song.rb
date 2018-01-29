class BeerSong
  def verse num
    case num
    when 3..99
      line1 = "#{num} bottles of beer on the wall, #{num} bottles of beer."
      line2 = "Take one down and pass it around, #{num - 1} bottles of beer on the wall."
    when 2..2
      line1 = "2 bottles of beer on the wall, 2 bottles of beer."
      line2 = "Take one down and pass it around, 1 bottle of beer on the wall."
    when 1..1
      line1 = "1 bottle of beer on the wall, 1 bottle of beer."
      line2 = "Take it down and pass it around, no more bottles of beer on the wall."
    when 0..0
      line1 = "No more bottles of beer on the wall, no more bottles of beer."
      line2 = "Go to the store and buy some more, 99 bottles of beer on the wall."
    end
    return line1 + "\n" + line2 + "\n"
  end

  def verses high_bottle, low_bottle
    bottles = (low_bottle..high_bottle).to_a.reverse
    bottles.map { |bottle| verse(bottle) }.join("\n")
  end

  def self.all_verses
    verses 99, 1
  end
end


module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
