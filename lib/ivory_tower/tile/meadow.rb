module IvoryTower
  module Tile
    class Meadow
      include AllowedUnits
      allows :ground_units, :air_units
    end
  end
end
