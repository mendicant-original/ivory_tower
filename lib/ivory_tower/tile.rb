require_relative "tile/base"
require_relative "tile/rally_point"
require_relative "tile/meadow"
require_relative "tile/mountain"
require_relative "tile/forest"

module IvoryTower
  module Tile
    extend self

    def base(*a,&b)
      IvoryTower::Tile::Base.new(*a,&b)
    end

    def rally_point(*a, &b)
      IvoryTower::Tile::RallyPoint.new(*a,&b)
    end

    def meadow(*a, &b)
      IvoryTower::Tile::Meadow.new(*a,&b)
    end

    def mountain(*a, &b)
      IvoryTower::Tile::Meadow.new(*a,&b)
    end

    def forest(*a, &b)
      IvoryTower::Tile::Forest.new(*a,&b)
    end
  end
end
