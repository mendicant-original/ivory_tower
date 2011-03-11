require_relative "tile/base"
require_relative "tile/rally_point"
require_relative "tile/meadow"
require_relative "tile/mountain"
require_relative "tile/forest"
require_relative "tile/sea"

module IvoryTower
  module Tile
    extend self
    def base(*a,&b)
      Base.new(*a,&b)
    end

    def rally_point(*a, &b)
      RallyPoint.new(*a,&b)
    end

    def meadow(*a, &b)
      Meadow.new(*a,&b)
    end

    def mountain(*a, &b)
      Mountain.new(*a,&b)
    end

    def forest(*a, &b)
      Forest.new(*a,&b)
    end

    def sea(*a, &b)
      Sea.new(*a,&b)
    end
  end
end
