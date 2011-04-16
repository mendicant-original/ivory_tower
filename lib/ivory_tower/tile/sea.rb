module IvoryTower
  module Tile
    class Sea
      include AllowedUnits
      allows :sea_units
      attr_accessor :map_symbol, :location

      def self.terrain_type
        :sea
      end
    end
  end
end
