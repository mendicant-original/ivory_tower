module IvoryTower
  module Monsters
    class BlindMouse
      MOVE_FREQUENCY = 2

      def initialize(map)
        @map    = map
        @health = 5
      end

      attr_reader :map
      attr_accessor :location, :health

      def defend_against(tower)
        self.health = [0, health - tower.weapon_power].max

        die if health == 0 
      end

      def move_on_tick?(tick)
        (tick % MOVE_FREQUENCY) == 0
      end

      def move(params)
        return unless move_on_tick?(params[:tick])

        remove_from_current_tile

        neighbors = map.neighbors_of(location, distance: 1)
        next_tile = neighbors.select { |e| e.allows?(:ground_units) }.sample

        map[*next_tile.location] << self
      end

      def remove_from_current_tile
        @map[*location].occupants.delete(self)
      end

      alias_method :die, :remove_from_current_tile
    end
  end
end
