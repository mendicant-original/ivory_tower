require_relative "../lib/ivory_tower"

file = "#{File.dirname(__FILE__)}/../data/maps/simple.txt"
map = IvoryTower::Map.from_file(file, base_health: 9)

map[3,3].occupants << Object.new
map[3,3].occupants << Object.new
map[3,3].occupants << Object.new

#require "pp"
#pp map

puts IvoryTower::Map::TextFormatter.new(map)
