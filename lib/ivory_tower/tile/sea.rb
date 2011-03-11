module IvoryTower
  module Tile
    class Sea
      include AllowedUnits
      allows :sea_units
      attr_accessor :map_symbol, :location
    end
  end
end
