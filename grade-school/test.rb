states = {
  'Oregon' => 'OR',
  'Florida' => 'FL',
  'California' => 'CA',
  'New York' => 'NY',
  'Michigan' => 'MI'
}

cities = {
  'CA' => 'San Francisco',
  'MI' => 'Detroit',
  'FL' => 'Jacksonville'
}

cities['NY'] = 'New York'
cities['OR'] = 'Portland'

puts "NY State has: #{cities['NY']}"
puts "OR State has: #{cities['OR']}"

puts "Michigan's abbreviation is: #{states['Michigan']}"
puts "Florida's abbreviation is: #{states['Florida']}"

states.each do |state, abbrev|
  puts "#{state} is abbreviated #{abbrev}"
end

cities.each do |abbrev, city|
  puts "#{abbrev} has the city #{city}"
end

states.each do |state, abbrev|
  city = cities[abbrev]
  puts "#{state} is abbreviated #{abbrev} and has the city #{city}"
end

state = states['Texas']
if !state
  puts "sorry, no Texas"
end

city = cities['TX']
city ||= 'Does not exist'
puts "The city for the state 'TX' is: #{city}"
