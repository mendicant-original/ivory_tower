module IvoryTower
  module Towers
    class ArrowTower
      FIRE_FREQUENCY = 3
      WEAPON_POWER   = 1

      def initialize(map)
        @map = map
      end

      attr_reader   :map
      attr_accessor :location

      def fire(params)
        return unless fire_on_tick?(params[:tick])

        monster = target_monster
        return unless monster
          
        monster.defend_against(self)
      end

      def fire_on_tick?(tick)
        (tick % FIRE_FREQUENCY) == 0
      end
      
      def weapon_power
        WEAPON_POWER
      end

      def target_monster
        tile = target_tile
        return unless tile
        
        tile.occupants.sample
      end

      def target_tile
        neighbors = map.neighbors_of(location, distance: 1)
        neighbors.find { |t| t.occupied? }
      end
    end
  end
end
