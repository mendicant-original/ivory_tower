module IvoryTower
  module Tile
    class Base
      extend AllowedUnits::ClassMethods

      allows :air_units, :ground_units, :sea_units

      def self.terrain_type
        :base 
      end

      def initialize(health)
        @health = health
      end

      attr_accessor :health, :map_symbol, :location

      def <<(monster)
        @health -= 1
        monster.die
      end

      def destroyed?
        @health == 0
      end

      def occupied?
        false
      end

      def occupants
        raise NotImplementError, "Base cannot have occupants"
      end
    end
  end
end
