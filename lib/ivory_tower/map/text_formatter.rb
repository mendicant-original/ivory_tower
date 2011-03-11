module IvoryTower
  class Map
    class TextFormatter
      def initialize(map)
        @map = map
      end

      attr_reader :map

      def to_s
        # NOTE TO STUDENTS: using collect instead of map here just 
        # to avoid term overloading. Enumerable#map is typically the 
        # preferred alias.
        map.tiles.collect do |row|
          row.collect do |tile|
            case tile
            when Tile::Base
              "#{tile.map_symbol}[#{tile.health}]"
            when Tile::Forest
              if tile.tower
                "&(#{tile.occupants.count})"
              else
                "#{tile.map_symbol}(#{tile.occupants.count})"
              end
            else
              "#{tile.map_symbol}(#{tile.occupants.count})"
            end
            
          end.join(" ")
        end.join("\n\n\n")
      end
    end
  end
end
