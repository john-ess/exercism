class BeerSong

  FULL_BAR  = 99
  RESTOCK   = 1
  BEVERAGE  = 'beer'
  LOCATION  = 'on the wall'

  def verse num
    current_bottle    = bottle(num)
    remaining_bottles = bottle(num - 1)
    action            = action(num)

    line1 = "#{current_bottle.capitalize} of #{BEVERAGE} #{LOCATION}, #{current_bottle} of #{BEVERAGE}.\n"
    line2 = "#{action}, #{remaining_bottles} of #{BEVERAGE} #{LOCATION}.\n"

    line1 + line2
  end

  def verses high_bottle, low_bottle
    high_bottle.downto(low_bottle).map(&method(:verse)).join("\n")
  end

  def all_verses
    verses FULL_BAR, RESTOCK
  end

  private
  def bottle num
    return "#{num} bottles"   if num > 1
    return '1 bottle'         if num == 1
    return 'no more bottles'  if num == 0
    "#{FULL_BAR} bottles"
  end

  def action num
    return 'Go to the store and buy some more' if num < 1
    return 'Take it down and pass it around'   if num == 1
    'Take one down and pass it around'
  end
end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
