module IvoryTower
  module Tile
    class Forest
      include AllowedUnits
      allows :ground_units, :air_units, :towers

      attr_reader :tower

      def build_tower(new_tower)
        raise Errors::TowerPresent if tower

        @tower = new_tower
      end

      def destroy_tower
        raise Errors::TowerNotPresent unless tower

        @tower = nil
      end
    end
  end
end
