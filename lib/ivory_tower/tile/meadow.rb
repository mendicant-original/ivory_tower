module IvoryTower
  module Tile
    class Meadow
      include AllowedUnits
      allows :ground_units, :air_units
      attr_accessor :map_symbol, :location
    end
  end
end
