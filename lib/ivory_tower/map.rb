require_relative "map/text_formatter"

module IvoryTower
  class Map
    include Enumerable

    class << self
      def from_file(file, params)
        from_string(File.read(file), params)
      end

      # FIXME: Would love to remove the class based dependency here
      # also, bit of a god method here...
      def from_string(string, params)
        attributes = { base: nil, rally_points: {}, forests: [] }

        data = string.lines.map.with_index do |line, row_number|
          line.chomp.chars.map.with_index do |symbol, col_number|
            tile_object = new_tile_object(symbol, attributes, params)
            tile_object.map_symbol = symbol
            tile_object.location   = [row_number, col_number]

            tile_object
          end
        end

        new(attributes.merge(tiles: data))
      end

      def new_tile_object(symbol, attributes, params)
        tile_class = tile_class_by_symbol(symbol)
        
        tile_object = case tile_class.terrain_type 
        when :base
          attributes[:base] = tile_class.new(params[:base_health])
        when :rally_point
          rally_point = tile_class.new(symbol) 
          attributes[:rally_points][symbol] = rally_point            

          rally_point
        when :forest
          forest = tile_class.new
          attributes[:forests] << forest

          forest
        else
          tile_class.new
        end
      end

      # FIXME: This doesn't taste right either, replace with a config file?
      def tile_class_by_symbol(symbol)
        case symbol
        when "#"        ; Tile::Mountain
        when "."        ; Tile::Meadow
        when "~"        ; Tile::Sea
        when "*"        ; Tile::Forest
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
    
    def rows
      @tiles
    end

    # Costly, how might we do it better?
    def columns
      @tiles_by_columns ||= @tiles.transpose
    end

    def towers
      forests.map { |e| e.tower }.compact
    end

    def neighbors_of(position, params)
      current_row, current_col = position

      delta = params[:distance] 

      min_row = [current_row - delta, 0].max
      max_row = [current_row + delta, rows.count - 1].min

      min_col = [current_col - delta, 0].max
      max_col = [current_col + delta, columns.count - 1].min

      neighbors = []

      (min_row..max_row).each do |row|
        (min_col..max_col).each do |col|
          neighbors << self[row,col] unless [row,col] == position
        end
      end 

      return neighbors
    end

    def each
      @tiles.flatten.each { |t| yield(t) }
    end
  end
end
