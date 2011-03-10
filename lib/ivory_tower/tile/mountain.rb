module IvoryTower
  module Tile
    class Mountain
      include AllowedUnits
      allows :air_units
    end
  end
end
