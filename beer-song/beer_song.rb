class BeerSong
  def verse num
    current_bottle    = bottle_text(num)
    remaining_bottles = bottle_text(num - 1)
    action            = action_text(num)

    line1 = "#{current_bottle.capitalize} of beer on the wall, #{current_bottle} of beer.\n"
    line2 = "#{action}, #{remaining_bottles} of beer on the wall.\n"

    line1 + line2
  end

  def verses high_bottle, low_bottle
    high_bottle.downto(low_bottle).map(&method(:verse)).join("\n")
  end

  def all_verses
    verses 99, 1
  end

  private
  def bottle_text num
    return "#{num} bottles"   if num > 1
    return '1 bottle'         if num == 1
    return 'no more bottles'  if num == 0
    '99 bottles'
  end

  def action_text num
    return 'Go to the store and buy some more' if num < 1

    text = (num == 1) ? 'it' : 'one'
    return "Take #{text} down and pass it around"
  end
end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
