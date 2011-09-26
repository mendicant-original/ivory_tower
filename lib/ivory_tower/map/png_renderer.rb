require 'oily_png'

module IvoryTower
  class Map
    class PNGRenderer
      include Renderer

      VIEWPORT_OFFSET = 1

      def save_to_file(filename)
        @png.save("#{filename}.png", :fast_rgba)
      end

      def save_to_movie
        system('ffmpeg -i %d.png game.mov')
      end

      def create_base_map
        @png = ChunkyPNG::Image.new(map_width, map_height + VIEWPORT_OFFSET)
      end

      private

      def tile_for(name)
        ChunkyPNG::Image.from_file("data/tiles/#{name}.png")
      end

      def draw_to_map(x, y, tile, renderable, blk)
        pos_x =  adjusted_x(x)
        pos_y =  adjusted_y(y)

        @png.compose!(tile, pos_x, pos_y)
      end

    end
  end
end