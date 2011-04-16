module IvoryTower
  module Tile
    class Meadow
      include AllowedUnits
      allows :ground_units, :air_units
      attr_accessor :map_symbol, :location

      def self.terrain_type
        :meadow
      end
    end
  end
end
