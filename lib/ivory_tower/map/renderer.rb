require 'chunky_png'

module IvoryTower
  class Map
    class Renderer

      attr_accessor :map

      TILE_WIDTH  = 101
      TILE_HEIGHT = 121
      TILE_Y_OFFSET = 50

      def initialize(map,tick)
        @map = map

        create_base_map
        render_map(tick)
      end

      def render_map(filename)
        render_tiles
        save_to_file(filename)
      end

      def save_to_file(filename)
        @png.save("#{filename}.png", :fast_rgba)
      end

      def create_base_map
        @png = ChunkyPNG::Image.new(map_width, map_height, ChunkyPNG::Color::PREDEFINED_COLORS[:green])
      end

      def render_tiles
        @map.tiles.collect.with_index do |row,y|
          row.collect.with_index do |tile,x|
            draw_tile(x,y,tile)
          end
        end
      end

      def draw_tile(x,y,tile)
        case tile
        when Tile::Base
          draw_grass(x,y)
          draw_monster(x,y) if tile.occupied?
        when Tile::Forest
          if tile.tower
            draw_tower(x,y)
            draw_monster(x,y) if tile.occupied?
          else
            draw_forest(x,y)
            draw_monster(x,y) if tile.occupied?
          end
        else
          draw_symbol(x,y,tile.map_symbol)
          draw_monster(x,y) if tile.occupied?
        end            
      end

      def draw_monster(x,y)
        tile = tile_for("bug")
        draw_to_map(x, y, tile)        
      end

      def draw_grass(x, y)
        tile = tile_for("grass")
        draw_to_map(x, y, tile)
      end

      def draw_mountain(x, y)
        tile = tile_for("dirt")
        draw_to_map(x, y, tile)
      end

      def draw_meadow(x, y)
        tile = tile_for("brown_block")
        draw_to_map(x, y, tile)      
      end

      def draw_sea(x, y)
        tile = tile_for("water")
        draw_to_map(x, y, tile)      
      end

      def draw_rally(x,y)
        tile = tile_for("star")
        draw_stone(x,y)
        draw_to_map(x, y, tile,true)            
      end

      def draw_stone(x,y)
        tile = tile_for("stone")
        draw_to_map(x, y, tile)            
      end

      def draw_tower(x,y)
        tile = tile_for("wall")
        draw_to_map(x, y, tile)        
      end

      def draw_wood(x,y)
        tile = tile_for("wood")
        draw_to_map(x, y, tile)        
      end

      def draw_forest(x, y)
        tile = tile_for("bush")
        draw_grass(x, y)
        draw_to_map(x, y, tile,true)
      end

      private

      def draw_symbol(x,y,symbol)
        case symbol
        when "#"        ; draw_mountain(x, y)
        when "."        ; draw_meadow(x, y)
        when "~"        ; draw_sea(x, y)
        when "*"        ; draw_forest(x, y)
        when "$"        ; draw_grass(x, y)
        when /\A[A-Z]\Z/; draw_rally(x, y)
        end
      end      

      def tile_for(name)
        ChunkyPNG::Image.from_file("data/tiles/#{name}.png")
      end

      def draw_to_map(x,y,tile,over=false)
        pos_x = x*TILE_WIDTH
        pos_y = y*TILE_HEIGHT - TILE_Y_OFFSET

        pos_y -= TILE_Y_OFFSET*2 if over

        @png.compose!(tile, x*TILE_WIDTH, y*TILE_HEIGHT-TILE_Y_OFFSET)
      end

      def map_width
        @map.columns.size*TILE_WIDTH
      end

      def map_height
        @map.rows.size*TILE_HEIGHT
      end

    end
  end
end