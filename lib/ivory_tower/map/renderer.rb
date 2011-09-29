require 'oily_png'

module IvoryTower
  class Map
    module Renderer

      attr_reader :map

      TILE_WIDTH    = 33
      TILE_HEIGHT   = 40
      TILE_Y_OFFSET = 15

      TILESET = { monster:  "bug",
                  grass:    "grass",
                  mountain: "brown_block",
                  meadow:   "dirt",
                  sea:      "water",
                  rally:    "star",
                  stone:    "stone",
                  tower:    "gem_orange",
                  wood:     "wood",
                  forest:   "bush"
                }

      def initialize(map)
        @map = map
      end

      def draw_map(tick, &blk)
        @map.tiles.collect.with_index do |row, y|
          row.collect.with_index do |tile, x|
            symbol = symbol_tile(tile.map_symbol)
            render_to_map(symbol, tile, x, y, blk)
          end
        end        
      end
      
      def render_to_map(symbol, tile, x, y, blk)   
        case tile
        when Tile::Base
          draw_to_map(x, y, tile(:grass), tile, blk)
        when Tile::Forest
          draw_to_map(x, y, tile(:grass), tile, blk)
          draw_to_map(x, y, tile(:forest), tile, blk)
          draw_to_map(x, y, tile(:tower), tile, blk) if tile.tower
        else
          draw_to_map(x, y, symbol, tile, blk)
        end            
        draw_to_map(x, y, tile(:monster), tile, blk) if tile.occupied?
      end

      def tile(symbol)
        tile_for(TILESET[symbol])
      end

      def map_width
        @map.columns.size * TILE_WIDTH
      end

      def map_height
        @map.rows.size * TILE_HEIGHT
      end

      private

      def symbol_tile(symbol)
        case symbol
        when "#"        ; tile(:mountain)
        when "."        ; tile(:meadow)
        when "~"        ; tile(:sea)
        when "*"        ; tile(:forest)
        when "$"        ; tile(:grass)
        when /\A[A-Z]\Z/; tile(:rally)
        end
      end      

      def adjusted_x(x)
        x * TILE_WIDTH
      end

      def adjusted_y(y)
        y * TILE_HEIGHT - TILE_Y_OFFSET
      end

    end
  end
end