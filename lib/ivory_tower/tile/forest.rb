module IvoryTower
  module Tile
    class Forest
      include AllowedUnits
      allows :ground_units, :air_units, :towers
    end
  end
end
