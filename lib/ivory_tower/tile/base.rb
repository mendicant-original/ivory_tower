module IvoryTower
  module Tile
    class Base
      extend AllowedUnits::ClassMethods

      allows :air_units, :ground_units, :sea_units

      def initialize(health)
        @health = health
      end

      attr_accessor :health

      def <<(monster)
        @health -= 1
      end

      def destroyed?
        @health == 0
      end
    end
  end
end
