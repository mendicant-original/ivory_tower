module AllowedUnits
  module TestHelpers
    def assert_allows_units(tile, *unit_types)
      unit_types.each do |unit_type|
        assert tile.allows?(unit_type), "Should allow #{unit_type}, but doesn't"
      end
    end 

    def assert_allows_towers(tile)
      assert tile.allows?(:towers), "#{tile} should allow towers, but doesn't"
    end
    
    def refute_allows_towers(tile)
      assert !tile.allows?(:towers), "#{tile} should not allow towers"
    end
  end
end
