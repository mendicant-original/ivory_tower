module AllowedUnits
  module TestHelpers
    def assert_allows_units(tile, *unit_types)
      unit_types.each do |unit_type|
        assert tile.allows?(unit_type), "Should allow #{unit_type}, but doesn't"
      end
    end 
  end
end
