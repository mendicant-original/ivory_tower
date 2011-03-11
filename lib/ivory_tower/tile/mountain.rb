module IvoryTower
  module Tile
    class Mountain
      include AllowedUnits
      allows :air_units
      attr_accessor :map_symbol, :location
    end
  end
end
