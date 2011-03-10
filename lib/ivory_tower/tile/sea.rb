module IvoryTower
  module Tile
    class Sea
      include AllowedUnits
      allows :sea_units
    end
  end
end
