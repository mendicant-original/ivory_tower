module IvoryTower
  module Tile
    class RallyPoint
      include AllowedUnits
      allows :ground_units, :sea_units, :air_units

      def initialize(name)
        @name      = name
      end

      def self.terrain_type
        :rally_point
      end

      attr_reader   :name
      attr_accessor :map_symbol, :location

      def delete(monster)
        occupants.delete(monster)
      end

      def empty?
        occupants.empty?
      end
    end
  end
end
