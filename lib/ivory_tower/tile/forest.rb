module IvoryTower
  module Tile
    class Forest
      include AllowedUnits
      allows :air_units, :towers

      attr_reader   :tower
      attr_accessor :map_symbol, :location

      def self.terrain_type
        :forest
      end

      def build_tower(new_tower)
        raise Errors::TowerPresent if tower

        @tower = new_tower
        @tower.location = location
      end

      def destroy_tower
        raise Errors::TowerNotPresent unless tower

        @tower = nil
      end
    end
  end
end
