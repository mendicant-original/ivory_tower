require 'ray'

module IvoryTower
  class Map
    class RayRenderer
      include Renderer

      def tile_for(name)
        File.join(File.dirname(__FILE__), "/../../../data/tiles/#{name}.png")
      end

      def draw_to_map(x, y, tile, renderable, blk)
        pos_x =  adjusted_x(x)
        pos_y =  adjusted_y(y)

        blk.call(tile, renderable, pos_x, pos_y)
      end

    end
  end
end
