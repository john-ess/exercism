class BeerSong
  def verse num
    case num
    when 1..99
      current_bottle    = bottle_text(num)
      remaining_bottles = bottle_text(num - 1)
      action            = action_text(num)
    else
      current_bottle    = 'no more bottles'
      action            = 'Go to the store and buy some more'
      remaining_bottles = '99 bottles'
    end

    line1 = "#{current_bottle.capitalize} of beer on the wall, #{current_bottle} of beer.\n"
    line2 = "#{action}, #{remaining_bottles} of beer on the wall.\n"

    line1 + line2
  end

  def verses high_bottle, low_bottle
    bottles = (low_bottle..high_bottle).to_a.reverse
    bottles.map { |bottle| verse(bottle) }.join("\n")
  end

  def self.all_verses
    verses 99, 1
  end

  private

  def bottle_text num
    (num > 1 ) ? "#{num} bottles": ((num == 1) ? '1 bottle' : 'no more bottles')
  end

  def action_text num
    (num > 1) ? 'Take one down and pass it around' : 'Take it down and pass it around'
  end
end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
