module IvoryTower
  class Map
    module MappableTile
      attr_accessor :map_symbol, :location
    end

    class << self
      def from_file(file, params)
        from_string(File.read(file), params)
      end

      # FIXME: Would love to remove the class based dependency here
      # also, bit of a god method here...
      def from_string(string, params)
        attributes = { base: nil, rally_points: [], forests: [] }

        data = string.lines.map.with_index do |line, row_number|
          line.chomp.chars.map.with_index do |symbol, col_number|
            tile_class = tile_class_by_symbol(symbol)
            
            tile_object = case 
            when tile_class == IvoryTower::Tile::Base
              attributes[:base] = tile_class.new(params[:base_health])
            when tile_class == IvoryTower::Tile::RallyPoint
              rally_point = tile_class.new(symbol) 
              attributes[:rally_points] << rally_point            

              rally_point
            when tile_class == IvoryTower::Tile::Forest
              forest = tile_class.new
              attributes[:forests] << forest

              forest
            else
              tile_class.new
            end

            tile_object.extend(MappableTile)
            tile_object.map_symbol = symbol
            tile_object.location   = [row_number, col_number]

            tile_object
          end
        end

        new(attributes.merge(tiles: data))
      end

      # FIXME: This doesn't taste right either, replace with a config file?
      def tile_class_by_symbol(symbol)
        case symbol
        when "#"        ; Tile::Mountain
        when "-"        ; Tile::Meadow
        when "w"        ; Tile::Sea
        when "^"        ; Tile::Forest
        when "$"        ; Tile::Base
        when /\A[A-Z]\Z/; Tile::RallyPoint
        else
          raise "Invalid Tile Symbol: #{symbol.inspect}"
        end
      end

      private :new, :tile_class_by_symbol
    end
       
    def initialize(params)
      @tiles        = params[:tiles]
      @base         = params[:base]
      @rally_points = params[:rally_points]
      @forests      = params[:forests]
    end

    attr_reader :tiles, :base, :rally_points, :forests

    def [](row,col)
      @tiles[row][col]
    end
  end
end
