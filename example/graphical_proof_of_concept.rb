# requires 'ffmpeg' to be installed

require_relative "../lib/ivory_tower"

file = "#{File.dirname(__FILE__)}/../data/maps/simple.txt"
map = IvoryTower::Map.from_file(file, base_health: 9)

current_tick = 0
renderer = IvoryTower::Map::PNGRenderer.new(map)
renderer.create_base_map

loop do

  system "clear"
  
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

  break if current_tick > 100
  
  renderer.draw_map(current_tick)
  renderer.save_to_file(current_tick)

end

renderer.save_to_movie 

