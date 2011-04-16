require_relative "../lib/ivory_tower"

file = "#{File.dirname(__FILE__)}/../data/maps/simple.txt"
map = IvoryTower::Map.from_file(file, base_health: 9)

current_tick = 0

loop do
  system "clear"
  puts "Tick: #{current_tick}"
  
  if current_tick % 3 == 0
    map.rally_points["A"] << IvoryTower::Monsters::BlindMouse.new(map)
  end


  if current_tick % 20 == 0
    random_forest = map.forests.sample
    unless random_forest.tower
      random_forest.build_tower(IvoryTower::Towers::ArrowTower.new(map))
    end
  end

  map.towers.each do |t|
    t.fire(tick: current_tick)
  end

  map.each do |tile|
    if tile.occupied?
      tile.occupants.each { |o| o.move(tick: current_tick) }
    end
  end

  current_tick += 1
  puts IvoryTower::Map::TextFormatter.new(map)
  sleep 0.25
end
