module IvoryTower
  module Tile
    class Mountain
      include AllowedUnits

      allows :air_units
      attr_accessor :map_symbol, :location

      def self.terrain_type
        :mountain
      end
    end
  end
end
