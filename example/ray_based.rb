# The 'ray' gem needs to be installed for this to work
# 

require 'ray'
require_relative "../lib/ivory_tower"

file = "#{File.dirname(__FILE__)}/../data/maps/simple.txt"
map = IvoryTower::Map.from_file(file, base_health: 9)

current_tick = 0

renderer = IvoryTower::Map::RayRenderer.new(map)

def update_map(map,tick)

  if tick % 3 == 0
    map.rally_points["A"] << IvoryTower::Monsters::BlindMouse.new(map)
  end

  if tick % 20 == 0
    random_forest = map.forests.sample
    unless random_forest.tower
      random_forest.build_tower(IvoryTower::Towers::ArrowTower.new(map))
    end
  end

  map.towers.each do |t|
    t.fire(tick: tick)
  end

  map.each do |tile|
    if tile.occupied?
      tile.occupants.each { |o| o.move(tick: tick) }
    end
  end

end

def update_texts(tile, win, x, y)
  case tile
    when IvoryTower::Tile::Base
      if tile.health > 0
        health = tile.health.to_s
        win.draw text(health, :size => 10, :at => [x, y + 40]) 
      end
    else
      unless tile.occupants.empty?
        count = tile.occupants.count.to_s
        win.draw text(count, :size => 10, :at => [x + 20, y + 40])
      end
    end
end

Ray.game "Ivory Tower!",:size => [renderer.map_width, renderer.map_height] do
  register { add_hook :quit, method(:exit!) }

  scene :start do
    always do
      update_map(map,current_tick)
      current_tick += 1

      @text = text "Tick: #{current_tick}", :at => [10,20], :size => 20
    end

    render do |win|  
      renderer.draw_map(current_tick) do |tile, place, x, y|

        win.draw sprite(tile, at: Ray::Vector2[x, y])
        update_texts(place, win, x, y)
      end
      win.draw @text
    end
  end

  scenes << :start
end

