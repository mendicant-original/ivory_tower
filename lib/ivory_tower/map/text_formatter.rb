module IvoryTower
  class Map
    class TextFormatter
      def initialize(map)
        @map = map
      end

      attr_reader :map

      def to_s
        map.tiles.collect do |row|
          row.collect do |tile|
            case tile
            when Tile::Base
              "#{tile.map_symbol}[#{tile.health}]"
            else
              "#{tile.map_symbol}(#{tile.occupants.count})"
            end
            
          end.join(" ")
        end.join("\n\n\n")
      end
    end
  end
end
